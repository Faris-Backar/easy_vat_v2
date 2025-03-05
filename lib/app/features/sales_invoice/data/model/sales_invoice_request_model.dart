// import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_invoice_request_model.freezed.dart';
part 'sales_invoice_request_model.g.dart';

// String salesInvoiceRequestModelToJson(SalesInvoiceRequestModel data) => json.encode(data.toJson());

@freezed
class SalesInvoiceRequestModel with _$SalesInvoiceRequestModel {
  const factory SalesInvoiceRequestModel({
    required String saleIdpk,
    required int saleNo,
    required String saleMode,
    required String crLedgerIdfk,
    required String drLedgerIdfk,
    required String custemerIdfk,
    required String creditAccount,
    required String debitAccount,
    required String referenceNo,
    required DateTime saleDate,
    required String cashTrn,
    required String cashCustomerAddress,
    required String shippingAddress,
    required String customerName,
    required String remarks,
    required String lpoNo,
    required String doNo,
    required String diningArea,
    required String diningTable,
    required String quotationNo,
    required String requestNo,
    required int cashAmount,
    required int creditCardAmount,
    required DateTime actualSalesDate,
    required String vehicleNo,
    required String genaralNotes,
    required String salesOrderNo,
    required String soldBy,
    required int grossAmount,
    required int tax,
    required int discount,
    required int netTotal,
    required int roundOff,
    required int amountTendered,
    required String deliveryBoy,
    required bool isEditable,
    required bool isCanceled,
    required bool isLockVoucher,
    required String createdBy,
    required DateTime createdDate,
    required String modifiedBy,
    required DateTime modifiedDate,
    required String rowguid,
    required bool isPos,
    required String deliveryBoyIdpk,
    required String notesAndInstructions,
    required String drLedgerCashAccount,
    required String drLedgerBankAccount,
    required String orderType,
    required int deliveryCharge,
    required List<SoldItem> soldItems,
  }) = _SalesInvoiceRequestModel;

  factory SalesInvoiceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceRequestModelFromJson(json);
}

@freezed
class SoldItem with _$SoldItem {
  const factory SoldItem({
    required String saleIdpk,
    required String itemIdpk,
    required String barcode,
    required String itemCode,
    required String itemName,
    required String description,
    required String unit,
    required int actualQty,
    required int billedQty,
    required int cost,
    required int sellingPrice,
    required int discount,
    required int grossTotal,
    required int taxAmount,
    required int taxPercentage,
    required int netTotal,
    required int currentStock,
    required int profit,
    required int profitPercentage,
    required bool isSent,
    required DateTime expiryDate,
    required String storeIdfk,
    required String projectIdpk,
    required String quotationIdpk,
    required String salesOrderIdpk,
    required String deliveryNoteIdpk,
    required String importId,
    required String rowguid,
  }) = _SoldItem;

  factory SoldItem.fromJson(Map<String, dynamic> json) =>
      _$SoldItemFromJson(json);
}
