import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/entities/sales_invoice_entity.dart';

part 'sales_invoice_model.freezed.dart';
part 'sales_invoice_model.g.dart';

@freezed
class SalesInvoiceModel extends SalesInvoiceEntity with _$SalesInvoiceModel {
  const factory SalesInvoiceModel({
    bool? status,
    String? message,
    List<SalesListModel>? salesList,
  }) = _SalesInvoiceModel;

  factory SalesInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceModelFromJson(json);
}

@freezed
class SalesListModel extends SalesListEntity with _$SalesListModel {
  const factory SalesListModel({
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
    List<SoldItemModel>? soldItems,
  }) = _SalesListModel;

  factory SalesListModel.fromJson(Map<String, dynamic> json) =>
      _$SalesListModelFromJson(json);
}

@freezed
class SoldItemModel extends SoldItemEntity with _$SoldItemModel {
  const factory SoldItemModel({
    String? saleIdpk,
    String? itemIdpk,
    String? barcode,
    String? itemCode,
    String? itemName,
    String? description,
    String? unit,
    int? actualQty,
    int? billedQty,
    int? cost,
    int? sellingPrice,
    int? discount,
    int? grossTotal,
    int? taxAmount,
    int? taxPercentage,
    int? netTotal,
    int? currentStock,
    int? profit,
    int? profitPercentage,
    bool? isSent,
    DateTime? expiryDate,
    String? storeIdfk,
    String? projectIdpk,
    String? quotationIdpk,
    String? salesOrderIdpk,
    String? deliveryNoteIdpk,
    String? importId,
    String? rowguid,
  }) = _SoldItemModel;

  factory SoldItemModel.fromJson(Map<String, dynamic> json) =>
      _$SoldItemModelFromJson(json);
}
