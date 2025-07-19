class GroupEntity {
  final String? groupIDPK;
  final String? groupName;
  final String? underGroup;
  final String? underID;
  final int? groupNatureIDFK;
  final int? financialStatementIDFK;
  final bool? isEditable;
  final String? updateGuid;
  final DateTime? modifiedDate;
  final String? companyIDPK;
  final double? openingBalance;
  final String? openingBalanceType;
  GroupEntity({
    this.groupIDPK,
    this.groupName,
    this.underGroup,
    this.underID,
    this.groupNatureIDFK,
    this.financialStatementIDFK,
    this.isEditable,
    this.updateGuid,
    this.modifiedDate,
    this.companyIDPK,
    this.openingBalance,
    this.openingBalanceType,
  });

  GroupEntity copyWith({
    String? groupIDPK,
    String? groupName,
    String? underGroup,
    String? underID,
    int? groupNatureIDFK,
    int? financialStatementIDFK,
    bool? isEditable,
    String? updateGuid,
    DateTime? modifiedDate,
    String? companyIDPK,
    double? openingBalance,
    String? openingBalanceType,
  }) {
    return GroupEntity(
      groupIDPK: groupIDPK ?? this.groupIDPK,
      groupName: groupName ?? this.groupName,
      underGroup: underGroup ?? this.underGroup,
      underID: underID ?? this.underID,
      groupNatureIDFK: groupNatureIDFK ?? this.groupNatureIDFK,
      financialStatementIDFK:
          financialStatementIDFK ?? this.financialStatementIDFK,
      isEditable: isEditable ?? this.isEditable,
      updateGuid: updateGuid ?? this.updateGuid,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      companyIDPK: companyIDPK ?? this.companyIDPK,
      openingBalance: openingBalance ?? this.openingBalance,
      openingBalanceType: openingBalanceType ?? this.openingBalanceType,
    );
  }

  @override
  String toString() {
    return "GroupEntity(groupIDPK: $groupIDPK, groupName: $groupName, underGroup: $underGroup, underID: $underID, groupNatureIDFK: $groupNatureIDFK, financialStatementIDFK: $financialStatementIDFK, isEditable: $isEditable, updateGuid: $updateGuid, modifiedDate: $modifiedDate, companyIDPK: $companyIDPK, openingBalance: $openingBalance, openingBalanceType: $openingBalanceType)";
  }
}
