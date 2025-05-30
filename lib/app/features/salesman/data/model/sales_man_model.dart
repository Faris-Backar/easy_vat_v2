import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';

class SalesManModel extends SalesManEntity {
  String? password;
  bool? isEdit;
  String? storeDetails;
  String? cashAccountDetails;
  String? userPermissions;

  SalesManModel({
    super.userIdpk,
    super.username,
    this.password,
    super.empName,
    super.userRoleIdpk,
    super.userRole,
    super.userPin,
    super.isActive,
    this.isEdit,
    this.storeDetails,
    this.cashAccountDetails,
    this.userPermissions,
  });

  factory SalesManModel.fromJson(Map<String, dynamic> json) => SalesManModel(
        userIdpk: json["userIDPK"],
        username: json["username"],
        password: json["password"],
        empName: json["empName"],
        userRoleIdpk: json["userRoleIDPK"],
        userRole: json["userRole"],
        userPin: json["userPin"],
        isActive: json["isActive"],
        isEdit: json["isEdit"],
        storeDetails: json["storeDetails"],
        cashAccountDetails: json["cashAccountDetails"],
        userPermissions: json["userPermissions"],
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
        "storeDetails": storeDetails,
        "cashAccountDetails": cashAccountDetails,
        "userPermissions": userPermissions,
      };
}
