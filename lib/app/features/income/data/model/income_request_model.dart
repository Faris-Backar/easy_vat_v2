import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_request_model.freezed.dart';
part 'income_request_model.g.dart';

@freezed
class IncomeRequestModel with _$IncomeRequestModel {
  const factory IncomeRequestModel({
    String? incomeIDPK,
    int? incomeNo,
    String? referenceNo,
    DateTime? incomeDate,
    String? paymentMode,
    String? purchasedBy,
    String? customerIDFK,
    String? crLedgerIDFK,
    String? drLedgerIDFK,
    String? supplierInvoiceNo,
    double? grossTotal,
    double? discount,
    double? tax,
    double? netTotal,
    double? roundOff,
    String? remarks,
    bool? isEditable,
    bool? isCanceled,
    String? createdBy,
    DateTime? createdDate,
    String? modifiedBy,
    DateTime? modifiedDate,
    String? rowguid,
    String? companyIDPK,
    String? customerName,
    List<IncomeDetails>? incomeDetails,
  }) = _IncomeRequestModel;

  factory IncomeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeRequestModelFromJson(json);
}

@freezed
class IncomeDetails with _$IncomeDetails {
  const factory IncomeDetails({
    String? incomeIDPK,
    String? ledgerIDPK,
    String? description,
    double? grossTotal,
    double? taxAmount,
    double? taxPercentage,
    double? netTotal,
    String? rowguid,
    String? companyIDPK,
    double? currentBalance,
    String? ledgerName,
  }) = _IncomeDetails;

  factory IncomeDetails.fromJson(Map<String, dynamic> json) =>
      _$IncomeDetailsFromJson(json);
}
