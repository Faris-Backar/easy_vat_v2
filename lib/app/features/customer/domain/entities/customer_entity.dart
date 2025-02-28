class CustomerEntity {
  final String? ledgerIdpk;
  final String? ledgerName;
  final String? description;
  final double? taxPercentage;
  final String? mailingName;
  final String? billingAddress;
  final int? countryIdfk;
  final String? taxRegistrationNo;
  final String? mobile;
  final String? phone;
  final bool? isActive;
  final double? openingBalance;
  final String? openingBalanceType;
  final double? currentBalance;
  final String? currentBalanceType;
  final String? contactPerson;
  final int? creditDays;
  final double? creditLimit;
  final String? createdBy;
  final DateTime? createdDate;
  final String? ledgerCode;
  final String? modifiedBy;
  final String? contactNo;
  final String? companyIdpk;
  final String? defaultPaymentMode;
  final String? groupName;
  final String? nature;

  CustomerEntity(
      {this.ledgerIdpk,
      this.ledgerName,
      this.description,
      this.taxPercentage,
      this.mailingName,
      this.billingAddress,
      this.countryIdfk,
      this.taxRegistrationNo,
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
      this.createdDate,
      this.ledgerCode,
      this.modifiedBy,
      this.contactNo,
      this.companyIdpk,
      this.defaultPaymentMode,
      this.groupName,
      this.nature});
}
