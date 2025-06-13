class LoginEntity {
  bool? isAuthenticated;
  String? message;
  String? accessTokens;
  UserDetailsEntity? userDetails;

  LoginEntity({
    this.isAuthenticated,
    this.message,
    this.accessTokens,
    this.userDetails,
  });
}

class UserDetailsEntity {
  String? userIdpk;
  String? username;
  String? password;
  String? empName;
  int? userRoleIdpk;
  String? userRole;
  int? userPin;
  bool? isActive;
  bool? isEdit;
  StoreDetailsEntity? storeDetails;
  CashAccountDetailsEntity? cashAccountDetails;
  // List<dynamic> userPermissions;

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
    // this.userPermissions,
  });

  toJson() {}
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
