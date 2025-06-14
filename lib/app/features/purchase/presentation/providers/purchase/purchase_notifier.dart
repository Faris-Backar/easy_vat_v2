import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_return_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchased_item_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_return_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/purchase/purchase_state.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/providers/supplier_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final purchaseProvider =
    StateNotifierProvider<PurchaseNotifier, PurchaseState>((ref) {
  return PurchaseNotifier();
});

class PurchaseNotifier extends StateNotifier<PurchaseState> {
  PurchaseNotifier() : super(PurchaseState.initial());

  String? purchaseNo = "";
  DateTime purchaseDate = DateTime.now();
  String supInvNo = "";
  LedgerAccountEntity? cashAccount;
  LedgerAccountEntity? purchaseAccount;
  String notes = "";
  SalesManEntity? purchasedBy;
  double totalItemGrossAmont = 0.0;
  String shippingAddress = "";
  bool isForEdit = false;
  bool isTaxEnabled = true;
  String purchaseIdpk = PrefResources.emptyGuid;
  String purchaseMode = "";
  SupplierEntity? selectedSupplier;

  setPurchaseNo(String purchaseNo) {
    this.purchaseNo = purchaseNo;
    state = state.copyWith(purchaseNo: purchaseNo);
  }

  setPurchaseIdpk(String purchaseIdpk) {
    this.purchaseIdpk = purchaseIdpk;
  }

  setPurchaseDate(DateTime purchaseDate) {
    this.purchaseDate = purchaseDate;
    state = state.copyWith(purchaseDate: purchaseDate);
  }

  setPurchaseMode(String purchaseMode) {
    this.purchaseMode = purchaseMode;
    state = state.copyWith(purchaseMode: purchaseMode);
  }

  setSupInvNo(String supInvNo) {
    this.supInvNo = supInvNo;
    state = state.copyWith(supInvNo: supInvNo);
  }

  setPurchasedBy(SalesManEntity purchasedBy) {
    this.purchasedBy = purchasedBy;
    state = state.copyWith(purchasedBy: purchasedBy);
  }

  setCashAccount(LedgerAccountEntity cashAccount) {
    this.cashAccount = cashAccount;
    state = state.copyWith(cashAccount: cashAccount);
  }

  setPurchaseAccount(LedgerAccountEntity purchaseAccount) {
    this.purchaseAccount = purchaseAccount;
    state = state.copyWith(purchaseAccount: purchaseAccount);
  }

  setNotes(String notes) {
    this.notes = notes;
  }

  setSupplier(SupplierEntity supplier) {
    selectedSupplier = supplier;
    state = state.copyWith(selectedSupplier: selectedSupplier);
  }

  setEditMode(bool enableEdit) {
    isForEdit = enableEdit;
    state = state.copyWith(isForUpdate: isForEdit);
  }

  clearPurchase(WidgetRef ref) {
    ref.read(cartProvider.notifier).clearCart();
    state = PurchaseState.initial();
  }

