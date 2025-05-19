import 'package:easy_vat_v2/app/features/sales/domain/entities/sub_item_entity.dart';

class SubItemModel extends SubItemEntity {
  SubItemModel({
    super.itemIdpk,
    super.barcode,
    super.itemName,
    super.description,
    super.convention,
    super.unit,
    super.cost,
    super.retailRate,
    super.retailRateWithTax,
    super.retailPriceLock,
    super.wholeSaleRate,
    super.wholeSalePriceLock,
    super.taxPercentage,
    super.currentStock,
    super.itemNameArabic,
    super.accessLetter,
    super.supplierIdfk,
    super.isEditable,
  });

  factory SubItemModel.fromJson(Map<String, dynamic> json) => SubItemModel(
        itemIdpk: json["itemIDPK"],
        barcode: json["barcode"],
        itemName: json["itemName"],
        description: json["description"],
        convention: double.tryParse(json["convention"].toString()),
        unit: json["unit"],
        cost: double.tryParse(json["cost"].toString()),
        retailRate: double.tryParse(json["retailRate"].toString()),
        retailRateWithTax:
            double.tryParse(json["retailRateWithTax"].toString()),
        retailPriceLock: double.tryParse(json["retailPriceLock"].toString()),
        wholeSaleRate: double.tryParse(json["wholeSaleRate"].toString()),
        wholeSalePriceLock:
            double.tryParse(json["wholeSalePriceLock"].toString()),
        taxPercentage: double.tryParse(json["taxPercentage"].toString()),
        currentStock: double.tryParse(json["currentStock"].toString()),
        itemNameArabic: json["itemNameArabic"],
        accessLetter: json["accessLetter"],
        supplierIdfk: json["supplierIDFK"],
        isEditable: json["isEditable"],
      );

  Map<String, dynamic> toJson() => {
        "itemIDPK": itemIdpk,
        "barcode": barcode,
        "itemName": itemName,
        "description": description,
        "convention": convention,
        "unit": unit,
        "cost": cost,
        "retailRate": retailRate,
        "retailRateWithTax": retailRateWithTax,
        "retailPriceLock": retailPriceLock,
        "wholeSaleRate": wholeSaleRate,
        "wholeSalePriceLock": wholeSalePriceLock,
        "taxPercentage": taxPercentage,
        "currentStock": currentStock,
        "itemNameArabic": itemNameArabic,
        "accessLetter": accessLetter,
        "supplierIDFK": supplierIdfk,
        "isEditable": isEditable,
      };

  // Convert Model to Entity
  SubItemEntity toEntity() {
    return SubItemEntity(
      itemIdpk: itemIdpk,
      barcode: barcode,
      itemCode: null, // It seems this field is not present in your model
      itemName: itemName,
      description: description,
      convention: convention,
      unit: unit,
      cost: cost,
      retailRate: retailRate,
      retailRateWithTax: retailRateWithTax,
      retailPriceLock: retailPriceLock,
      wholeSaleRate: wholeSaleRate,
      wholeSalePriceLock: wholeSalePriceLock,
      taxPercentage: taxPercentage,
      currentStock: currentStock,
      itemNameArabic: itemNameArabic,
      accessLetter: accessLetter,
      supplierIdfk: supplierIdfk,
      isEditable: isEditable,
    );
  }
}
