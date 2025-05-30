import 'package:easy_vat_v2/app/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    super.isAuthenticated,
    super.message,
    super.accessTokens,
    super.userDetails,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        isAuthenticated: json["isAuthenticated"],
        message: json["message"],
        accessTokens: json["accessTokens"],
        userDetails: UserDetailsModel.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "isAuthenticated": isAuthenticated,
        "message": message,
        "accessTokens": accessTokens,
        // "userDetails": userDetails.toJson(),
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
        // userPermissions:
        //     List<dynamic>.from(json["userPermissions"].map((x) => x)),
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
        currentBalance: json["currentBalance"].toDouble(),
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
