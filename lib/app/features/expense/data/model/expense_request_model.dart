import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_request_model.freezed.dart';
part 'expense_request_model.g.dart';

@freezed
class ExpenseRequestModel with _$ExpenseRequestModel {
  const factory ExpenseRequestModel({
    String? expenseIDPK,
    int? expenseno,
    String? referenceNo,
    DateTime? expenseDate,
    String? paymentMode,
    String? purchasedBy,
    String? supplierIDFK,
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
    String? createdDate,
    String? modifiedBy,
    String? modifiedDate,
    String? rowguid,
    String? companyIDPK,
    String? supplierName,
    List<ExpenseDetails>? expenseDetails,
  }) = _ExpenseRequestModel;

  factory ExpenseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseRequestModelFromJson(json);
}

@freezed
class ExpenseDetails with _$ExpenseDetails {
  const factory ExpenseDetails({
    String? expenseIDPK,
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
  }) = _ExpenseDetails;

  factory ExpenseDetails.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDetailsFromJson(json);
}
