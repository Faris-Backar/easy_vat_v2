class LedgerAccountEntity {
  String? ledgerIdpk;
  String? underIdfk;
  String? ledgerName;
  String? description;
  double? taxPercentage;
  String? mailingName;
  String? billingAddress;
  int? countryIDFK;
  int? countryStatIDFK;
  String? taxRegistrationType;
  DateTime? dateOfTaxRegistration;
  String? taxRegistrationNo;
  String? taxability;
  String? mobile;
  String? phone;
  bool? isActive;
  double? openingBalance;
  String? openingBalanceType;
  double? currentBalance;
  String? currentBalanceType;
  String? contactPerson;
  int? creditDays;
  String? nature;
  double? creditLimit;
  String? createdBy;
  DateTime? createdDate;
  String? rowguid;
  String? companyIDPK;
  String? defaultPaymentMode;
  String? ledgerCode;
  String? groupName;
  String? modifiedBy;
  String? contactNo;
  DateTime? modifiedDate;
  bool? isEdit;

  LedgerAccountEntity({
    this.ledgerIdpk,
    this.underIdfk,
    this.ledgerName,
    this.description,
    this.taxPercentage,
    this.mailingName,
    this.billingAddress,
    this.taxability,
    this.mobile,
    this.phone,
    this.isActive,
    this.openingBalance,
    this.openingBalanceType,
    this.currentBalance,
    this.currentBalanceType,
    this.contactPerson,
    this.creditDays,
    this.creditLimit,
    this.createdBy,
    this.nature,
    this.createdDate,
    this.companyIDPK,
    this.countryIDFK,
    this.countryStatIDFK,
    this.dateOfTaxRegistration,
    this.defaultPaymentMode,
    this.taxRegistrationNo,
    this.rowguid,
    this.taxRegistrationType,
    this.groupName,
    this.contactNo,
    this.modifiedBy,
    this.ledgerCode,
    this.modifiedDate,
    this.isEdit,
  });
}
