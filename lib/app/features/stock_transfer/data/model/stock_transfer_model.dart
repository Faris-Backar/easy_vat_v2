import 'dart:convert';

import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_entity.dart';

class StockTransferModel extends StockTransferEntity {
  StockTransferModel({super.message, super.stockTransfer, super.status});

  factory StockTransferModel.fromJson(Map<String, dynamic> json) =>
      StockTransferModel(
          status: json["status"],
          message: json["message"],
          stockTransfer: json["stockTransfer"] != null
              ? List<StockTransferListModel>.from(json["stockTransfer"]
                  .map((x) => StockTransferListModel.fromJson(x)))
              : []);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "stockTransfer": List<StockTransferListModel>.from(
            (stockTransfer as List<StockTransferListModel>?)
                    ?.map((x) => x.toJson()) ??
                [])
      };
}

class StockTransferListModel extends StockTransferListEntity {
  StockTransferListModel(
      {super.stockTransferIDPK,
      super.transferDate,
      super.transferNo,
      super.referenceNo,
      super.requestIDPK,
      super.requestNo,
      super.requestBy,
      super.fromStoreIDPK,
      super.toStoreIDPK,
      super.totalNetCost,
      super.totalSellValue,
      super.remarks,
      super.isEditable,
      super.isCanceled,
      super.createdBy,
      super.createdDate,
      super.modifiedBy,
      super.modifiedDate,
      super.rowguid,
      super.companyIDPK,
      super.fromStoreName,
      super.toStoreName,
      List<StockTransferDetailsModel>? stockTransferDetails})
      : super(stockTransferDetails: stockTransferDetails);

  factory StockTransferListModel.fromJson(Map<String, dynamic> json) =>
      StockTransferListModel(
          stockTransferIDPK: json["stockTransferIDPK"],
          transferDate: json["transferDate"] != null
              ? DateTime.parse(json["transferDate"])
              : null,
          transferNo: json["transferNo"],
          referenceNo: json["referenceNo"],
          requestIDPK: json["requestIDPK"],
          requestNo: json["requestNo"],
          requestBy: json["requestBy"],
          fromStoreIDPK: json["fromStoreIDPK"],
          toStoreIDPK: json["toStoreIDPK"],
          totalNetCost: json["totalNetCost"] != null
              ? (json["totalNetCost"] as num).toDouble()
              : null,
          totalSellValue: json["totalSellValue"] != null
              ? (json["totalSellValue"] as num).toDouble()
              : null,
          remarks: json["remarks"],
          isEditable: json["isEditable"],
          isCanceled: json["isCanceled"],
          createdBy: json["createdBy"],
          createdDate: json["createdDate"] != null
              ? DateTime.parse(json["createdDate"])
              : null,
          modifiedBy: json["modifiedBy"],
          modifiedDate: json["modifiedDate"] != null
              ? DateTime.parse(json["modifiedDate"])
              : null,
          rowguid: json["rowguid"],
          companyIDPK: json["companyIDPK"],
          fromStoreName: json["fromStoreName"],
          toStoreName: json["toStoreName"],
          stockTransferDetails: json["stockTransferDetails"] != null
              ? List<StockTransferDetailsModel>.from(
                  json["stockTransferDetails"]
                      .map((x) => StockTransferDetailsModel.fromJson(x)))
              : null);

