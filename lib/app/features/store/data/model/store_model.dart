import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';

class StoreModel extends StoreEntity {
  StoreModel({
    super.storeIDPK,
    super.storeType,
    super.storeID,
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
    super.rowguide,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        storeIDPK: json["storeIDPK"],
        storeType: json["storeType"],
        storeID: json["storeID"],
        storeName: json["storeName"],
        storeLocation: json["storeLocation"],
        storeAddress: json["storeAddress"],
        isActive: json["isActive"],
        isEdit: json["isEdit"],
        isDefaultStore: json["isDefaultStore"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"] != null
            ? DateTime.parse(json["createdDate"])
            : null,
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"] != null
            ? DateTime.parse(json["modifiedDate"])
            : null,
        rowguide: json["rowguide"],
      );

  factory StoreModel.fromEntity(StoreEntity entity) => StoreModel(
        storeIDPK: entity.storeIDPK,
        storeType: entity.storeType,
        storeID: entity.storeID,
        storeName: entity.storeName,
        storeLocation: entity.storeLocation,
        storeAddress: entity.storeAddress,
        isActive: entity.isActive,
        isEdit: entity.isEdit,
        isDefaultStore: entity.isDefaultStore,
        createdBy: entity.createdBy,
        createdDate: entity.createdDate,
        modifiedBy: entity.modifiedBy,
        modifiedDate: entity.modifiedDate,
        rowguide: entity.rowguide,
      );

  Map<String, dynamic> toJson() => {
        "storeIDPK": storeIDPK,
        "storeType": storeType,
        "storeID": storeID,
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
        "rowguide": rowguide,
      };
}
