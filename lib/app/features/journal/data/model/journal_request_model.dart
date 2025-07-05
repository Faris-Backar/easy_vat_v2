import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_request_model.freezed.dart';
part 'journal_request_model.g.dart';

@freezed
class JournalRequestModel with _$JournalRequestModel {
  const factory JournalRequestModel({
    String? journalIDPK,
    int? journalNo,
    String? referenceNo,
    DateTime? journalDate,
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
    String? entryMode,
    String? toAccount,
    List<JournalDetail>? journalEntryDetail,
  }) = _JournalRequestModel;

  factory JournalRequestModel.fromJson(Map<String, dynamic> json) =>
      _$JournalRequestModelFromJson(json);
}

@freezed
class JournalDetail with _$JournalDetail {
  const factory JournalDetail({
    String? journalIDPK,
    String? ledgerIDPK,
    String? ledgerName,
    double? currentBalance,
    String? currentBalanceType,
    String? description,
    double? drAmount,
    double? crAmount,
    String? companyIDPK,
  }) = _JournalDetail;

  factory JournalDetail.fromJson(Map<String, dynamic> json) =>
      _$JournalDetailFromJson(json);
}