  Future<PurchaseInvoiceModel> createNewPurchaseInvoice(WidgetRef ref) async {
    final cartPrvdr = ref.read(cartProvider.notifier);
    double itemTotalTax = 0.0;
    double netTotal = 0.0;
    final List<PurchasedItemModel> items = [];
    List<CartEntity> itemsList = cartPrvdr.itemsList;
    bool isTaxEnabled = cartPrvdr.isTaxEnabled;
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    for (var i = 0; i < itemsList.length; i++) {
      final grossTotal =
          (itemsList[i].item.retailRate ?? 0.0 * itemsList[i].qty);

      final taxAmount = isTaxEnabled
          ? ((itemsList[i].qty * itemsList[i].rate) *
                  (itemsList[i].item.taxPercentage ?? 0.0)) /
              100
          : 0.0;

      cartPrvdr.totalItemGrossAmont += grossTotal;
      itemTotalTax += taxAmount;
      netTotal += (grossTotal + taxAmount);

      final item = PurchasedItemModel(
          purchaseIdpk: cartPrvdr.salesIdpk,
          itemIdpk: itemsList[i].item.itemIdpk ?? "",
          barcode: itemsList[i].item.barcode ?? "",
          itemCode: itemsList[i].item.itemCode ?? "",
          itemName: itemsList[i].item.itemName ?? "",
          description: itemsList[i].item.description ?? "",
          unit: itemsList[i].unit,
          actualQty: itemsList[i].qty,
          billedQty: itemsList[i].qty,
          cost: itemsList[i].cost,
          sellingPrice: itemsList[i].rate,
          discount: itemsList[i].discount,
          grossTotal: grossTotal,
          taxAmount: taxAmount,
          taxPercentage:
              isTaxEnabled ? (itemsList[i].item.taxPercentage ?? 0.0) : 0.0,
          netTotal: grossTotal + (isTaxEnabled ? taxAmount : 0.0),
          currentStock: itemsList[i].item.currentStock ?? 0.0,
          profitPercentage: 0.0,
          expiryDate: purchaseDate,
          storeIdfk: userDetailsFromPrefs?.storeDetails?.storeIdpk ??
              PrefResources.emptyGuid,
          importId: PrefResources.emptyGuid,
          rowguid: PrefResources.emptyGuid,
          goodsReceiptIdpk: PrefResources.emptyGuid,
          purchaseOrderIdpk: PrefResources.emptyGuid);
      items.add(item);
    }

    final newPurchase = PurchaseInvoiceModel(
        purchaseIdpk: purchaseIdpk,
        deliveryNo: "0",
        genaralNote: "",
        grnNo: "0",
        purchaseDate: purchaseDate,
        createdDate: purchaseDate,
        createdBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedBy: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
        purchaseMode: purchaseMode,
        discount: cartPrvdr.discount,
        grossAmount: cartPrvdr.totalItemGrossAmont,
        netTotal: netTotal,
        referenceNo: supInvNo,
        purchasedItem: items,
        remarks: notes,
        tax: isTaxEnabled ? itemTotalTax : 0.0,
        purchasedBy: purchasedBy?.empName,
        crLedgerIdfk: purchaseAccount?.ledgerIdpk ?? PrefResources.emptyGuid,
        drLedgerIdfk: selectedSupplier?.ledgerIDPK ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        supplierName: selectedSupplier?.ledgerName,
        supplierIdfk: selectedSupplier?.ledgerIDPK ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        purchaseNo: 0,
        isEditable: true,
        isCanceled: false,
        isLockVoucher: false,
        lpoNo: "",
        quotationNo: "",
        vehicleNo: "",
        modifiedDate: DateTime.now(),
        roundOff: cartPrvdr.roundOf,
        supplierInvoiceNo: "0");
    return newPurchase;
  }

