class CountryEntity {
  final int? id;
  final String? countryID;
  final String? countryName;
  final String? countryCode;
  final String? countryDialCode;
  final String? currencyName;
  final String? currencySymbol;
  final String? currencyCode;
  final int? currencyDecimal;
  final String? rowguid;
  final DateTime? modifiedDate;
  final String? companyIDPK;
  CountryEntity({
    this.id,
    this.countryID,
    this.countryName,
    this.countryCode,
    this.countryDialCode,
    this.currencyName,
    this.currencySymbol,
    this.currencyCode,
    this.currencyDecimal,
    this.rowguid,
    this.modifiedDate,
    this.companyIDPK,
  });

  CountryEntity copyWith({
    int? id,
    String? countryID,
    String? countryName,
    String? countryCode,
    String? countryDialCode,
    String? currencyName,
    String? currencySymbol,
    String? currencyCode,
    int? currencyDecimal,
    String? rowguid,
    DateTime? modifiedDate,
    String? companyIDPK,
  }) {
    return CountryEntity(
      id: id ?? this.id,
      countryID: countryID ?? this.countryID,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
      countryDialCode: countryDialCode ?? this.countryDialCode,
      currencyName: currencyName ?? this.currencyName,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      currencyCode: currencyCode ?? this.currencyCode,
      currencyDecimal: currencyDecimal ?? this.currencyDecimal,
      rowguid: rowguid ?? this.rowguid,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      companyIDPK: companyIDPK ?? this.companyIDPK,
    );
  }

  @override
  String toString() {
    return "CountryEntity(id: $id, countryID: $countryID, countryName: $countryName, countryCode: $countryCode, countryDialCode: $countryDialCode, currencyName: $currencyName, currencySymbol: $currencySymbol, currencyCode: $currencyCode, currencyDecimal: $currencyDecimal, rowguid: $rowguid, modifiedDate: $modifiedDate, companyIDPK: $companyIDPK)";
  }
}