  factory StockTransferListModel.fromEntity(StockTransferListEntity entity) {
    return StockTransferListModel(
        stockTransferIDPK: entity.stockTransferIDPK,
        transferDate: entity.transferDate,
        transferNo: entity.transferNo,
        referenceNo: entity.referenceNo,
        requestIDPK: entity.requestIDPK,
        requestNo: entity.requestNo,
        requestBy: entity.requestBy,
        fromStoreIDPK: entity.fromStoreIDPK,
        toStoreIDPK: entity.toStoreIDPK,
        totalNetCost: entity.totalNetCost,
        totalSellValue: entity.totalSellValue,
        remarks: entity.remarks,
        isEditable: entity.isEditable,
        isCanceled: entity.isCanceled,
        createdBy: entity.createdBy,
        createdDate: entity.createdDate,
        modifiedBy: entity.modifiedBy,
        modifiedDate: entity.modifiedDate,
        rowguid: entity.rowguid,
        companyIDPK: entity.companyIDPK,
        fromStoreName: entity.fromStoreName,
        toStoreName: entity.toStoreName,
        stockTransferDetails: entity.stockTransferDetails
            ?.map((item) => item is StockTransferDetailsModel
                ? item
                : StockTransferDetailsModel.fromEntity(item))
            .toList());
  }

  Map<String, dynamic> toJson() => {
        "stockTransferIDPK": stockTransferIDPK,
        "transferDate": transferDate?.toIso8601String(),
        "transferNo": transferNo,
        "referenceNo": referenceNo,
        "requestIDPK": requestIDPK,
        "requestNo": requestNo,
        "requestBy": requestBy,
        "fromStoreIDPK": fromStoreIDPK,
        "toStoreIDPK": toStoreIDPK,
        "totalNetCost": totalNetCost,
        "totalSellValue": totalSellValue,
        "remarks": remarks,
        "isEditable": isEditable,
        "isCanceled": isCanceled,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
        "companyIDPK": companyIDPK,
        "fromStoreName": fromStoreName,
        "toStoreName": toStoreName,
        "stockTransferDetails": stockTransferDetails != null
            ? List<dynamic>.from(stockTransferDetails!
                .map((x) => x is StockTransferDetailsModel ? x.toJson() : null)
                .where((x) => x != null))
            : []
      };

