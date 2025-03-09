import 'dart:developer';

import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_state.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/data/model/sales_invoice_request_model.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState.initial());

  List<CartEntity> itemsList = [];
  double totalAmount = 0.0;
  double totalBeforeTax = 0.0;
  double subTotal = 0.0;
  double totalTax = 0.0;
  double discount = 0.0;
  double roundOf = 0.0;
  String salesNo = "";
  DateTime salesDate = DateTime.now();
  String refNo = "";
  LedgerAccountEntity? cashAccount;
  LedgerAccountEntity? salesAccount;
  String notes = "";
  String salesMode = "";
  SalesManEntity? soldBy;
  String description = "";
  CustomerEntity? selectedCustomer;
  double totalItemGrossAmont = 0.0;
  String shippingAddress = "";

  void addItemsIntoCart({required CartEntity item}) {
    itemsList.add(item);
    _getRateSplitUp(item: item);
    state = state.copyWith(itemList: itemsList);
  }

  void removeItemFromCart({required int index}) {
    if (index >= 0 && index < itemsList.length) {
      final CartEntity removedItem = itemsList[index];
      _decreaseRateSplitUp(item: removedItem);
      itemsList.removeAt(index);
      state = state.copyWith(itemList: itemsList);
    }
  }

  void updateCartItem({required CartEntity cartItem}) {
    final index =
        itemsList.indexWhere((item) => cartItem.cartItemId == item.cartItemId);
    log("items list => $itemsList \n ${cartItem.cartItemId}");
    if (index != -1) {
      final oldItem = itemsList[index];
      _decreaseRateSplitUp(item: oldItem);
      final updatedItem = CartEntity(
          cartItemId: cartItem.cartItemId,
          item: cartItem.item,
          qty: cartItem.qty,
          netTotal: cartItem.qty * cartItem.rate,
          rate: cartItem.rate,
          cost: oldItem.cost,
          unit: oldItem.unit,
          description: oldItem.description,
          discount: cartItem.discount,
          tax: cartItem.tax,
          gross: cartItem.gross,
          priceBeforeTax: cartItem.priceBeforeTax);
      itemsList[index] = updatedItem;
      _getRateSplitUp(
        item: updatedItem,
      );
      state = state.copyWith(itemList: itemsList);
    }
  }

  setSalesNo(String salesNo) {
    this.salesNo = salesNo;
  }

  setSalesDate(DateTime salesDate) {
    this.salesDate = salesDate;
  }

  setSalesMode(String salesMode) {
    this.salesMode = salesMode;
  }

  setRefNo(String refNo) {
    this.refNo = refNo;
  }

  setSoldBy(SalesManEntity soldBy) {
    this.soldBy = soldBy;
  }

  setCashAccount(LedgerAccountEntity cashAccount) {
    this.cashAccount = cashAccount;
  }

  setSalesAccount(LedgerAccountEntity salesAccount) {
    this.salesAccount = salesAccount;
  }

  setDiscription(String description) {
    this.description = description;
  }

  setCustomer(CustomerEntity customer) {
    selectedCustomer = customer;
    state = state.copyWith(selectedCustomer: selectedCustomer);
  }

  setShippingAddress(String shippingAddress) {
    this.shippingAddress = shippingAddress;
  }

  void applyDiscount(double discountAmount) {
    discount = discountAmount;
    double newTotal =
        itemsList.fold(0.0, (sum, item) => sum + (item.qty * item.rate));

    totalAmount = newTotal - discount;
    totalAmount = totalAmount < 0 ? 0 : totalAmount;

    state = state.copyWith(
      totalAmount: totalAmount,
      discount: discount,
    );
  }

  SalesInvoiceRequestModel createNewSale() {
    double itemTotalTax = 0.0;
    double netTotal = 0.0;

    final uid = Uuid().v8();
    final List<SoldItem> items = [];
    for (var i = 0; i < itemsList.length; i++) {
      final grossTotal =
          (itemsList[i].item.retailRate ?? 0.0 * itemsList[i].qty);
      final taxAmount = ((itemsList[i].qty * itemsList[i].rate) *
              (itemsList[i].item.taxPercentage ?? 0.0)) /
          100;
      totalItemGrossAmont += grossTotal;
      itemTotalTax += taxAmount;
      netTotal += (grossTotal + taxAmount);
      final item = SoldItem(
          saleIdpk: uid,
          itemIdpk: itemsList[i].item.itemIdpk ?? "",
          barcode: itemsList[i].item.barcode ?? "",
          itemCode: itemsList[i].item.itemCode ?? "",
          itemName: itemsList[i].item.itemName ?? "",
          description: description,
          unit: itemsList[i].unit,
          actualQty: itemsList[i].qty,
          billedQty: itemsList[i].qty,
          cost: itemsList[i].cost,
          sellingPrice: itemsList[i].rate,
          discount: discount,
          grossTotal: grossTotal,
          taxAmount: taxAmount,
          taxPercentage: itemsList[i].item.taxPercentage ?? 0.0,
          netTotal: grossTotal,
          currentStock: itemsList[i].item.currentStock ?? 0.0,
          profit: 0.0,
          profitPercentage: 0.0,
          isSent: false,
          expiryDate: DateTime.now(),
          storeIdfk:
              itemsList[i].item.storeCurrentStock?.firstOrNull?.storeIdpk ??
                  "00000000-0000-0000-0000-000000000000",
          projectIdpk: "00000000-0000-0000-0000-000000000000",
          quotationIdpk: "00000000-0000-0000-0000-000000000000",
          deliveryNoteIdpk: "00000000-0000-0000-0000-000000000000",
          salesOrderIdpk: "00000000-0000-0000-0000-000000000000",
          importId: "00000000-0000-0000-0000-000000000000",
          rowguid: '00000000-0000-0000-0000-000000000000');
      items.add(item);
    }

    final newSale = SalesInvoiceRequestModel(
      saleIdpk: uid,
      actualSalesDate: salesDate,
      createdDate: DateTime.now(),
      createdBy: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
      modifiedBy: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
      rowguid: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      isPos: false,
      deliveryBoyIdpk: '00000000-0000-0000-0000-000000000000',
      drLedgerCashAccount: '00000000-0000-0000-0000-000000000000',
      drLedgerBankAccount: '00000000-0000-0000-0000-000000000000',
      deliveryBoy: "",
      deliveryCharge: 0,
      discount: discount,
      grossAmount: totalItemGrossAmont,
      netTotal: netTotal,
      referenceNo: refNo,
      soldItems: items,
      remarks: notes,
      saleMode: salesMode,
      tax: itemTotalTax,
      soldBy: soldBy?.empName,
      crLedgerIdfk: '00000000-0000-0000-0000-000000000000',
      drLedgerIdfk: '00000000-0000-0000-0000-000000000000',
      customerName: selectedCustomer?.ledgerName ?? "cash",
      custemerIdfk: selectedCustomer?.ledgerIdpk ??
          cashAccount?.ledgerIdpk ??
          '00000000-0000-0000-0000-000000000000',
      cashAmount: totalAmount,
      creditAccount: "0",
      creditCardAmount: 0,
      salesOrderNo: "0",
      amountTendered: 0,
      isEditable: true,
      isCanceled: true,
      isLockVoucher: false,
      saleNo: 0,
      shippingAddress: shippingAddress,
      modifiedDate: DateTime.now(),
      roundOff: roundOf,
      saleDate: DateTime.now(),
    );
    return newSale;
  }

  void clearCart() {
    itemsList.clear();
    totalAmount = 0.0;
    totalBeforeTax = 0.0;
    totalTax = 0.0;
    discount = 0.0;
    roundOf = 0.0;
    salesNo = "";
    salesDate = DateTime.now();
    refNo = "";
    cashAccount = null;
    salesAccount = null;
    notes = "";
    salesMode = "";
    soldBy = null;
    selectedCustomer = null;
    description = "";

    state = state.copyWith(
      itemList: itemsList,
      totalAmount: totalAmount,
      totalBeforeTax: totalBeforeTax,
      totalTax: totalTax,
      discount: discount,
      roundOf: roundOf,
    );
  }

  double calculateBeforeTax({required double retailRate, required double qty}) {
    final priceBeforeTax = qty * retailRate;
    return priceBeforeTax;
  }

  double calculateTotalTax(
      {required double retailRate,
      required double qty,
      required double taxPercentage}) {
    double taxAmount = ((qty * retailRate) * taxPercentage) / 100;
    return taxAmount;
  }

  double calculateGross(
      {required double retailRate,
      required double qty,
      required double discount}) {
    double grossAmount = ((qty * retailRate) - discount);
    return grossAmount;
  }

  double calculateNetTotal({required double grossTotal, required double tax}) {
    return grossTotal + tax;
  }

  ItemEntity convertSoldItemToItem(SoldItemEntity soldItem) {
    return ItemEntity(
      itemIdpk: soldItem.itemIdpk,
      barcode: soldItem.barcode,
      itemCode: soldItem.itemCode,
      itemName: soldItem.itemName,
      description: soldItem.description,
      unit: soldItem.unit,
      cost: soldItem.cost?.toDouble(),
      retailRate: soldItem.sellingPrice?.toDouble(),
      taxPercentage: soldItem.taxPercentage?.toDouble(),
      currentStock: soldItem.currentStock?.toDouble(),
    );
  }

  void reinsertSalesForm(List<SoldItemEntity> soldItems) {
    clearCart(); // Reset the cart before reinserting

    List<CartEntity> updatedItemsList =
        []; // To hold updated items for state change

    for (var index = 0; index < soldItems.length; index++) {
      final soldItem = soldItems[index];

      // Convert SoldItemEntity to ItemEntity
      final itemEntity = convertSoldItemToItem(soldItem);

      // Calculate values
      final priceBeforeTax = calculateBeforeTax(
          retailRate: itemEntity.retailRate ?? 0.0,
          qty: soldItem.actualQty?.toDouble() ?? 0.0);
      final totalTax = calculateTotalTax(
          retailRate: itemEntity.retailRate ?? 0.0,
          qty: soldItem.actualQty?.toDouble() ?? 0.0,
          taxPercentage: itemEntity.taxPercentage ?? 0.0);
      final grossTotal = calculateGross(
          retailRate: itemEntity.retailRate ?? 0.0,
          qty: soldItem.actualQty?.toDouble() ?? 0.0,
          discount: soldItem.discount?.toDouble() ?? 0.0);
      final netTotal = calculateNetTotal(grossTotal: grossTotal, tax: totalTax);

      final cartItem = CartEntity(
        cartItemId: (index + 1),
        item: itemEntity,
        qty: soldItem.actualQty?.toDouble() ?? 0.0,
        rate: itemEntity.retailRate ?? 0.0,
        cost: itemEntity.cost ?? 0.0,
        unit: itemEntity.unit ?? "",
        description: soldItem.description ?? "",
        discount: soldItem.discount?.toDouble() ?? 0.0,
        gross: grossTotal,
        tax: totalTax,
        priceBeforeTax: priceBeforeTax,
        netTotal: netTotal,
      );

      updatedItemsList.add(cartItem);
      _getRateSplitUp(item: cartItem);
    }
    state = state.copyWith(
      itemList: updatedItemsList,
      totalAmount: totalAmount,
      totalBeforeTax: totalBeforeTax,
      totalTax: totalTax,
      subtotal: subTotal,
      discount: discount,
    );
  }

  void _getRateSplitUp({required CartEntity item}) {
    totalBeforeTax += item.priceBeforeTax;
    totalTax += item.tax;
    totalAmount += item.netTotal;
    subTotal += item.gross;

    state = state.copyWith(
        totalAmount: totalAmount,
        totalBeforeTax: totalBeforeTax,
        totalTax: totalTax,
        subtotal: subTotal);
  }

  void _decreaseRateSplitUp({required CartEntity item}) {
    totalBeforeTax -= item.priceBeforeTax;
    totalTax -= item.tax;
    totalAmount -= item.netTotal;
    subTotal -= item.gross;

    state = state.copyWith(
        totalAmount: totalAmount,
        totalBeforeTax: totalBeforeTax,
        totalTax: totalTax,
        subtotal: subTotal);
  }
}
