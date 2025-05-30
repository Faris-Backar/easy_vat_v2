class PinLoginEntity {
  bool? isAuthenticated;
  String message;
  UserDetailsEntity? userDetails;
  LedgerBookInfoEntity? ledgerBookInfo;

  PinLoginEntity({
    required this.isAuthenticated,
    required this.message,
    this.userDetails,
    this.ledgerBookInfo,
  });
}

class LedgerBookInfoEntity {
  BookEntity? cashBook;
  BookEntity? bankBook;
  BookEntity? customerBook;
  BookEntity? supplierBook;

  LedgerBookInfoEntity({
    this.cashBook,
    this.bankBook,
    this.customerBook,
    this.supplierBook,
  });
}

class BookEntity {
  String? groupIdpk;
  String? groupName;
  String? underGroup;
  String? underId;
  String? currentBalance;

  BookEntity({
    this.groupIdpk,
    this.groupName,
    this.underGroup,
    this.underId,
    this.currentBalance,
  });
}

class UserDetailsEntity {
  String? userIdpk;
  String? username;
  String? password;
  String? empName;
  double? userRoleIdpk;
  String? userRole;
  double? userPin;
  bool? isActive;
  bool? isEdit;
  StoreDetailsEntity? storeDetails;
  CashAccountDetailsEntity? cashAccountDetails;
  List<dynamic>? userPermissions;
  AppSettingsEntity? appSettings;
  CompanyInfoEntity? companyInfo;

  UserDetailsEntity({
    this.userIdpk,
    this.username,
    this.password,
    this.empName,
    this.userRoleIdpk,
    this.userRole,
    this.userPin,
    this.isActive,
    this.isEdit,
    this.storeDetails,
    this.cashAccountDetails,
    this.userPermissions,
    this.appSettings,
    this.companyInfo,
  });
}

class AppSettingsEntity {
  String? primaryCurrency;
  double? primaryDecimal;
  String? secondaryCurrency;
  double? secondaryDecimal;
  bool? enableTaxCalculation;
  double? defaultCountryId;
  double? defaultCountryStateId;
  double? defaultCurrencyId;
  double? defaultNumberOfDecimal;
  bool? enableEmployeeBiometricFingerprint;
  String? defaultSalesAccount;
  String? defaultCashAccount;
  String? defaultCustomer;
  double? nextBarcodeNumber;
  double? salesPromotionType;
  double? salesPromotionValueType;
  double? salesPromationValue;
  String? defaultCardAccount;
  String? defaultBankAccount;
  String? discountAllowed;
  String? discountReceived;
  DateTime? dbLastUpdate;
  double? nextItemCodeNumber;
  bool? enableWeightScale;
  double? weightScaleReserve;
  String? customReportCustomer;
  bool? enableVoucherLock;
  bool? enableAutomaticDayShift;
  String? dayShiftTiming;
  bool? isEnableBiometrics;
  String? profitCalculationModel;
  String? invoiceFooter;
  String? companyIdpk;
  bool? blockBelowCostSale;
  bool? enableMultiLanguage;
  String? languageType;

  AppSettingsEntity({
    this.primaryCurrency,
    this.primaryDecimal,
    this.secondaryCurrency,
    this.secondaryDecimal,
    this.enableTaxCalculation,
    this.defaultCountryId,
    this.defaultCountryStateId,
    this.defaultCurrencyId,
    this.defaultNumberOfDecimal,
    this.enableEmployeeBiometricFingerprint,
    this.defaultSalesAccount,
    this.defaultCashAccount,
    this.defaultCustomer,
    this.nextBarcodeNumber,
    this.salesPromotionType,
    this.salesPromotionValueType,
    this.salesPromationValue,
    this.defaultCardAccount,
    this.defaultBankAccount,
    this.discountAllowed,
    this.discountReceived,
    this.dbLastUpdate,
    this.nextItemCodeNumber,
    this.enableWeightScale,
    this.weightScaleReserve,
    this.customReportCustomer,
    this.enableVoucherLock,
    this.enableAutomaticDayShift,
    this.dayShiftTiming,
    this.isEnableBiometrics,
    this.profitCalculationModel,
    this.invoiceFooter,
    this.companyIdpk,
    this.blockBelowCostSale,
    this.enableMultiLanguage,
    this.languageType,
  });
}

class CashAccountDetailsEntity {
  String? ledgerIdpk;
  String? ledgerName;
  double? currentBalance;
  String? currentBalanceType;

  CashAccountDetailsEntity({
    this.ledgerIdpk,
    this.ledgerName,
    this.currentBalance,
    this.currentBalanceType,
  });
}

class CompanyInfoEntity {
  String? companyGuid;
  String? companyId;
  String? companyName;
  String? companyNameArabic;
  String? tradeLicenceNo;
  DateTime? licenceExpiryDate;
  DateTime? bookBeginningDate;
  bool? isActive;
  String? mailingName;
  String? authorisedPerson;
  String? address;
  String? phone;
  String? mobile;
  String? email;
  String? fax;
  String? website;
  double? countryId;
  double? stateIdPk;
  String? taxRegistrationType;
  bool? enableTaxCalculation;
  String? taxRegNo;
  DateTime? dateofTaxRegistration;
  String? taxReturnPeriod;
  DateTime? startDate;
  DateTime? endDate;
  String? incomeTaxNo;
  String? description;
  String? logo;
  String? softwareType;
  String? companyIdpk;
  bool? isSelected;

  CompanyInfoEntity({
    this.companyGuid,
    this.companyId,
    this.companyName,
    this.companyNameArabic,
    this.tradeLicenceNo,
    this.licenceExpiryDate,
    this.bookBeginningDate,
    this.isActive,
    this.mailingName,
    this.authorisedPerson,
    this.address,
    this.phone,
    this.mobile,
    this.email,
    this.fax,
    this.website,
    this.countryId,
    this.stateIdPk,
    this.taxRegistrationType,
    this.enableTaxCalculation,
    this.taxRegNo,
    this.dateofTaxRegistration,
    this.taxReturnPeriod,
    this.startDate,
    this.endDate,
    this.incomeTaxNo,
    this.description,
    this.logo,
    this.softwareType,
    this.companyIdpk,
    this.isSelected,
  });
}

class StoreDetailsEntity {
  String? storeIdpk;
  String? storeType;
  String? storeId;
  String? storeName;
  String? storeLocation;
  String? storeAddress;
  bool? isActive;
  bool? isEdit;
  bool? isDefaultStore;
  String? createdBy;
  DateTime? createdDate;
  String? modifiedBy;
  DateTime? modifiedDate;
  String? rowguid;

  StoreDetailsEntity({
    this.storeIdpk,
    this.storeType,
    this.storeId,
    this.storeName,
    this.storeLocation,
    this.storeAddress,
    this.isActive,
    this.isEdit,
    this.isDefaultStore,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.rowguid,
  });
}