  List<StockTransferDetailsModel>? get modelStockTransferDetails =>
      stockTransferDetails
          ?.map((item) => item is StockTransferDetailsModel
              ? item
              : StockTransferDetailsModel.fromEntity(item))
          .toList();

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class StockTransferDetailsModel extends StockTransferDetailsEntity {
  StockTransferDetailsModel({
    super.stockTransferIDPK,
    super.itemIDPK,
    super.barcode,
    super.itemCode,
    super.itemName,
    super.unit,
    super.currentStock,
    super.description,
    super.requestedQty,
    super.transferQty,
    super.retailRate,
    super.cost,
    super.sellValue,
    super.stockValue,
    super.rowguid,
    super.companyIDPK,
    List<SubItemsModel>? subItems,
  }) : super(subItems: subItems);

  factory StockTransferDetailsModel.fromJson(Map<String, dynamic> json) =>
      StockTransferDetailsModel(
          stockTransferIDPK: json["stockTransferIDPK"],
          itemIDPK: json["itemIDPK"],
          barcode: json["barcode"],
          itemCode: json["itemCode"],
          itemName: json["itemName"],
          unit: json["unit"],
          currentStock: json["currentStock"] != null
              ? (json["currentStock"] as num).toDouble()
              : null,
          description: json["description"],
          requestedQty: json["requestedQty"] != null
              ? (json["requestedQty"] as num).toDouble()
              : null,
          transferQty: json["transferQty"] != null
              ? (json["transferQty"] as num).toDouble()
              : null,
          retailRate: json["retailRate"] != null
              ? (json["retailRate"] as num).toDouble()
              : null,
          cost: json["cost"] != null ? (json["cost"] as num).toDouble() : null,
          sellValue: json["sellValue"] != null
              ? (json["sellValue"] as num).toDouble()
              : null,
          stockValue: json["stockValue"] != null
              ? (json["stockValue"] as num).toDouble()
              : null,
          rowguid: json["rowguid"],
          companyIDPK: json["companyIDPK"],
          subItems: json["subItems"] != null
              ? List<SubItemsModel>.from(
                  json["subItems"].map((x) => SubItemsModel.fromJson(x)))
              : null);
  factory StockTransferDetailsModel.fromEntity(
      StockTransferDetailsEntity entity) {
    return StockTransferDetailsModel(
        stockTransferIDPK: entity.stockTransferIDPK,
        itemIDPK: entity.itemIDPK,
        barcode: entity.barcode,
        itemCode: entity.itemCode,
        itemName: entity.itemName,
        unit: entity.unit,
        currentStock: entity.currentStock,
        description: entity.description,
        requestedQty: entity.requestedQty,
        transferQty: entity.transferQty,
        retailRate: entity.retailRate,
        cost: entity.cost,
        sellValue: entity.sellValue,
        stockValue: entity.stockValue,
        rowguid: entity.rowguid,
        companyIDPK: entity.companyIDPK,
        subItems: entity.subItems
            ?.map((item) =>
                item is SubItemsModel ? item : SubItemsModel.fromEntity(item))
            .toList());
  }

  Map<String, dynamic> toJson() => {
        "stockTransferIDPK": stockTransferIDPK,
        "itemIDPK": itemIDPK,
        "barcode": barcode,
        "itemCode": itemCode,
        "itemName": itemName,
        "unit": unit,
        "currentStock": currentStock,
        "description": description,
        "requestedQty": requestedQty,
        "transferQty": transferQty,
        "retailRate": retailRate,
        "cost": cost,
        "sellValue": sellValue,
        "stockValue": stockValue,
        "rowguid": rowguid,
        "companyIDPK": companyIDPK,
        "subItems": subItems != null
            ? List<dynamic>.from(subItems!
                .map((x) => x is SubItemsModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  List<SubItemsModel>? get modelSubItems => subItems
      ?.map((item) =>
          item is SubItemsModel ? item : SubItemsModel.fromEntity(item))
      .toList();

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class SubItemsModel extends SubItemsEntity {
  SubItemsModel({
    super.itemIDPK,
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
    super.supplierIDFK,
    super.isEditable,
  });

  factory SubItemsModel.fromJson(Map<String, dynamic> json) => SubItemsModel(
        itemIDPK: json["itemIDPK"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        description: json["description"],
        convention: json["convention"],
        unit: json["unit"],
        cost: json["cost"] != null ? (json["cost"] as num).toDouble() : null,
        retailRate: json["retailRate"] != null
            ? (json["retailRate"] as num).toDouble()
            : null,
        retailRateWithTax: json["retailRateWithTax"] != null
            ? (json["retailRateWithTax"] as num).toDouble()
            : null,
        retailPriceLock: json["retailPriceLock"] != null
            ? (json["retailPriceLock"] as num).toDouble()
            : null,
        wholeSaleRate: json["wholeSaleRate"] != null
            ? (json["wholeSaleRate"] as num).toDouble()
            : null,
        wholeSalePriceLock: json["wholeSalePriceLock"] != null
            ? (json["wholeSalePriceLock"] as num).toDouble()
            : null,
        taxPercentage: json["taxPercentage"] != null
            ? (json["taxPercentage"] as num).toDouble()
            : null,
        currentStock: json["currentStock"] != null
            ? (json["currentStock"] as num).toDouble()
            : null,
        itemNameArabic: json["itemNameArabic"],
        accessLetter: json["accessLetter"],
        supplierIDFK: json["supplierIDFK"],
        isEditable: json["isEditable"],
      );

  factory SubItemsModel.fromEntity(SubItemsEntity entity) {
    return SubItemsModel(
      itemIDPK: entity.itemIDPK,
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
      supplierIDFK: entity.supplierIDFK,
      isEditable: entity.isEditable,
    );
  }

  Map<String, dynamic> toJson() => {
        "itemIDPK": itemIDPK,
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
        "supplierIDFK": supplierIDFK,
        "isEditable": isEditable,
      };
  @override
  String toString() {
    return json.encode(toJson());
  }
}
