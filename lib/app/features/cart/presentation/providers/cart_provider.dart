import 'dart:developer';

import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_state.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/data/model/sales_invoice_request_model.dart';
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
  double totalTax = 0.0;
  double discount = 0.0;
  double roundOf = 0.0;
  String salesNo = "";
  DateTime salesDate = DateTime.now();
  String refNo = "";
  LedgerAccountEntity? cashAccount;
  String salesAccount = "";
  String notes = "";
  String salesMode = "";
  SalesManEntity? soldBy;
  String description = "";
  CustomerEntity? selectedCustomer;
  double totalItemGrossAmont = 0.0;
  String shippingAddress = "";

  void addItemsIntoCart({required CartEntity item}) {
    itemsList.add(item);
    _getRateSplitUp(
      retailRate: item.item.retailRate ?? 0.0,
      qty: item.qty.toInt(),
      taxPercentage: item.item.taxPercentage ?? 0.0,
    );
    state = state.copyWith(itemList: itemsList);
  }

  void removeItemFromCart({required int index}) {
    if (index >= 0 && index < itemsList.length) {
      final CartEntity removedItem = itemsList[index];
      _decreaseRateSplitUp(
        retailRate: removedItem.item.retailRate ?? 0.0,
        qty: removedItem.qty.toInt(),
        taxPercentage: removedItem.item.taxPercentage ?? 0.0,
      );
      itemsList.removeAt(index);
      state = state.copyWith(itemList: itemsList);
    }
  }

  void updateCartItem({required CartEntity cartItem}) {
    final index =
        itemsList.indexWhere((item) => cartItem.cartItemId == item.cartItemId);

    if (index != -1) {
      final oldItem = itemsList[index];

      _decreaseRateSplitUp(
        retailRate: oldItem.item.retailRate ?? 0.0,
        qty: oldItem.qty.toInt(),
        taxPercentage: oldItem.item.taxPercentage ?? 0.0,
      );

      final updatedItem = CartEntity(
        cartItemId: cartItem.cartItemId,
        item: cartItem.item,
        qty: cartItem.qty,
        total: cartItem.qty * cartItem.price,
        price: cartItem.price,
        cost: oldItem.cost,
        unit: oldItem.unit,
        description: oldItem.description,
        discount: cartItem.discount,
        tax: 0.0,
      );
      itemsList[index] = updatedItem;
      _getRateSplitUp(
        retailRate: updatedItem.item.retailRate ?? 0.0,
        qty: updatedItem.qty.toInt(),
        taxPercentage: updatedItem.item.taxPercentage ?? 0.0,
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

  setSalesAccount(String salesAccount) {
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

  double applyIndividualItemDiscount({
    required double total,
    required double discAmount,
  }) {
    double discountedTotal = total - discAmount;
    discountedTotal = discountedTotal < 0 ? 0 : discountedTotal;
    return discountedTotal;
  }

  void applyDiscount(double discountAmount) {
    discount = discountAmount;
    totalAmount -= discountAmount;
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
      final taxAmount = ((itemsList[i].qty * itemsList[i].price) *
              (itemsList[i].item.taxPercentage ?? 0.0)) /
          100;
      totalItemGrossAmont += grossTotal;
      itemTotalTax += taxAmount;
      netTotal += (grossTotal + taxAmount);
      log("item idpk => ${itemsList[i].item.itemIdpk}");
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
          sellingPrice: itemsList[i].price,
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
    salesAccount = "";
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

  double _calculateTotalAmount({required double amount}) {
    totalAmount += amount;
    return totalAmount;
  }

  double _calculateBeforeTax({required double retailRate, required int qty}) {
    final priceBeforeTax = qty * retailRate;
    totalBeforeTax += priceBeforeTax;
    return totalBeforeTax;
  }

  double _calculateTotalTax(
      {required double retailRate,
      required int qty,
      required double taxPercentage}) {
    double taxAmount = ((qty * retailRate) * taxPercentage) / 100;
    totalTax += taxAmount;
    return totalTax;
  }

  void _getRateSplitUp({
    required double retailRate,
    required int qty,
    required double taxPercentage,
    double discountAmount = 0.0,
  }) {
    double totalBeforeDiscount = retailRate * qty;

    double totalAfterDiscount = applyIndividualItemDiscount(
      total: totalBeforeDiscount,
      discAmount: discountAmount,
    );

    _calculateBeforeTax(retailRate: retailRate, qty: qty);
    _calculateTotalAmount(amount: totalAfterDiscount);
    _calculateTotalTax(
        retailRate: retailRate, qty: qty, taxPercentage: taxPercentage);

    state = state.copyWith(
      totalAmount: totalAmount,
      totalBeforeTax: totalBeforeTax,
      totalTax: totalTax,
    );
  }

  void _decreaseRateSplitUp(
      {required double retailRate,
      required int qty,
      required double taxPercentage}) {
    totalBeforeTax -= qty * retailRate;
    totalAmount -= qty * retailRate;
    totalTax -= ((qty * retailRate) * taxPercentage) / 100;

    state = state.copyWith(
      totalAmount: totalAmount,
      totalBeforeTax: totalBeforeTax,
      totalTax: totalTax,
    );
  }
}
