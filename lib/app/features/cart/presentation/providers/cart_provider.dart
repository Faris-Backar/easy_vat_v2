import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_state.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/data/model/sales_invoice_model.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/data/model/sales_invoice_request_model.dart';
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
  String cashAccount = "";
  String salesAccount = "";
  String notes = "";
  String salesMode = "";
  String soldBy = "";
  String description = "";

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

  setSoldBy(String soldBy) {
    this.soldBy = soldBy;
  }

  setCashAccount(String cashAccount) {
    this.cashAccount = cashAccount;
  }

  setSalesAccount(String salesAccount) {
    this.salesAccount = salesAccount;
  }

  setDiscription(String description) {
    this.description = description;
  }

  createNewSale() {
    final uid = Uuid().v8();
    // final newSale = SalesInvoiceRequestModel(
    //   saleIdpk: uid,
    //   actualSalesDate: salesDate,
    //   amountTendered: 0,
    //   cashAmount:,
    // );

    // final List<SoldItem> items = [];
    // for (var i = 0; i < itemsList.length; i++) {
    //   final item = SoldItem(saleIdpk: uid, itemIdpk: itemsList[i].item.itemIdpk, barcode:  itemsList[i].item.barcode, itemCode:  itemsList[i].item.itemCode, itemName: itemsList[i].item.itemName, description: description, unit: unit, actualQty: qty, billedQty: qty, cost: cost, sellingPrice: sellingPrice, discount: discount, grossTotal: grossTotal, taxAmount: taxAmount, taxPercentage: taxPercentage, netTotal: netTotal, currentStock: currentStock, profit: profit, profitPercentage: profitPercentage, isSent: isSent, expiryDate: expiryDate, storeIdfk: storeIdfk, projectIdpk: projectIdpk, quotationIdpk: quotationIdpk, salesOrderIdpk: salesOrderIdpk, deliveryNoteIdpk: deliveryNoteIdpk, importId: importId, rowguid: rowguid)
    // }
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
    cashAccount = "";
    salesAccount = "";
    notes = "";
    salesMode = "";
    soldBy = "";
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

  void _getRateSplitUp(
      {required double retailRate,
      required int qty,
      required double taxPercentage}) {
    _calculateBeforeTax(retailRate: retailRate, qty: qty);
    _calculateTotalAmount(amount: retailRate * qty);
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
