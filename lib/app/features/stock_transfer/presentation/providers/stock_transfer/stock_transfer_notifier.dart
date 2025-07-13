import 'dart:developer';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/data/model/stock_transfer_request_model.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_cart_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_state.dart';
import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';
import 'package:easy_vat_v2/app/features/store/presentation/providers/store_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final stockTransferProvider =
    StateNotifierProvider<StockTransferNotifier, StockTransferState>((ref) {
  return StockTransferNotifier();
});

class StockTransferNotifier extends StateNotifier<StockTransferState> {
  StockTransferNotifier() : super(StockTransferState.initial()) {
    _loadTaxPreference();
  }

  List<StockTransferCartEntity> itemsList = [];
  double subTotal = 0.0;
  double totalTax = 0.0;
  double discount = 0.0;
  double roundOf = 0.0;
  double totalNetCost = 0.0;
  double totalSellValue = 0.0;
  double totalItemGrossAmont = 0.0;
  String stockTransferNo = "";
  DateTime stockTransferDate = DateTime.now();
  String refNo = "";
  StoreEntity? fromStore;
  StoreEntity? toStore;
  String stockTransferIDPK = PrefResources.emptyGuid;
  String notes = "";
  bool isForEdit = false;
  bool isTaxEnabled = true;

  Future<void> _loadTaxPreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      isTaxEnabled = prefs.getBool("isTaxEnabled") ?? true;
      state = state.copyWith(isTaxEnabled: isTaxEnabled);
    } catch (e) {
      isTaxEnabled = true;
    }
  }

  Future<void> setTaxEnabled(bool enabled) async {
    isTaxEnabled = enabled;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isTaxEnabled", enabled);
    } catch (e) {
      log("Error saving tax preference: $e");
    }

    state = state.copyWith(isTaxEnabled: isTaxEnabled);

    _recalculateTotals();
  }

  void addItemsIntoCart({required StockTransferCartEntity item}) {
    itemsList.add(item);
    getRateSplitUp(item: item);
    state = state.copyWith(itemList: itemsList);
  }

  void removeItemFromCart({required int index}) {
    if (index >= 0 && index < itemsList.length) {
      final StockTransferCartEntity removedItem = itemsList[index];
      _decreaseRateSplitUp(item: removedItem);
      itemsList.removeAt(index);
      state = state.copyWith(itemList: itemsList);
    }
  }

  void _recalculateTotals() {
    totalNetCost = 0.0;
    subTotal = 0.0;
    totalTax = 0.0;

    for (final item in itemsList) {
      getRateSplitUp(item: item, isInitial: true);
    }
  }

  void updateCartItem({required StockTransferCartEntity cartItem}) {
    final index =
        itemsList.indexWhere((item) => cartItem.cartItemId == item.cartItemId);
    if (index != -1) {
      final oldItem = itemsList[index];
      _decreaseRateSplitUp(item: oldItem);

      final netTotal = cartItem.transferQty * cartItem.cost;
      final sellValue = cartItem.transferQty * cartItem.retailRate;

      final updatedItem = StockTransferCartEntity(
          cartItemId: cartItem.cartItemId,
          item: cartItem.item,
          transferQty: cartItem.transferQty,
          netCost: netTotal,
          requestedQty: cartItem.requestedQty,
          cost: cartItem.cost,
          unit: cartItem.unit,
          description: cartItem.description,
          retailRate: cartItem.retailRate,
          sellValue: sellValue);

      itemsList[index] = updatedItem;
      getRateSplitUp(
        item: updatedItem,
      );
      state = state.copyWith(itemList: itemsList);
    }
  }

  Future<StockTransferRequestModel> createNewStockTransfer() async {
    double totalNetCost = 0.0;
    double totalSellValue = 0.0;
    final List<StockTransferDetails> items = [];
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();

    final companyDetails =
        await AppCredentialPreferenceHelper().getCompanyInfo();

    for (var i = 0; i < itemsList.length; i++) {
      final netCost = (itemsList[i].transferQty * itemsList[i].cost);
      final sellValue = (itemsList[i].transferQty * itemsList[i].retailRate);
      totalNetCost += netCost;
      totalSellValue += sellValue;

      final item = StockTransferDetails(
          stockTransferIDPK: stockTransferIDPK,
          itemIDPK: itemsList[i].item.itemIdpk ?? "",
          barcode: itemsList[i].item.barcode ?? "",
          itemCode: itemsList[i].item.itemCode ?? "",
          itemName: itemsList[i].item.itemName ?? "",
          description: itemsList[i].item.description ?? "",
          unit: itemsList[i].unit,
          currentStock: itemsList[i].transferQty,
          requestedQty: itemsList[i].transferQty,
          transferQty: itemsList[i].transferQty,
          retailRate: itemsList[i].retailRate,
          cost: itemsList[i].cost,
          netCost: netCost,
          sellValue: sellValue,
          rowguid: PrefResources.emptyGuid,
          companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid);
      items.add(item);
    }
    final newStockTransfer = StockTransferRequestModel(
        stockTransferIDPK: stockTransferIDPK,
        transferDate: stockTransferDate,
        transferNo: 0,
        referenceNo: refNo,
        requestIDPK: PrefResources.emptyGuid,
        requestNo: "",
        requestBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        fromStoreIDPK: fromStore?.storeIDPK ?? PrefResources.emptyGuid,
        toStoreIDPK: toStore?.storeIDPK ?? PrefResources.emptyGuid,
        totalNetCost: totalNetCost,
        totalSellValue: totalSellValue,
        remarks: notes,
        isEditable: true,
        isCanceled: false,
        createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        createdDate: stockTransferDate,
        modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedDate: DateTime.now(),
        rowguid: PrefResources.emptyGuid,
        companyIDPK: companyDetails?.companyIdpk ?? PrefResources.emptyGuid,
        fromStoreName: fromStore?.storeName ?? "",
        toStoreName: toStore?.storeName ?? "",
        stockTransferDetails: items);
    log("NewStock: $newStockTransfer");
    return newStockTransfer;
  }

  void clearCart() {
    itemsList.clear();
    totalNetCost = 0.0;
    totalSellValue = 0.0;
    stockTransferNo = "";
    stockTransferDate = DateTime.now();
    refNo = "";
    fromStore = null;
    toStore = null;
    notes = "";
    isForEdit = false;
    stockTransferIDPK = PrefResources.emptyGuid;
    state = StockTransferState.initial().copyWith(isTaxEnabled: isTaxEnabled);
  }

  setStockTransferNo(String stockTransferNo) {
    this.stockTransferNo = stockTransferNo;
    state = state.copyWith(stockTransferNo: stockTransferNo);
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
    state = state.copyWith(refNo: refNo);
  }

  setStockTransferIDPK(String stockTransferIDPK) {
    this.stockTransferIDPK = stockTransferIDPK;
  }

  setStockTransferDate(DateTime stockTransferDate) {
    this.stockTransferDate = stockTransferDate;
    state = state.copyWith(stockTransferDate: stockTransferDate);
  }

  setFromStore(StoreEntity fromStore) {
    this.fromStore = fromStore;
    state = state.copyWith(fromStore: fromStore);
  }

  setToStore(StoreEntity toStore) {
    this.toStore = toStore;
    state = state.copyWith(toStore: toStore);
  }

  setNotes(String notes) {
    this.notes = notes;
    state = state.copyWith(notes: notes);
  }

  setEditMode(bool enableEdit) {
    isForEdit = enableEdit;
    state = state.copyWith(isForUpdate: isForEdit);
  }

  double calculateBeforeTax({required double retailRate, required double qty}) {
    final priceBeforeTax = qty * retailRate;
    return priceBeforeTax;
  }

  double calculateTotalTax(
      {required double retailRate,
      required double qty,
      required double taxPercentage}) {
    if (!isTaxEnabled) return 0.0;

    double taxAmount = ((qty * retailRate) * taxPercentage) / 100;
    return taxAmount;
  }

  double calculateGross({
    required double retailRate,
    required double qty,
  }) {
    double grossAmount = (qty * retailRate);
    return grossAmount;
  }

  double calculateNetTotal({required double grossTotal, required double tax}) {
    return grossTotal + (isTaxEnabled ? tax : 0.0);
  }

  ItemEntity covertStockTransferDetailsToItem(
      StockTransferDetailsEntity stockTransferDetails) {
    return ItemEntity(
        itemIdpk: stockTransferDetails.itemIDPK,
        barcode: stockTransferDetails.barcode,
        itemCode: stockTransferDetails.itemCode,
        description: stockTransferDetails.description,
        unit: stockTransferDetails.unit,
        cost: stockTransferDetails.cost?.toDouble(),
        retailRate: stockTransferDetails.sellValue?.toDouble(),
        currentStock: stockTransferDetails.currentStock?.toDouble());
  }

  reinsertStockTransferForm(
    StockTransferListEntity stockTransfer,
    WidgetRef ref,
  ) async {
    clearCart();
    setEditMode(true);
    List<StockTransferCartEntity> updateItemsList = [];
    ref.read(storeProvider.notifier).getStore();
    setStockTransferIDPK(stockTransfer.stockTransferIDPK ?? "");
    setRefNo(stockTransfer.referenceNo ?? "");
    setStockTransferDate(stockTransfer.transferDate ?? DateTime.now());
    setStockTransferNo(stockTransfer.transferNo?.toString() ?? "");
    setNotes(stockTransfer.remarks ?? "");

    final fromStore = StoreEntity(
      storeIDPK: stockTransfer.fromStoreIDPK,
      storeName: stockTransfer.fromStoreName,
    );

    final toStore = StoreEntity(
      storeIDPK: stockTransfer.toStoreIDPK,
      storeName: stockTransfer.toStoreName,
    );
    log('From Store: ${fromStore.storeName}');
    log('To Store: ${toStore.storeName}');

    setFromStore(fromStore);
    setToStore(toStore);

    if (stockTransfer.stockTransferDetails?.isNotEmpty == true) {
      for (var index = 0;
          index < stockTransfer.stockTransferDetails!.length;
          index++) {
        final stockTransferDetails = stockTransfer.stockTransferDetails![index];
        final itemEntity =
            covertStockTransferDetailsToItem(stockTransferDetails);

        // final totalTax = isTaxEnabled
        //     ? calculateTotalTax(
        //         retailRate: itemEntity.retailRate ?? 0.0,
        //         qty: stockTransferDetails.transferQty?.toDouble() ?? 0.0,
        //         taxPercentage: itemEntity.taxPercentage ?? 0.0)
        //     : 0.0;

        // final grossTotal = calculateGross(
        //   retailRate: itemEntity.retailRate ?? 0.0,
        //   qty: stockTransferDetails.transferQty?.toDouble() ?? 0.0,
        // );

        // final netTotal =
        //     calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

        final cartItem = StockTransferCartEntity(
          cartItemId: (index + 1),
          item: itemEntity,
          transferQty: stockTransferDetails.transferQty?.toDouble() ?? 0.0,
          netCost: stockTransferDetails.netCost?.toDouble() ?? 0.0,
          retailRate: itemEntity.retailRate ?? 0.0,
          cost: itemEntity.cost ?? 0.0,
          unit: itemEntity.unit ?? "",
          description: stockTransferDetails.description ?? "",
          sellValue: stockTransferDetails.sellValue?.toDouble() ?? 0.0,
          requestedQty: stockTransferDetails.requestedQty?.toDouble() ?? 0.0,
        );

        updateItemsList.add(cartItem);
        getRateSplitUp(item: cartItem);
        itemsList = updateItemsList;
      }
    }
    updateState();
  }

  void getRateSplitUp(
      {required StockTransferCartEntity item, bool isInitial = false}) {
    totalNetCost += item.cost * item.transferQty;
    totalSellValue += item.retailRate * item.transferQty;
    if (!isInitial) {
      state = state.copyWith(
          totalNetCost: totalNetCost, totalSellValue: totalSellValue);
    }
  }

  void _decreaseRateSplitUp({required StockTransferCartEntity item}) {
    totalNetCost -= item.cost * item.transferQty;
    totalSellValue -= item.retailRate * item.transferQty;
    state = state.copyWith(
        totalNetCost: totalNetCost, totalSellValue: totalSellValue);
  }

  void filterCartItems(String query) {
    if (query.isNotEmpty) {
      state = state.copyWith(
        itemList: itemsList
            .where((item) =>
                item.item.itemName!.toLowerCase().contains(query.toLowerCase()))
            .toList(),
        isTaxEnabled: isTaxEnabled,
      );
    } else {
      state = state.copyWith(
        itemList: itemsList,
        isTaxEnabled: isTaxEnabled,
      );
    }
  }

  updateState() {
    state = state.copyWith(
      toStore: toStore,
      fromStore: fromStore,
      itemList: itemsList,
      totalNetCost: totalNetCost,
      totalSellValue: totalSellValue,
      isTaxEnabled: isTaxEnabled,
    );
  }
}
