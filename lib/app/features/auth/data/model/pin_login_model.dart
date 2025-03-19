import 'package:easy_vat_v2/app/features/auth/domain/entities/pin_login_entity.dart';

class PinLoginModel extends PinLoginEntity {
  PinLoginModel({
    required super.isAuthenticated,
    required super.message,
    super.userDetails,
    super.ledgerBookInfo,
  });

  factory PinLoginModel.fromJson(Map<String, dynamic> json) => PinLoginModel(
        isAuthenticated: json["isAuthenticated"],
        message: json["message"],
        userDetails: UserDetailsModel.fromJson(json["userDetails"]),
        ledgerBookInfo: LedgerBookInfoModel.fromJson(json["ledgerBookInfo"]),
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
        cashBook: BookModel.fromJson(json["cashBook"]),
        bankBook: BookModel.fromJson(json["bankBook"]),
        customerBook: BookModel.fromJson(json["customerBook"]),
        supplierBook: BookModel.fromJson(json["supplierBook"]),
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
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        userIdpk: json["userIDPK"],
        username: json["username"],
        password: json["password"],
        empName: json["empName"],
        userRoleIdpk: json["userRoleIDPK"],
        userRole: json["userRole"],
        userPin: json["userPin"],
        isActive: json["isActive"],
        isEdit: json["isEdit"],
        storeDetails: StoreDetailsModel.fromJson(json["storeDetails"]),
        cashAccountDetails:
            CashAccountDetailsModel.fromJson(json["cashAccountDetails"]),
        userPermissions: List<UserPermissionModel>.from(json["userPermissions"]
            .map((x) => UserPermissionModel.fromJson(x))),
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
        ledgerIdpk: json["ledgerIDPK"],
        ledgerName: json["ledgerName"],
        currentBalance: json["currentBalance"],
        currentBalanceType: json["currentBalanceType"],
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
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
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
        userIdpk: json["userIDPK"],
        formNameId: json["formNameID"],
        formName: json["formName"],
        pView: json["pView"],
        pInsert: json["pInsert"],
        pUpdate: json["pUpdate"],
        pDelete: json["pDelete"],
        pPrint: json["pPrint"],
        pRePrint: json["pRePrint"],
        pAutherization: json["pAutherization"],
        isEdit: json["isEdit"],
        companyIdpk: json["companyIDPK"],
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
