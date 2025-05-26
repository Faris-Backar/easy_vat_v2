class SupplierEntity {
  final String? ledgerIDPK;
  final String? underIDFK;
  final String? ledgerName;
  final String? description;
  final double? taxPercentage;
  final String? mailingName;
  final String? billingAddress;
  final int? countryIDFK;
  final int? countryStatIDFK;
  final String? taxability;
  final String? taxRegistrationType;
  final DateTime? dateOfTaxRegistration;
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
  final String? rowguid;
  final DateTime? modifiedDate;
  final bool? isEdit;
  final String? ledgerCode;
  final String? modifiedBy;
  final String? contactNo;
  final String? companyIDPK;
  final String? defaultPaymentMode;
  final String? groupName;
  final String? nature;

  SupplierEntity({
    this.ledgerIDPK,
    this.underIDFK,
    this.ledgerName,
    this.description,
    this.taxPercentage,
    this.mailingName,
    this.billingAddress,
    this.countryIDFK,
    this.countryStatIDFK,
    this.taxability,
    this.taxRegistrationType,
    this.dateOfTaxRegistration,
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
    this.rowguid,
    this.modifiedDate,
    this.isEdit,
    this.ledgerCode,
    this.modifiedBy,
    this.contactNo,
    this.companyIDPK,
    this.defaultPaymentMode,
    this.groupName,
    this.nature,
  });

  SupplierEntity copyWith({
    String? ledgerIDPK,
    String? underIDFK,
    String? ledgerName,
    String? description,
    double? taxtpercentage,
    String? mailingName,
    String? billingAddress,
    int? countryIDFK,
    int? countryStatIDFK,
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
    String? companyIDPK,
    String? defaultPaymentMode,
    String? groupName,
    String? nature,
  }) {
    return SupplierEntity(
        ledgerIDPK: ledgerIDPK ?? this.ledgerIDPK,
        underIDFK: underIDFK ?? this.underIDFK,
        ledgerName: ledgerName ?? this.ledgerName,
        description: description ?? this.description,
        taxPercentage: taxtpercentage ?? this.taxPercentage,
        mailingName: mailingName ?? this.mailingName,
        billingAddress: billingAddress ?? this.billingAddress,
        countryIDFK: countryIDFK ?? this.countryIDFK,
        countryStatIDFK: countryStatIDFK ?? this.countryStatIDFK,
        taxability: taxability ?? this.taxability,
        taxRegistrationType: taxRegistrationType ?? this.taxRegistrationType,
        dateOfTaxRegistration:
            dateOfTaxRegistration ?? this.dateOfTaxRegistration,
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
        rowguid: rowguid ?? this.rowguid,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        isEdit: isEdit ?? this.isEdit,
        ledgerCode: ledgerCode ?? this.ledgerCode,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        contactNo: contactNo ?? this.contactNo,
        companyIDPK: companyIDPK ?? this.companyIDPK,
        defaultPaymentMode: defaultPaymentMode ?? this.defaultPaymentMode,
        groupName: groupName ?? this.groupName,
        nature: nature ?? this.nature);
  }

  @override
  String toString() {
    return "SupplierEntity(ledgerIDPK: $ledgerIDPK,underIDFK: $underIDFK,ledgerName: $ledgerName,description: $description,taxPercentage: $taxPercentage,mailingName: $mailingName,billingAddress: $billingAddress,countryIDFK: $countryIDFK,countStatIDFK: $countryStatIDFK,taxability: $taxability,taxRegistrationType: $taxRegistrationType,dateOfTaxRegistration: $dateOfTaxRegistration,taxRegistrationNo: $taxRegistrationNo,mobile: $mobile,phone: $phone,isActive: $isActive,openingBalance: $openingBalance,openingBalanceType: $openingBalanceType,currentBalance: $currentBalance,currentBalanceType: $currentBalanceType,contactPerson: $contactPerson,creditDays: $creditDays,creditLimit $creditLimit,createdBy: $createdBy,createdDate: $createdDate,rowguid: $rowguid,modifiedDate: $modifiedDate,isEdit: $isEdit,ledgerCode: $ledgerCode,modifiedBy: $modifiedBy,contactNo; $contactNo,companyIDPK: $companyIDPK,defaultPaymentMode: $defaultPaymentMode,groupName: $groupName,nature: $nature)";
  }
}