  Future<PurchaseReturnModel> createNewPurchaseReturn(WidgetRef ref) async {
    final cartPrvdr = ref.read(cartProvider.notifier);
    double itemTotalTax = 0.0;
    double netTotal = 0.0;
    final List<PurchaseReturnedItemModel> items = [];
    List<CartEntity> itemsList = cartPrvdr.itemsList;
    bool isTaxEnabled = cartPrvdr.isTaxEnabled;
    final userDetailsFromPrefs =
        await AppCredentialPreferenceHelper().getUserDetails();
    for (var i = 0; i < itemsList.length; i++) {
      final grossTotal =
          (itemsList[i].item.retailRate ?? 0.0 * itemsList[i].qty);

      final taxAmount = isTaxEnabled
          ? ((itemsList[i].qty * itemsList[i].rate) *
                  (itemsList[i].item.taxPercentage ?? 0.0)) /
              100
          : 0.0;

      cartPrvdr.totalItemGrossAmont += grossTotal;
      itemTotalTax += taxAmount;
      netTotal += (grossTotal + taxAmount);

      final item = PurchaseReturnedItemModel(
          purchaseReturnIDPK: purchaseIdpk,
          itemIDPK: itemsList[i].item.itemIdpk ?? PrefResources.emptyGuid,
          barcode: itemsList[i].item.barcode ?? "",
          itemCode: itemsList[i].item.itemCode ?? "",
          itemName: itemsList[i].item.itemName ?? "",
          description: itemsList[i].item.description ?? "",
          unit: itemsList[i].unit,
          actualQty: itemsList[i].qty,
          billedQty: itemsList[i].qty,
          cost: itemsList[i].cost,
          sellingPrice: itemsList[i].rate,
          discount: itemsList[i].discount,
          grossTotal: grossTotal,
          taxAmount: taxAmount,
          taxPercentage:
              isTaxEnabled ? (itemsList[i].item.taxPercentage ?? 0.0) : 0.0,
          netTotal: grossTotal + (isTaxEnabled ? taxAmount : 0.0),
          currentStock: itemsList[i].item.currentStock ?? 0.0,
          storeIDFK: userDetailsFromPrefs?.storeDetails?.storeIdpk ??
              PrefResources.emptyGuid);
      items.add(item);
    }

    final newPurchase = PurchaseReturnModel(
        purchaseReturnIDPK: purchaseIdpk,
        purchaseReturnDate: purchaseDate,
        createdDate: purchaseDate,
        createdByID: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        modifiedByID: userDetailsFromPrefs?.userIdpk ?? PrefResources.emptyGuid,
        rowguid: PrefResources.emptyGuid,
        purchaseReturnMode: purchaseMode,
        discount: cartPrvdr.discount,
        grossAmount: cartPrvdr.totalItemGrossAmont,
        netTotal: netTotal,
        referenceNo: supInvNo,
        returnedItems: items,
        remarks: notes,
        tax: isTaxEnabled ? itemTotalTax : 0.0,
        crLedgerIDFK: purchaseAccount?.ledgerIdpk ?? PrefResources.emptyGuid,
        drLedgerIDFK: selectedSupplier?.ledgerIDPK ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        supplierName: selectedSupplier?.ledgerName,
        supplierIDFK: selectedSupplier?.ledgerIDPK ??
            cashAccount?.ledgerIdpk ??
            PrefResources.emptyGuid,
        purchaseNo: "0",
        isEditable: true,
        purchaseIDFK: purchaseIdpk,
        purchaseReturnNo: 0,
        modifiedDate: DateTime.now(),
        roundOff: cartPrvdr.roundOf,
        supplierInvoiceNo: "0");
    return newPurchase;
  }

  ItemEntity convertPurchasedToItem(PurchasedItemEntity purchasedItem) {
    return ItemEntity(
      itemIdpk: purchasedItem.itemIdpk,
      barcode: purchasedItem.barcode,
      itemCode: purchasedItem.itemCode,
      itemName: purchasedItem.itemName,
      description: purchasedItem.description,
      unit: purchasedItem.unit,
      cost: purchasedItem.cost?.toDouble(),
      retailRate: purchasedItem.sellingPrice?.toDouble(),
      taxPercentage: purchasedItem.taxPercentage?.toDouble(),
      currentStock: purchasedItem.currentStock?.toDouble(),
    );
  }

  ItemEntity convertPurchasedReturnedToItem(
      PurchaseReturnedItemEntity purchasedItem) {
    return ItemEntity(
      itemIdpk: purchasedItem.itemIDPK,
      barcode: purchasedItem.barcode,
      itemCode: purchasedItem.itemCode,
      itemName: purchasedItem.itemName,
      description: purchasedItem.description,
      unit: purchasedItem.unit,
      cost: purchasedItem.cost?.toDouble(),
      retailRate: purchasedItem.sellingPrice?.toDouble(),
      taxPercentage: purchasedItem.taxPercentage?.toDouble(),
      currentStock: purchasedItem.currentStock?.toDouble(),
    );
  }

