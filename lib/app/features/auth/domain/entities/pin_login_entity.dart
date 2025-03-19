class PinLoginEntity {
  bool isAuthenticated;
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
  int? userRoleIdpk;
  String? userRole;
  int? userPin;
  bool? isActive;
  bool? isEdit;
  StoreDetailsEntity? storeDetails;
  CashAccountDetailsEntity? cashAccountDetails;
  List<UserPermissionEntity>? userPermissions;

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

class UserPermissionEntity {
  String? userIdpk;
  String? formNameId;
  String? formName;
  bool? pView;
  bool? pInsert;
  bool? pUpdate;
  bool? pDelete;
  bool? pPrint;
  bool? pRePrint;
  bool? pAutherization;
  bool? isEdit;
  String? companyIdpk;

  UserPermissionEntity({
    this.userIdpk,
    this.formNameId,
    this.formName,
    this.pView,
    this.pInsert,
    this.pUpdate,
    this.pDelete,
    this.pPrint,
    this.pRePrint,
    this.pAutherization,
    this.isEdit,
    this.companyIdpk,
  });
}
