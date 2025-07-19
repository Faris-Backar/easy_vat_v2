import 'package:easy_vat_v2/app/features/country/domain/entity/country_state_entity.dart';

class CountryStateModel extends CountryStateEntity {
  CountryStateModel({
    super.stateIDPK,
    super.countryIDFK,
    super.statName,
    super.rowguid,
    super.modifiedDate,
    super.companyIDPK,
  });

  factory CountryStateModel.fromJson(Map<String, dynamic> json) =>
      CountryStateModel(
        stateIDPK: json["stateID_PK"],
        countryIDFK: json["countryID_FK"],
        statName: json["statName"],
        rowguid: json["rowguid"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        companyIDPK: json["companyIDPK"],
      );

  Map<String, dynamic> toJson() => {
        "stateID_PK": stateIDPK,
        "countryID_FK": countryIDFK,
        "statName": statName,
        "rowguid": rowguid,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "companyIDPK": companyIDPK,
      };
}