  reinsertPurchaseInvoiceForm(
      PurchaseInvoiceEntity purchaseInvoice, WidgetRef ref) async {
    final cartPrvdr = ref.read(cartProvider.notifier);
    clearPurchase(ref);
    setEditMode(true);
    List<CartEntity> updatedItemsList = [];
    ref.read(supplierNotfierProvider.notifier).getSupplier();
    final suppliersList = ref.read(supplierNotfierProvider).supplierList;
    final selectedSupplierUpdate = suppliersList != null
        ? suppliersList.firstWhere((supplier) =>
            supplier.ledgerIDPK?.toLowerCase() ==
            purchaseInvoice.supplierIdfk?.toLowerCase())
        : SupplierEntity(
            ledgerName: purchaseInvoice.supplierName,
            ledgerIDPK: purchaseInvoice.supplierIdfk);
    if (purchaseInvoice.supplierName?.toLowerCase() != "cash") {
      final cashLedger = ref
          .read(cashLedgerNotifierProvider.notifier)
          .getLedgerById(purchaseInvoice.drLedgerIdfk ?? '');

      if (cashLedger != null) {
        setCashAccount(cashLedger);
      }
    }

    final salesLedger = ref
        .read(salesLedgerNotifierProvider.notifier)
        .getLedgerById(purchaseInvoice.crLedgerIdfk!);
    if (salesLedger != null) {
      setPurchaseAccount(salesLedger);
    }

    final purchasedBy = ref
        .read(salesManProvider.notifier)
        .getSalesManByName(purchaseInvoice.purchasedBy ?? "");
    if (purchasedBy != null) {
      setPurchasedBy(purchasedBy);
    }

    setPurchaseIdpk(purchaseInvoice.purchaseIdpk ?? "");
    setSupplier(selectedSupplierUpdate);
    setPurchaseNo(purchaseInvoice.purchaseNo?.toString() ?? "");
    setSupInvNo(purchaseInvoice.referenceNo ?? "");
    setPurchaseDate(purchaseInvoice.purchaseDate ?? DateTime.now());
    setPurchaseMode(purchaseInvoice.purchaseMode ?? "Cash");

    // adding items to cart.
    if (purchaseInvoice.purchasedItems?.isNotEmpty == true) {
      for (var index = 0;
          index < purchaseInvoice.purchasedItems!.length;
          index++) {
        final purchasedItem = purchaseInvoice.purchasedItems![index];
        final itemEntity = convertPurchasedToItem(purchasedItem);
        final priceBeforeTax = cartPrvdr.calculateBeforeTax(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: purchasedItem.actualQty?.toDouble() ?? 0.0);

        // Calculate tax based on tax setting
        final totalTax = isTaxEnabled
            ? cartPrvdr.calculateTotalTax(
                retailRate: itemEntity.retailRate ?? 0.0,
                qty: purchasedItem.actualQty?.toDouble() ?? 0.0,
                taxPercentage: itemEntity.taxPercentage ?? 0.0)
            : 0.0;

        final grossTotal = cartPrvdr.calculateGross(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: purchasedItem.actualQty?.toDouble() ?? 0.0,
            discount: purchasedItem.discount?.toDouble() ?? 0.0);

        final netTotal =
            cartPrvdr.calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

        final cartItem = CartEntity(
          cartItemId: (index + 1),
          item: itemEntity,
          qty: purchasedItem.actualQty?.toDouble() ?? 0.0,
          rate: itemEntity.retailRate ?? 0.0,
          cost: itemEntity.cost ?? 0.0,
          unit: itemEntity.unit ?? "",
          description: purchasedItem.description ?? "",
          discount: purchasedItem.discount?.toDouble() ?? 0.0,
          gross: grossTotal,
          tax: totalTax,
          priceBeforeTax: priceBeforeTax,
          netTotal: netTotal,
        );

        updatedItemsList.add(cartItem);
        cartPrvdr.getRateSplitUp(item: cartItem);

        cartPrvdr.itemsList = updatedItemsList;
      }
    }
    cartPrvdr.updateState();
  }

