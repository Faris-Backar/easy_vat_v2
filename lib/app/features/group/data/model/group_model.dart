import 'package:easy_vat_v2/app/features/group/domain/entity/group_entity.dart';

class GroupModel extends GroupEntity {
  GroupModel({
    super.groupIDPK,
    super.groupName,
    super.underGroup,
    super.underID,
    super.groupNatureIDFK,
    super.financialStatementIDFK,
    super.isEditable,
    super.updateGuid,
    super.modifiedDate,
    super.companyIDPK,
    super.openingBalance,
    super.openingBalanceType,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        groupIDPK: json["groupIDPK"],
        groupName: json["groupName"],
        underGroup: json["underGroup"],
        underID: json["underID"],
        groupNatureIDFK: json["groupNatureIDFK"],
        financialStatementIDFK: json["financialStatementIDFK"],
        isEditable: json["isEditable"],
        updateGuid: json["updateGuid"],
        modifiedDate: json["modifiedDate"] != null
            ? DateTime.parse(json["modifiedDate"])
            : null,
        companyIDPK: json["companyIDPK"],
        openingBalance: (json["openingBalance"] as num?)?.toDouble(),
        openingBalanceType: json["openingBalanceType"],
      );

  Map<String, dynamic> toJson() => {
        "groupIDPK": groupIDPK,
        "groupName": groupName,
        "underGroup": underGroup,
        "underID": underID,
        "groupNatureIDFK": groupNatureIDFK,
        "financialStatementIDFK": financialStatementIDFK,
        "isEditable": isEditable,
        "updateGuid": updateGuid,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "companyIDPK": companyIDPK,
        "openingBalance": openingBalance,
        "openingBalanceType": openingBalanceType,
      };
}
