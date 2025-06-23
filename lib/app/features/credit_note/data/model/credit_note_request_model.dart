import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_note_request_model.freezed.dart';
part 'credit_note_request_model.g.dart';

@freezed
class CreditNoteRequestModel with _$CreditNoteRequestModel {
  const factory CreditNoteRequestModel({
    String? creditNoteIDPK,
    String? customerIDPK,
    int? creditNoteNo,
    String? referenceNo,
    DateTime? creditNoteDate,
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
    String? customerName,
    double? customerBalance,
    List<CreditNoteEntryDetails>? creditNoteEntryDetails,
  }) = _CreditNoteRequestModel;

  factory CreditNoteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreditNoteRequestModelFromJson(json);
}

@freezed
class CreditNoteEntryDetails with _$CreditNoteEntryDetails {
  const factory CreditNoteEntryDetails({
    String? creditNoteIDPK,
    String? ledgerIDPK,
    String? description,
    double? drAmount,
    double? tax,
    double? taxPercentage,
    double? netTotal,
    String? companyIDPK,
    double? ledgerBalance,
    String? ledgerName,
  }) = _CreditNoteEntryDetails;

  factory CreditNoteEntryDetails.fromJson(Map<String, dynamic> json) =>
      _$CreditNoteEntryDetailsFromJson(json);
}
