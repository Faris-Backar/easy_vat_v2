import 'package:easy_vat_v2/app/features/country/domain/entity/country_entity.dart';

class CountryModel extends CountryEntity {
  CountryModel({
    super.id,
    super.countryID,
    super.countryName,
    super.countryCode,
    super.countryDialCode,
    super.currencyName,
    super.currencySymbol,
    super.currencyCode,
    super.currencyDecimal,
    super.rowguid,
    super.modifiedDate,
    super.companyIDPK,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        countryID: json["countryID"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        countryDialCode: json["countryDialCode"],
        currencyName: json["currencyName"],
        currencySymbol: json["currencySymbol"],
        currencyCode: json["currencyCode"],
        currencyDecimal: json["currencyDecimal"],
        rowguid: json["rowguid"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        companyIDPK: json["companyIDPK"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "countryID": countryID,
        "countryName": countryName,
        "countryCode": countryCode,
        "countryDialCode": countryDialCode,
        "currencyName": currencyName,
        "currencySymbol": currencySymbol,
        "currencyCode": currencyCode,
        "currencyDecimal": currencyDecimal,
        "rowguid": rowguid,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "companyIDPK": companyIDPK,
      };
}
