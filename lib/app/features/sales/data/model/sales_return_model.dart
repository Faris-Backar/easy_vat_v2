import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';

import 'dart:convert';

List<SalesReturnModel> salesReturnModelFromJson(String str) =>
    List<SalesReturnModel>.from(
        json.decode(str).map((x) => SalesReturnModel.fromJson(x)));

String salesReturnModelToJson(List<SalesReturnModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalesReturnModel extends SalesReturnEntity {
  SalesReturnModel({
    super.salesReturnIdpk,
    super.salesReturnNo,
    super.referenceNo,
    super.returnDate,
    super.saleIdfk,
    super.saleNo,
    super.salesReturnMode,
    super.crLedgerIdfk,
    super.drLedgerIdfk,
    super.customerIdfk,
    super.customerName,
    super.authorizedById,
    super.grossAmount,
    super.tax,
    super.discount,
    super.netTotal,
    super.roundOff,
    super.createdById,
    super.createdDate,
    super.modifiedById,
    super.modifiedDate,
    super.rowguid,
    super.isEditable,
    super.remarks,
    List<ReturnedItemModel>? returnedItems,
  }) : super(returnedItems: returnedItems);

  factory SalesReturnModel.fromJson(Map<String, dynamic> json) =>
      SalesReturnModel(
        salesReturnIdpk: json["salesReturnIDPK"],
        salesReturnNo: json["salesReturnNo"],
        referenceNo: json["referenceNo"],
        returnDate: DateTime.parse(json["returnDate"]),
        saleIdfk: json["saleIDFK"],
        saleNo: json["saleNo"],
        salesReturnMode: json["salesReturnMode"],
        crLedgerIdfk: json["crLedgerIDFK"],
        drLedgerIdfk: json["drLedgerIDFK"],
        customerIdfk: json["customerIDFK"],
        customerName: json["customerName"],
        authorizedById: json["authorizedByID"],
        grossAmount: json["grossAmount"],
        tax: json["tax"],
        discount: json["discount"],
        netTotal: json["netTotal"],
        roundOff: json["roundOff"],
        createdById: json["createdByID"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedById: json["modifiedByID"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        rowguid: json["rowguid"],
        isEditable: json["isEditable"],
        remarks: json["remarks"],
        returnedItems: (json["returnedItems"] != null ||
                json["returnedItems"].isNotEmpty)
            ? List<ReturnedItemModel>.from(
                json["returnedItems"].map((x) => ReturnedItemModel.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "salesReturnIDPK": salesReturnIdpk,
        "salesReturnNo": salesReturnNo,
        "referenceNo": referenceNo,
        "returnDate": returnDate?.toIso8601String(),
        "saleIDFK": saleIdfk,
        "saleNo": saleNo,
        "salesReturnMode": salesReturnMode,
        "crLedgerIDFK": crLedgerIdfk,
        "drLedgerIDFK": drLedgerIdfk,
        "customerIDFK": customerIdfk,
        "customerName": customerName,
        "authorizedByID": authorizedById,
        "grossAmount": grossAmount,
        "tax": tax,
        "discount": discount,
        "netTotal": netTotal,
        "roundOff": roundOff,
        "createdByID": createdById,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedByID": modifiedById,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
        "isEditable": isEditable,
        "remarks": remarks,
        "returnedItems": returnedItems != null
            ? List<dynamic>.from(returnedItems!
                .map((x) => x is ReturnedItemModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  // Helper methods for clean architecture
  List<ReturnedItemModel>? get modelReturnedItems => returnedItems
      ?.map((item) =>
          item is ReturnedItemModel ? item : ReturnedItemModel.fromEntity(item))
      .toList();
}

class ReturnedItemModel extends ReturnedItemEntity {
  ReturnedItemModel({
    super.salesReturnIdpk,
    super.itemIdpk,
    super.barcode,
    super.itemCode,
    super.itemName,
    super.unit,
    super.description,
    super.actualQty,
    super.billedQty,
    super.cost,
    super.sellingPrice,
    super.discount,
    super.grossTotal,
    super.taxAmount,
    super.taxPercentage,
    super.netTotal,
    super.storeIdfk,
    List<SubItemModel>? subItems,
  }) : super(subItems: subItems);

  factory ReturnedItemModel.fromJson(Map<String, dynamic> json) =>
      ReturnedItemModel(
        salesReturnIdpk: json["salesReturnIDPK"],
        itemIdpk: json["itemIDPK"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        unit: json["unit"],
        description: json["description"],
        actualQty: json["actualQty"],
        billedQty: json["billedQty"],
        cost: json["cost"],
        sellingPrice: json["sellingPrice"],
        discount: json["discount"],
        grossTotal: json["grossTotal"],
        taxAmount: json["taxAmount"],
        taxPercentage: json["taxPercentage"],
        netTotal: json["netTotal"],
        storeIdfk: json["storeIDFK"],
        subItems: json["subItems"] != null
            ? List<SubItemModel>.from(
                json["subItems"].map((x) => SubItemModel.fromJson(x)))
            : null,
      );

  // Create a model from an entity
  factory ReturnedItemModel.fromEntity(ReturnedItemEntity entity) {
    return ReturnedItemModel(
      salesReturnIdpk: entity.salesReturnIdpk,
      itemIdpk: entity.itemIdpk,
      barcode: entity.barcode,
      itemCode: entity.itemCode,
      itemName: entity.itemName,
      unit: entity.unit,
      description: entity.description,
      actualQty: entity.actualQty,
      billedQty: entity.billedQty,
      cost: entity.cost,
      sellingPrice: entity.sellingPrice,
      discount: entity.discount,
      grossTotal: entity.grossTotal,
      taxAmount: entity.taxAmount,
      taxPercentage: entity.taxPercentage,
      netTotal: entity.netTotal,
      storeIdfk: entity.storeIdfk,
      subItems: entity.subItems
          ?.map((item) =>
              item is SubItemModel ? item : SubItemModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "salesReturnIDPK": salesReturnIdpk,
        "itemIDPK": itemIdpk,
        "barcode": barcode,
        "itemCode": itemCode,
        "itemName": itemName,
        "unit": unit,
        "description": description,
        "actualQty": actualQty,
        "billedQty": billedQty,
        "cost": cost,
        "sellingPrice": sellingPrice,
        "discount": discount,
        "grossTotal": grossTotal,
        "taxAmount": taxAmount,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "storeIDFK": storeIdfk,
        "subItems": subItems != null
            ? List<dynamic>.from(subItems!
                .map((x) => x is SubItemModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  // Helper methods for clean architecture
  List<SubItemModel>? get modelSubItems => subItems
      ?.map(
          (item) => item is SubItemModel ? item : SubItemModel.fromEntity(item))
      .toList();
}

class SubItemModel extends SubItemEntity {
  SubItemModel({
    super.itemIdpk,
    super.barcode,
    super.itemCode,
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
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        description: json["description"],
        convention: json["convention"],
        unit: json["unit"],
        cost: json["cost"],
        retailRate: json["retailRate"],
        retailRateWithTax: json["retailRateWithTax"],
        retailPriceLock: json["retailPriceLock"],
        wholeSaleRate: json["wholeSaleRate"],
        wholeSalePriceLock: json["wholeSalePriceLock"],
        taxPercentage: json["taxPercentage"],
        currentStock: json["currentStock"],
        itemNameArabic: json["itemNameArabic"],
        accessLetter: json["accessLetter"],
        supplierIdfk: json["supplierIDFK"],
        isEditable: json["isEditable"],
      );

  // Create a model from an entity
  factory SubItemModel.fromEntity(SubItemEntity entity) {
    return SubItemModel(
      itemIdpk: entity.itemIdpk,
      barcode: entity.barcode,
      itemCode: entity.itemCode,
      itemName: entity.itemName,
      description: entity.description,
      convention: entity.convention,
      unit: entity.unit,
      cost: entity.cost,
      retailRate: entity.retailRate,
      retailRateWithTax: entity.retailRateWithTax,
      retailPriceLock: entity.retailPriceLock,
      wholeSaleRate: entity.wholeSaleRate,
      wholeSalePriceLock: entity.wholeSalePriceLock,
      taxPercentage: entity.taxPercentage,
      currentStock: entity.currentStock,
      itemNameArabic: entity.itemNameArabic,
      accessLetter: entity.accessLetter,
      supplierIdfk: entity.supplierIdfk,
      isEditable: entity.isEditable,
    );
  }

  Map<String, dynamic> toJson() => {
        "itemIDPK": itemIdpk,
        "barcode": barcode,
        "itemCode": itemCode,
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
}
