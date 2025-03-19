import 'package:easy_vat_v2/app/features/auth/domain/entities/pin_login_entity.dart';

class PinLoginModel extends PinLoginEntity {
  PinLoginModel({
    required super.isAuthenticated,
    required super.message,
    super.userDetails,
    super.ledgerBookInfo,
  });

  factory PinLoginModel.fromJson(Map<String, dynamic> json) => PinLoginModel(
        isAuthenticated:
            json["isAuthenticated"] ?? false, // Default to false if null
        message: json["message"] ?? "", // Default to empty string if null
        userDetails: json["userDetails"] != null
            ? UserDetailsModel.fromJson(json["userDetails"])
            : null, // Check if userDetails is not null before calling fromJson
        ledgerBookInfo: json["ledgerBookInfo"] != null
            ? LedgerBookInfoModel.fromJson(json["ledgerBookInfo"])
            : null, // Check if ledgerBookInfo is not null before calling fromJson
      );
}

class LedgerBookInfoModel extends LedgerBookInfoEntity {
  LedgerBookInfoModel({
    super.cashBook,
    super.bankBook,
    super.customerBook,
    super.supplierBook,
  });

  factory LedgerBookInfoModel.fromJson(Map<String, dynamic> json) =>
      LedgerBookInfoModel(
        cashBook: json["cashBook"] != null
            ? BookModel.fromJson(json["cashBook"])
            : null, // Null check before calling fromJson
        bankBook: json["bankBook"] != null
            ? BookModel.fromJson(json["bankBook"])
            : null, // Null check before calling fromJson
        customerBook: json["customerBook"] != null
            ? BookModel.fromJson(json["customerBook"])
            : null, // Null check before calling fromJson
        supplierBook: json["supplierBook"] != null
            ? BookModel.fromJson(json["supplierBook"])
            : null, // Null check before calling fromJson
      );
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
        groupIdpk: json["groupIDPK"] ?? "", // Default to empty string if null
        groupName: json["groupName"] ?? "", // Default to empty string if null
        underGroup: json["underGroup"] ?? "", // Default to empty string if null
        underId: json["underID"] ?? "", // Default to empty string if null
        currentBalance: json["currentBalance"] ?? 0.0, // Default to 0.0 if null
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
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        userIdpk: json["userIDPK"] ?? "", // Default to empty string if null
        username: json["username"] ?? "", // Default to empty string if null
        password: json["password"] ?? "", // Default to empty string if null
        empName: json["empName"] ?? "", // Default to empty string if null
        userRoleIdpk:
            json["userRoleIDPK"] ?? "", // Default to empty string if null
        userRole: json["userRole"] ?? "", // Default to empty string if null
        userPin: json["userPin"] ?? "", // Default to empty string if null
        isActive: json["isActive"] ?? false, // Default to false if null
        isEdit: json["isEdit"] ?? false, // Default to false if null
        storeDetails: json["storeDetails"] != null
            ? StoreDetailsModel.fromJson(json["storeDetails"])
            : null, // Check if storeDetails is not null before calling fromJson
        cashAccountDetails: json["cashAccountDetails"] != null
            ? CashAccountDetailsModel.fromJson(json["cashAccountDetails"])
            : null, // Check if cashAccountDetails is not null before calling fromJson
        userPermissions: json["userPermissions"] != null
            ? List<UserPermissionModel>.from(json["userPermissions"]
                .map((x) => UserPermissionModel.fromJson(x)))
            : [], // Default to an empty list if null
      );
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
        ledgerIdpk: json["ledgerIDPK"] ?? "", // Default to empty string if null
        ledgerName: json["ledgerName"] ?? "", // Default to empty string if null
        currentBalance: json["currentBalance"] ?? 0.0, // Default to 0.0 if null
        currentBalanceType:
            json["currentBalanceType"] ?? "", // Default to empty string if null
      );

  Map<String, dynamic> toJson() => {
        "ledgerIDPK": ledgerIdpk,
        "ledgerName": ledgerName,
        "currentBalance": currentBalance,
        "currentBalanceType": currentBalanceType,
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
        storeIdpk: json["storeIDPK"] ?? "", // Default to empty string if null
        storeType: json["storeType"] ?? "", // Default to empty string if null
        storeId: json["storeID"] ?? "", // Default to empty string if null
        storeName: json["storeName"] ?? "", // Default to empty string if null
        storeLocation:
            json["storeLocation"] ?? "", // Default to empty string if null
        storeAddress:
            json["storeAddress"] ?? "", // Default to empty string if null
        isActive: json["isActive"] ?? false, // Default to false if null
        isEdit: json["isEdit"] ?? false, // Default to false if null
        isDefaultStore:
            json["isDefaultStore"] ?? false, // Default to false if null
        createdBy: json["createdBy"] ?? "", // Default to empty string if null
        createdDate: json["createdDate"] != null
            ? DateTime.parse(json["createdDate"])
            : null, // Parse DateTime if present, else null
        modifiedBy: json["modifiedBy"] ?? "", // Default to empty string if null
        modifiedDate: json["modifiedDate"] != null
            ? DateTime.parse(json["modifiedDate"])
            : null, // Parse DateTime if present, else null
        rowguid: json["rowguid"] ?? "", // Default to empty string if null
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

class UserPermissionModel extends UserPermissionEntity {
  UserPermissionModel({
    super.userIdpk,
    super.formNameId,
    super.formName,
    super.pView,
    super.pInsert,
    super.pUpdate,
    super.pDelete,
    super.pPrint,
    super.pRePrint,
    super.pAutherization,
    super.isEdit,
    super.companyIdpk,
  });

  factory UserPermissionModel.fromJson(Map<String, dynamic> json) =>
      UserPermissionModel(
        userIdpk: json["userIDPK"] ?? "", // Default to empty string if null
        formNameId: json["formNameID"] ?? "", // Default to empty string if null
        formName: json["formName"] ?? "", // Default to empty string if null
        pView: json["pView"] ?? false, // Default to false if null
        pInsert: json["pInsert"] ?? false, // Default to false if null
        pUpdate: json["pUpdate"] ?? false, // Default to false if null
        pDelete: json["pDelete"] ?? false, // Default to false if null
        pPrint: json["pPrint"] ?? false, // Default to false if null
        pRePrint: json["pRePrint"] ?? false, // Default to false if null
        pAutherization:
            json["pAutherization"] ?? false, // Default to false if null
        isEdit: json["isEdit"] ?? false, // Default to false if null
        companyIdpk:
            json["companyIDPK"] ?? "", // Default to empty string if null
      );

  Map<String, dynamic> toJson() => {
        "userIDPK": userIdpk,
        "formNameID": formNameId,
        "formName": formName,
        "pView": pView,
        "pInsert": pInsert,
        "pUpdate": pUpdate,
        "pDelete": pDelete,
        "pPrint": pPrint,
        "pRePrint": pRePrint,
        "pAutherization": pAutherization,
        "isEdit": isEdit,
        "companyIDPK": companyIdpk,
      };
}
