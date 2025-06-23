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
    List<ContraEntryDetails>? contraEntryDetails,
  }) = _ContraRequestModel;

  factory ContraRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ContraRequestModelFromJson(json);
}

@freezed
class ContraEntryDetails with _$ContraEntryDetails {
  const factory ContraEntryDetails({
    String? contraIDPK,
    String? ledgerIDPK,
    String? ledgerName,
    double? currentBalance,
    String? currentBalanceType,
    String? description,
    double? drAmount,
    double? crAmount,
    String? companyIDPK,
  }) = _ContraEntryDetails;

  factory ContraEntryDetails.fromJson(Map<String, dynamic> json) =>
      _$ContraEntryDetailsFromJson(json);
}
