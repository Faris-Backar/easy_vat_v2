import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel extends CustomerEntity with _$CustomerModel {
  const factory CustomerModel({
    String? ledgerIdpk,
    String? underIdfk,
    String? ledgerName,
    String? description,
    double? taxPercentage,
    String? mailingName,
    String? billingAddress,
    int? countryIdfk,
    int? countryStatIdfk,
    String? taxability,
    String? taxRegistrationType,
    DateTime? dateOfTaxRegistration,
    String? taxRegistrationNo,
    String? mobile,
    String? phone,
    bool? isActive,
    double? openingBalance,
    String? openingBalanceType,
    double? currentBalance,
    String? currentBalanceType,
    String? contactPerson,
    int? creditDays,
    double? creditLimit,
    String? createdBy,
    DateTime? createdDate,
    String? rowguid,
    DateTime? modifiedDate,
    bool? isEdit,
    String? ledgerCode,
    String? modifiedBy,
    String? contactNo,
    String? companyIdpk,
    String? defaultPaymentMode,
    String? groupName,
    String? nature,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
