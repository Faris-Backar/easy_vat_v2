import 'package:freezed_annotation/freezed_annotation.dart';

part 'debit_note_request_model.freezed.dart';
part 'debit_note_request_model.g.dart';

@freezed
class DebitNoteRequestModel with _$DebitNoteRequestModel {
  const factory DebitNoteRequestModel({
    String? debitNoteIDPK,
    String? supplierIDPK,
    String? crLedgerIDFK,
    String? drLedgerIDFK,
    int? debitNoteNo,
    String? referenceNo,
    String? supplierReferenceNo,
    DateTime? debitNoteDate,
    String? paymentMode,
    String? purchasedBy,
    String? description,
    double? totalAmount,
    String? remarks,
    bool? isEditable,
    bool? isCanceled,
    String? createdBy,
    DateTime? createdDate,
    String? modifiedBy,
    DateTime? modifiedDate,
    String? rowguid,
    String? companyIDPK,
    String? supplierName,
    double? supplierBalance,
    List<DebitNoteEntryDetails>? debitNoteEntryDetails,
  }) = _DebitNoteRequestModel;

  factory DebitNoteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DebitNoteRequestModelFromJson(json);
}

@freezed
class DebitNoteEntryDetails with _$DebitNoteEntryDetails {
  const factory DebitNoteEntryDetails({
    String? debitNoteIDPK,
    String? ledgerIDPK,
    String? description,
    double? crAmount,
    double? tax,
    double? taxPercentage,
    double? netTotal,
    String? companyIDPK,
    double? ledgerBalance,
    String? ledgerName,
  }) = _DebitNoteEntryDetails;

  factory DebitNoteEntryDetails.fromJson(Map<String, dynamic> json) =>
      _$DebitNoteEntryDetailsFromJson(json);
}
