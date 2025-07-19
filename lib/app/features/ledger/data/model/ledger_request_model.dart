import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger_request_model.freezed.dart';
part 'ledger_request_model.g.dart';

@freezed
class LedgerRequestModel with _$LedgerRequestModel {
  const factory LedgerRequestModel({
    String? ledgerIdpk,
    String? underIdfk,
    String? ledgerName,
    String? description,
    double? taxPercentage,
    String? mailingName,
    String? billingAddress,
    int? countryIDFK,
    int? countryStatIDFK,
    String? taxRegistrationType,
    DateTime? dateOfTaxRegistration,
    String? taxRegistrationNo,
    String? taxability,
    String? mobile,
    String? phone,
    bool? isActive,
    double? openingBalance,
    String? openingBalanceType,
    double? currentBalance,
    String? currentBalanceType,
    String? contactPerson,
    int? creditDays,
    String? nature,
    double? creditLimit,
    String? createdBy,
    DateTime? createdDate,
    String? rowguid,
    String? companyIDPK,
    String? defaultPaymentMode,
    String? ledgerCode,
    String? groupName,
    String? modifiedBy,
    String? contactNo,
    DateTime? modifiedDate,
    bool? isEdit,
  }) = _LedgerRequestModel;

  factory LedgerRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerRequestModelFromJson(json);
}
