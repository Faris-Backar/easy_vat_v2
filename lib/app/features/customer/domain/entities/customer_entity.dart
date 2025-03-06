class CustomerEntity {
  final String? ledgerIdpk;
  final String? ledgerName;
  final String? description;
  final double? taxPercentage;
  final String? mailingName;
  final String? billingAddress;
  final String? shippingAddress;
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

  CustomerEntity({
    this.shippingAddress,
    this.ledgerIdpk,
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
    this.nature,
  });

  CustomerEntity copyWith({
    String? ledgerIdpk,
    String? ledgerName,
    String? description,
    double? taxPercentage,
    String? mailingName,
    String? billingAddress,
    int? countryIdfk,
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
    String? ledgerCode,
    String? modifiedBy,
    String? contactNo,
    String? companyIdpk,
    String? defaultPaymentMode,
    String? groupName,
    String? nature,
    String? shippingAddress,
  }) {
    return CustomerEntity(
        ledgerIdpk: ledgerIdpk ?? this.ledgerIdpk,
        ledgerName: ledgerName ?? this.ledgerName,
        description: description ?? this.description,
        taxPercentage: taxPercentage ?? this.taxPercentage,
        mailingName: mailingName ?? this.mailingName,
        billingAddress: billingAddress ?? this.billingAddress,
        countryIdfk: countryIdfk ?? this.countryIdfk,
        taxRegistrationNo: taxRegistrationNo ?? this.taxRegistrationNo,
        mobile: mobile ?? this.mobile,
        phone: phone ?? this.phone,
        isActive: isActive ?? this.isActive,
        openingBalance: openingBalance ?? this.openingBalance,
        openingBalanceType: openingBalanceType ?? this.openingBalanceType,
        currentBalance: currentBalance ?? this.currentBalance,
        currentBalanceType: currentBalanceType ?? this.currentBalanceType,
        contactPerson: contactPerson ?? this.contactPerson,
        creditDays: creditDays ?? this.creditDays,
        creditLimit: creditLimit ?? this.creditLimit,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        ledgerCode: ledgerCode ?? this.ledgerCode,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        contactNo: contactNo ?? this.contactNo,
        companyIdpk: companyIdpk ?? this.companyIdpk,
        defaultPaymentMode: defaultPaymentMode ?? this.defaultPaymentMode,
        groupName: groupName ?? this.groupName,
        nature: nature ?? this.nature,
        shippingAddress: shippingAddress ?? this.shippingAddress);
  }
}