  reinsertPurchaseReturnForm(
      PurchaseReturnEntity purchaseInvoice, WidgetRef ref) async {
    final cartPrvdr = ref.read(cartProvider.notifier);
    clearPurchase(ref);
    setEditMode(true);
    List<CartEntity> updatedItemsList = [];
    ref.read(supplierNotfierProvider.notifier).getSupplier();
    final suppliersList = ref.read(supplierNotfierProvider).supplierList;
    final selectedSupplierUpdate = suppliersList != null
        ? suppliersList.firstWhere((supplier) =>
            supplier.ledgerIDPK?.toLowerCase() ==
            purchaseInvoice.supplierIDFK?.toLowerCase())
        : SupplierEntity(
            ledgerName: purchaseInvoice.supplierName,
            ledgerIDPK: purchaseInvoice.supplierIDFK);
    if (purchaseInvoice.supplierName?.toLowerCase() != "cash") {
      final cashLedger = ref
          .read(cashLedgerNotifierProvider.notifier)
          .getLedgerById(purchaseInvoice.drLedgerIDFK ?? '');

      if (cashLedger != null) {
        setCashAccount(cashLedger);
      }
    }

    final salesLedger = ref
        .read(salesLedgerNotifierProvider.notifier)
        .getLedgerById(purchaseInvoice.crLedgerIDFK!);
    if (salesLedger != null) {
      setPurchaseAccount(salesLedger);
    }

    // final purchasedBy = ref
    //     .read(salesManProvider.notifier)
    //     .getSalesManByName(purchaseInvoice.purchasedBy ?? "");
    // if (purchasedBy != null) {
    //   setPurchasedBy(purchasedBy);
    // }

    setPurchaseIdpk(purchaseInvoice.purchaseReturnIDPK ?? "");
    setSupplier(selectedSupplierUpdate);
    setPurchaseNo(purchaseInvoice.purchaseNo?.toString() ?? "");
    setSupInvNo(purchaseInvoice.referenceNo ?? "");
    setPurchaseDate(purchaseInvoice.purchaseReturnDate ?? DateTime.now());
    setPurchaseMode(purchaseInvoice.purchaseReturnMode ?? "Cash");

    // adding items to cart.
    if (purchaseInvoice.returnedItems?.isNotEmpty == true) {
      for (var index = 0;
          index < purchaseInvoice.returnedItems!.length;
          index++) {
        final purchasedItem = purchaseInvoice.returnedItems![index];
        final itemEntity = convertPurchasedReturnedToItem(purchasedItem);
        final priceBeforeTax = cartPrvdr.calculateBeforeTax(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: purchasedItem.actualQty?.toDouble() ?? 0.0);

        // Calculate tax based on tax setting
        final totalTax = isTaxEnabled
            ? cartPrvdr.calculateTotalTax(
                retailRate: itemEntity.retailRate ?? 0.0,
                qty: purchasedItem.actualQty?.toDouble() ?? 0.0,
                taxPercentage: itemEntity.taxPercentage ?? 0.0)
            : 0.0;

        final grossTotal = cartPrvdr.calculateGross(
            retailRate: itemEntity.retailRate ?? 0.0,
            qty: purchasedItem.actualQty?.toDouble() ?? 0.0,
            discount: purchasedItem.discount?.toDouble() ?? 0.0);

        final netTotal =
            cartPrvdr.calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

        final cartItem = CartEntity(
          cartItemId: (index + 1),
          item: itemEntity,
          qty: purchasedItem.actualQty?.toDouble() ?? 0.0,
          rate: itemEntity.retailRate ?? 0.0,
          cost: itemEntity.cost ?? 0.0,
          unit: itemEntity.unit ?? "",
          description: purchasedItem.description ?? "",
          discount: purchasedItem.discount?.toDouble() ?? 0.0,
          gross: grossTotal,
          tax: totalTax,
          priceBeforeTax: priceBeforeTax,
          netTotal: netTotal,
        );

        updatedItemsList.add(cartItem);
        cartPrvdr.getRateSplitUp(item: cartItem);

        cartPrvdr.itemsList = updatedItemsList;
      }
    }
    cartPrvdr.updateState();
  }
}
