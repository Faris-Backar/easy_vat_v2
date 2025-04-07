import 'package:easy_vat_v2/app/features/auth/domain/entities/pin_login_entity.dart';

class PinLoginModel extends PinLoginEntity {
  PinLoginModel({
    super.isAuthenticated,
    String? message,
    UserDetailsModel? userDetails,
    LedgerBookInfoModel? super.ledgerBookInfo,
  }) : super(
          message: message ?? "",
          userDetails: userDetails,
        );

  factory PinLoginModel.fromJson(Map<String, dynamic> json) => PinLoginModel(
        isAuthenticated: json["isAuthenticated"],
        message: json["message"],
        userDetails: json["userDetails"] != null
            ? UserDetailsModel.fromJson(json["userDetails"])
            : null,
        ledgerBookInfo: json["ledgerBookInfo"] != null
            ? LedgerBookInfoModel.fromJson(json["ledgerBookInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "isAuthenticated": isAuthenticated,
        "message": message,
        "userDetails": userDetails != null
            ? (userDetails as UserDetailsModel).toJson()
            : null,
        "ledgerBookInfo": ledgerBookInfo != null
            ? (ledgerBookInfo as LedgerBookInfoModel).toJson()
            : null,
      };
}

class LedgerBookInfoModel extends LedgerBookInfoEntity {
  LedgerBookInfoModel(
      {super.bankBook, super.cashBook, super.customerBook, super.supplierBook});

  factory LedgerBookInfoModel.fromJson(Map<String, dynamic> json) =>
      LedgerBookInfoModel(
        cashBook: json["cashBook"] != null
            ? BookModel.fromJson(json["cashBook"])
            : null,
        bankBook: json["bankBook"] != null
            ? BookModel.fromJson(json["bankBook"])
            : null,
        customerBook: json["customerBook"] != null
            ? BookModel.fromJson(json["customerBook"])
            : null,
        supplierBook: json["supplierBook"] != null
            ? BookModel.fromJson(json["supplierBook"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "cashBook": cashBook != null ? (cashBook as BookModel).toJson() : null,
        "bankBook": bankBook != null ? (bankBook as BookModel).toJson() : null,
        "customerBook":
            customerBook != null ? (customerBook as BookModel).toJson() : null,
        "supplierBook":
            supplierBook != null ? (supplierBook as BookModel).toJson() : null,
      };
}

class BookModel extends BookEntity {
  BookModel({
    super.groupIdpk,
    super.groupName,
    super.underGroup,
    super.underId,
    super.currentBalance,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        groupIdpk: json["groupIDPK"],
        groupName: json["groupName"],
        underGroup: json["underGroup"],
        underId: json["underID"],
        currentBalance: json["currentBalance"],
      );

  Map<String, dynamic> toJson() => {
        "groupIDPK": groupIdpk,
        "groupName": groupName,
        "underGroup": underGroup,
        "underID": underId,
        "currentBalance": currentBalance,
      };
}

class UserDetailsModel extends UserDetailsEntity {
  UserDetailsModel({
    super.userIdpk,
    super.username,
    super.password,
    super.empName,
    super.userRoleIdpk,
    super.userRole,
    super.userPin,
    super.isActive,
    super.isEdit,
    super.storeDetails,
    super.cashAccountDetails,
    super.userPermissions,
    super.appSettings,
    super.companyInfo,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        userIdpk: json["userIDPK"],
        username: json["username"],
        password: json["password"],
        empName: json["empName"],
        userRoleIdpk: _convertToDouble(json["userRoleIDPK"]),
        userRole: json["userRole"],
        userPin: _convertToDouble(json["userPin"]),
        isActive: json["isActive"],
        isEdit: json["isEdit"],
        storeDetails: json["storeDetails"] != null
            ? StoreDetailsModel.fromJson(json["storeDetails"])
            : null,
        cashAccountDetails: json["cashAccountDetails"] != null
            ? CashAccountDetailsModel.fromJson(json["cashAccountDetails"])
            : null,
        userPermissions: json["userPermissions"] != null
            ? List<dynamic>.from(json["userPermissions"].map((x) => x))
            : null,
        appSettings: json["appSettings"] != null
            ? AppSettingsModel.fromJson(json["appSettings"])
            : null,
        companyInfo: json["companyInfo"] != null
            ? CompanyInfo.fromJson(json["companyInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "userIDPK": userIdpk,
        "username": username,
        "password": password,
        "empName": empName,
        "userRoleIDPK": userRoleIdpk,
        "userRole": userRole,
        "userPin": userPin,
        "isActive": isActive,
        "isEdit": isEdit,
        "storeDetails": storeDetails != null
            ? (storeDetails as StoreDetailsModel).toJson()
            : null,
        "cashAccountDetails": cashAccountDetails != null
            ? (cashAccountDetails as CashAccountDetailsModel).toJson()
            : null,
        "userPermissions": userPermissions != null
            ? List<dynamic>.from(userPermissions!.map((x) => x))
            : null,
        "appSettings": appSettings != null
            ? (appSettings as AppSettingsModel).toJson()
            : null,
        "companyInfo":
            companyInfo != null ? (companyInfo as CompanyInfo).toJson() : null,
      };
}

class AppSettingsModel extends AppSettingsEntity {
  AppSettingsModel({
    super.primaryCurrency,
    super.primaryDecimal,
    super.secondaryCurrency,
    super.secondaryDecimal,
    super.enableTaxCalculation,
    super.defaultCountryId,
    super.defaultCountryStateId,
    super.defaultCurrencyId,
    super.defaultNumberOfDecimal,
    super.enableEmployeeBiometricFingerprint,
    super.defaultSalesAccount,
    super.defaultCashAccount,
    super.defaultCustomer,
    super.nextBarcodeNumber,
    super.salesPromotionType,
    super.salesPromotionValueType,
    super.salesPromationValue,
    super.defaultCardAccount,
    super.defaultBankAccount,
    super.discountAllowed,
    super.discountReceived,
    super.dbLastUpdate,
    super.nextItemCodeNumber,
    super.enableWeightScale,
    super.weightScaleReserve,
    super.customReportCustomer,
    super.enableVoucherLock,
    super.enableAutomaticDayShift,
    super.dayShiftTiming,
    super.isEnableBiometrics,
    super.profitCalculationModel,
    super.invoiceFooter,
    super.companyIdpk,
    super.blockBelowCostSale,
    super.enableMultiLanguage,
    super.languageType,
  });

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      AppSettingsModel(
        primaryCurrency: json["primaryCurrency"],
        primaryDecimal: _convertToDouble(json["primaryDecimal"]),
        secondaryCurrency: json["secondaryCurrency"],
        secondaryDecimal: _convertToDouble(json["secondaryDecimal"]),
        enableTaxCalculation: json["enableTaxCalculation"],
        defaultCountryId: _convertToDouble(json["defaultCountryID"]),
        defaultCountryStateId: _convertToDouble(json["defaultCountryStateID"]),
        defaultCurrencyId: _convertToDouble(json["defaultCurrencyID"]),
        defaultNumberOfDecimal:
            _convertToDouble(json["defaultNumberOfDecimal"]),
        enableEmployeeBiometricFingerprint:
            json["enableEmployeeBiometricFingerprint"],
        defaultSalesAccount: json["defaultSalesAccount"],
        defaultCashAccount: json["defaultCashAccount"],
        defaultCustomer: json["defaultCustomer"],
        nextBarcodeNumber: _convertToDouble(json["nextBarcodeNumber"]),
        salesPromotionType: _convertToDouble(json["salesPromotionType"]),
        salesPromotionValueType:
            _convertToDouble(json["salesPromotionValueType"]),
        salesPromationValue: _convertToDouble(json["salesPromationValue"]),
        defaultCardAccount: json["defaultCardAccount"],
        defaultBankAccount: json["defaultBankAccount"],
        discountAllowed: json["discountAllowed"],
        discountReceived: json["discountReceived"],
        dbLastUpdate: json["dbLastUpdate"] != null
            ? DateTime.parse(json["dbLastUpdate"])
            : null,
        nextItemCodeNumber: _convertToDouble(json["nextItemCodeNumber"]),
        enableWeightScale: json["enableWeightScale"],
        weightScaleReserve: _convertToDouble(json["weightScaleReserve"]),
        customReportCustomer: json["customReportCustomer"],
        enableVoucherLock: json["enableVoucherLock"],
        enableAutomaticDayShift: json["enableAutomaticDayShift"],
        dayShiftTiming: json["dayShiftTiming"],
        isEnableBiometrics: json["isEnableBiometrics"],
        profitCalculationModel: json["profitCalculationModel"],
        invoiceFooter: json["invoiceFooter"],
        companyIdpk: json["companyIDPK"],
        blockBelowCostSale: json["blockBelowCostSale"],
        enableMultiLanguage: json["enableMultiLanguage"],
        languageType: json["languageType"],
      );

  Map<String, dynamic> toJson() => {
        "primaryCurrency": primaryCurrency,
        "primaryDecimal": primaryDecimal,
        "secondaryCurrency": secondaryCurrency,
        "secondaryDecimal": secondaryDecimal,
        "enableTaxCalculation": enableTaxCalculation,
        "defaultCountryID": defaultCountryId,
        "defaultCountryStateID": defaultCountryStateId,
        "defaultCurrencyID": defaultCurrencyId,
        "defaultNumberOfDecimal": defaultNumberOfDecimal,
        "enableEmployeeBiometricFingerprint":
            enableEmployeeBiometricFingerprint,
        "defaultSalesAccount": defaultSalesAccount,
        "defaultCashAccount": defaultCashAccount,
        "defaultCustomer": defaultCustomer,
        "nextBarcodeNumber": nextBarcodeNumber,
        "salesPromotionType": salesPromotionType,
        "salesPromotionValueType": salesPromotionValueType,
        "salesPromationValue": salesPromationValue,
        "defaultCardAccount": defaultCardAccount,
        "defaultBankAccount": defaultBankAccount,
        "discountAllowed": discountAllowed,
        "discountReceived": discountReceived,
        "dbLastUpdate": dbLastUpdate?.toIso8601String(),
        "nextItemCodeNumber": nextItemCodeNumber,
        "enableWeightScale": enableWeightScale,
        "weightScaleReserve": weightScaleReserve,
        "customReportCustomer": customReportCustomer,
        "enableVoucherLock": enableVoucherLock,
        "enableAutomaticDayShift": enableAutomaticDayShift,
        "dayShiftTiming": dayShiftTiming,
        "isEnableBiometrics": isEnableBiometrics,
        "profitCalculationModel": profitCalculationModel,
        "invoiceFooter": invoiceFooter,
        "companyIDPK": companyIdpk,
        "blockBelowCostSale": blockBelowCostSale,
        "enableMultiLanguage": enableMultiLanguage,
        "languageType": languageType,
      };
}

class CashAccountDetailsModel extends CashAccountDetailsEntity {
  CashAccountDetailsModel({
    super.ledgerIdpk,
    super.ledgerName,
    super.currentBalance,
    super.currentBalanceType,
  });

  factory CashAccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      CashAccountDetailsModel(
        ledgerIdpk: json["ledgerIDPK"],
        ledgerName: json["ledgerName"],
        currentBalance: json["currentBalance"] != null
            ? (json["currentBalance"] is int
                ? (json["currentBalance"] as int).toDouble()
                : json["currentBalance"].toDouble())
            : null,
        currentBalanceType: json["currentBalanceType"],
      );

  Map<String, dynamic> toJson() => {
        "ledgerIDPK": ledgerIdpk,
        "ledgerName": ledgerName,
        "currentBalance": currentBalance,
        "currentBalanceType": currentBalanceType,
      };
}

class CompanyInfo extends CompanyInfoEntity {
  CompanyInfo({
    super.companyGuid,
    super.companyId,
    super.companyName,
    super.companyNameArabic,
    super.tradeLicenceNo,
    super.licenceExpiryDate,
    super.bookBeginningDate,
    super.isActive,
    super.mailingName,
    super.authorisedPerson,
    super.address,
    super.phone,
    super.mobile,
    super.email,
    super.fax,
    super.website,
    double? countryId,
    double? stateIdPk,
    super.taxRegistrationType,
    super.enableTaxCalculation,
    super.taxRegNo,
    super.dateofTaxRegistration,
    super.taxReturnPeriod,
    super.startDate,
    super.endDate,
    super.incomeTaxNo,
    super.description,
    super.logo,
    super.softwareType,
    super.companyIdpk,
    super.isSelected,
  }) : super(
          countryId: countryId?.toDouble(),
          stateIdPk: stateIdPk?.toDouble(),
        );

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
        companyGuid: json["companyGuid"],
        companyId: json["companyID"],
        companyName: json["companyName"],
        companyNameArabic: json["companyNameArabic"],
        tradeLicenceNo: json["tradeLicenceNo"],
        licenceExpiryDate: json["licenceExpiryDate"] != null
            ? DateTime.parse(json["licenceExpiryDate"])
            : null,
        bookBeginningDate: json["bookBeginningDate"] != null
            ? DateTime.parse(json["bookBeginningDate"])
            : null,
        isActive: json["isActive"],
        mailingName: json["mailingName"],
        authorisedPerson: json["authorisedPerson"],
        address: json["address"],
        phone: json["phone"],
        mobile: json["mobile"],
        email: json["email"],
        fax: json["fax"],
        website: json["website"],
        countryId: _convertToDouble(json["countryID"]),
        stateIdPk: _convertToDouble(json["stateID_PK"]),
        taxRegistrationType: json["taxRegistrationType"],
        enableTaxCalculation: json["enableTaxCalculation"],
        taxRegNo: json["taxRegNo"],
        dateofTaxRegistration: json["dateofTaxRegistration"] != null
            ? DateTime.parse(json["dateofTaxRegistration"])
            : null,
        taxReturnPeriod: json["taxReturnPeriod"],
        startDate: json["startDate"] != null
            ? DateTime.parse(json["startDate"])
            : null,
        endDate:
            json["endDate"] != null ? DateTime.parse(json["endDate"]) : null,
        incomeTaxNo: json["incomeTaxNo"],
        description: json["description"],
        logo: json["logo"],
        softwareType: json["softwareType"],
        companyIdpk: json["companyIDPK"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "companyGuid": companyGuid,
        "companyID": companyId,
        "companyName": companyName,
        "companyNameArabic": companyNameArabic,
        "tradeLicenceNo": tradeLicenceNo,
        "licenceExpiryDate": licenceExpiryDate?.toIso8601String(),
        "bookBeginningDate": bookBeginningDate?.toIso8601String(),
        "isActive": isActive,
        "mailingName": mailingName,
        "authorisedPerson": authorisedPerson,
        "address": address,
        "phone": phone,
        "mobile": mobile,
        "email": email,
        "fax": fax,
        "website": website,
        "countryID": countryId,
        "stateID_PK": stateIdPk,
        "taxRegistrationType": taxRegistrationType,
        "enableTaxCalculation": enableTaxCalculation,
        "taxRegNo": taxRegNo,
        "dateofTaxRegistration": dateofTaxRegistration?.toIso8601String(),
        "taxReturnPeriod": taxReturnPeriod,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "incomeTaxNo": incomeTaxNo,
        "description": description,
        "logo": logo,
        "softwareType": softwareType,
        "companyIDPK": companyIdpk,
        "isSelected": isSelected,
      };
}

class StoreDetailsModel extends StoreDetailsEntity {
  StoreDetailsModel({
    super.storeIdpk,
    super.storeType,
    super.storeId,
    super.storeName,
    super.storeLocation,
    super.storeAddress,
    super.isActive,
    super.isEdit,
    super.isDefaultStore,
    super.createdBy,
    super.createdDate,
    super.modifiedBy,
    super.modifiedDate,
    super.rowguid,
  });

  factory StoreDetailsModel.fromJson(Map<String, dynamic> json) =>
      StoreDetailsModel(
        storeIdpk: json["storeIDPK"],
        storeType: json["storeType"],
        storeId: json["storeID"],
        storeName: json["storeName"],
        storeLocation: json["storeLocation"],
        storeAddress: json["storeAddress"],
        isActive: json["isActive"],
        isEdit: json["isEdit"],
        isDefaultStore: json["isDefaultStore"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"] != null
            ? DateTime.parse(json["createdDate"])
            : null,
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"] != null
            ? DateTime.parse(json["modifiedDate"])
            : null,
        rowguid: json["rowguid"],
      );

  Map<String, dynamic> toJson() => {
        "storeIDPK": storeIdpk,
        "storeType": storeType,
        "storeID": storeId,
        "storeName": storeName,
        "storeLocation": storeLocation,
        "storeAddress": storeAddress,
        "isActive": isActive,
        "isEdit": isEdit,
        "isDefaultStore": isDefaultStore,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
      };
}

double? _convertToDouble(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is int) {
    return value.toDouble();
  }
  if (value is double) {
    return value;
  }
  return null;
}
