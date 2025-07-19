class CountryStateEntity {
  final int? stateIDPK;
  final int? countryIDFK;
  final String? statName;
  final String? rowguid;
  final DateTime? modifiedDate;
  final String? companyIDPK;
  CountryStateEntity({
    this.stateIDPK,
    this.countryIDFK,
    this.statName,
    this.rowguid,
    this.modifiedDate,
    this.companyIDPK,
  });

  CountryStateEntity copyWith({
    int? stateIDPK,
    int? countryIDFK,
    String? statName,
    String? rowguid,
    DateTime? modifiedDate,
    String? companyIDPK,
  }) {
    return CountryStateEntity(
      stateIDPK: stateIDPK ?? this.stateIDPK,
      countryIDFK: countryIDFK ?? this.countryIDFK,
      statName: statName ?? this.statName,
      rowguid: rowguid ?? this.rowguid,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      companyIDPK: companyIDPK ?? this.companyIDPK,
    );
  }

  @override
  String toString() {
    return "StateEntity(stateIDPK: $stateIDPK, countryIDFK: $countryIDFK, statName: $statName, rowguid: $rowguid, modifiedDate: $modifiedDate, companyIDPK: $companyIDPK)";
  }
}
