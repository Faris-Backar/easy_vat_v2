import 'package:freezed_annotation/freezed_annotation.dart';

part 'contra_request_model.freezed.dart';
part 'contra_request_model.g.dart';

@freezed
class ContraRequestModel with _$ContraRequestModel {
  const factory ContraRequestModel({
    String? contraIDPK,
    int? contraNo,
    String? referenceNo,
    DateTime? contraDate,
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
    String? toAccountName,
    List<ContraEntryDetail>? contraEntryDetail,
  }) = _ContraRequestModel;

  factory ContraRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ContraRequestModelFromJson(json);
}

@freezed
class ContraEntryDetail with _$ContraEntryDetail {
  const factory ContraEntryDetail({
    String? contraIDPK,
    String? ledgerIDPK,
    String? ledgerName,
    double? currentBalance,
    String? currentBalanceType,
    String? description,
    double? drAmount,
    double? crAmount,
    String? companyIDPK,
  }) = _ContraEntryDetail;

  factory ContraEntryDetail.fromJson(Map<String, dynamic> json) =>
      _$ContraEntryDetailFromJson(json);
}
