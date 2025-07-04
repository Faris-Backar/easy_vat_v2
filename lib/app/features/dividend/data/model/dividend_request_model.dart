import 'package:freezed_annotation/freezed_annotation.dart';

part 'dividend_request_model.freezed.dart';
part 'dividend_request_model.g.dart';

@freezed
class DividendRequestModel with _$DividendRequestModel {
  const factory DividendRequestModel({
    String? dividendIDPK,
    int? dividendNo,
    String? referenceNo,
    DateTime? dividendDate,
    String? paymentMode,
    String? crLedgerIDFK,
    String? drLedgerIDFK,
    String? expenseLedger,
    String? cashAccount,
    String? issuedBy,
    double? netTotal,
    String? remarks,
    bool? isEditable,
    bool? isCanceled,
    String? createdBy,
    DateTime? createdDate,
    String? modifiedBy,
    DateTime? modifiedDate,
    String? rowguid,
    String? companyIDPK,
    List<DividendDetails>? dividendDetails,
  }) = _DividendRequestModel;

  factory DividendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DividendRequestModelFromJson(json);
}

@freezed
class DividendDetails with _$DividendDetails {
  const factory DividendDetails({
    String? dividendIDPK,
    String? ledgerIDPK,
    double? currentBalance,
    String? currentBalanceType,
    String? ledgerName,
    String? description,
    double? netTotal,
    String? rowguid,
    String? companyIDPK,
  }) = _DividendDetails;

  factory DividendDetails.fromJson(Map<String, dynamic> json) =>
      _$DividendDetailsFromJson(json);
}
