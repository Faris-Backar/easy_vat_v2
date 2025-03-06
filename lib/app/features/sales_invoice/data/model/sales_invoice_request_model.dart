// import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_invoice_request_model.freezed.dart';
part 'sales_invoice_request_model.g.dart';

@freezed
class SalesInvoiceRequestModel with _$SalesInvoiceRequestModel {
  const factory SalesInvoiceRequestModel({
    String? saleIdpk,
    int? saleNo,
    String? saleMode,
    String? crLedgerIdfk,
    String? drLedgerIdfk,
    String? custemerIdfk,
    String? creditAccount,
    String? debitAccount,
    String? referenceNo,
    DateTime? saleDate,
    String? cashTrn,
    String? cashCustomerAddress,
    String? shippingAddress,
    String? customerName,
    String? remarks,
    String? lpoNo,
    String? doNo,
    String? diningArea,
    String? diningTable,
    String? quotationNo,
    String? requestNo,
    double? cashAmount,
    double? creditCardAmount,
    DateTime? actualSalesDate,
    String? vehicleNo,
    String? genaralNotes,
    String? salesOrderNo,
    String? soldBy,
    double? grossAmount,
    double? tax,
    double? discount,
    double? netTotal,
    double? roundOff,
    double? amountTendered,
    String? deliveryBoy,
    bool? isEditable,
    bool? isCanceled,
    bool? isLockVoucher,
    String? createdBy,
    DateTime? createdDate,
    String? modifiedBy,
    DateTime? modifiedDate,
    String? rowguid,
    bool? isPos,
    String? deliveryBoyIdpk,
    String? notesAndInstructions,
    String? drLedgerCashAccount,
    String? drLedgerBankAccount,
    String? orderType,
    int? deliveryCharge,
    List<SoldItem>? soldItems,
  }) = _SalesInvoiceRequestModel;

  factory SalesInvoiceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceRequestModelFromJson(json);
}

@freezed
class SoldItem with _$SoldItem {
  const factory SoldItem({
    String? saleIdpk,
    String? itemIdpk,
    String? barcode,
    String? itemCode,
    String? itemName,
    String? description,
    String? unit,
    double? actualQty,
    double? billedQty,
    double? cost,
    double? sellingPrice,
    double? discount,
    double? grossTotal,
    double? taxAmount,
    double? taxPercentage,
    double? netTotal,
    double? currentStock,
    double? profit,
    double? profitPercentage,
    bool? isSent,
    DateTime? expiryDate,
    String? storeIdfk,
    String? projectIdpk,
    String? quotationIdpk,
    String? salesOrderIdpk,
    String? deliveryNoteIdpk,
    String? importId,
    String? rowguid,
  }) = _SoldItem;

  factory SoldItem.fromJson(Map<String, dynamic> json) =>
      _$SoldItemFromJson(json);
}
