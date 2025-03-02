// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemModelImpl _$$ItemModelImplFromJson(Map<String, dynamic> json) =>
    _$ItemModelImpl(
      itemIdpk: json['itemIdpk'] as String?,
      barcode: json['barcode'] as String?,
      itemCode: json['itemCode'] as String?,
      itemName: json['itemName'] as String?,
      description: json['description'] as String?,
      unit: json['unit'] as String?,
      category: json['category'] as String?,
      subCategory: json['subCategory'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      averageCost: (json['averageCost'] as num?)?.toDouble(),
      lastPurchaseCost: (json['lastPurchaseCost'] as num?)?.toDouble(),
      retailRate: (json['retailRate'] as num?)?.toDouble(),
      retailPriceLock: (json['retailPriceLock'] as num?)?.toDouble(),
      wholeSaleRate: (json['wholeSaleRate'] as num?)?.toDouble(),
      wholeSalePriceLock: (json['wholeSalePriceLock'] as num?)?.toDouble(),
      taxPercentage: (json['taxPercentage'] as num?)?.toDouble(),
      openingStock: (json['openingStock'] as num?)?.toInt(),
      openingCost: (json['openingCost'] as num?)?.toDouble(),
      currentStock: (json['currentStock'] as num?)?.toDouble(),
      itemNameArabic: json['itemNameArabic'] as String?,
      make: json['make'] as String?,
      brand: json['brand'] as String?,
      madeIn: json['madeIn'] as String?,
      itemType: json['itemType'] as String?,
      shelfNo: json['shelfNo'] as String?,
      rackNo: json['rackNo'] as String?,
      convention: (json['convention'] as num?)?.toInt(),
      isMaster: json['isMaster'] as bool?,
      accessLetter: json['accessLetter'] as String?,
      quickItem: json['quickItem'] as bool?,
      maxDiscPerc: (json['maxDiscPerc'] as num?)?.toDouble(),
      reorderLevel: (json['reorderLevel'] as num?)?.toInt(),
      reorderQty: (json['reorderQty'] as num?)?.toInt(),
      supplierIdfk: json['supplierIdfk'] as String?,
      kitchenNo: (json['kitchenNo'] as num?)?.toInt(),
      isEditable: json['isEditable'] as bool?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      createdBy: json['createdBy'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      updateGuid: json['updateGuid'] as String?,
      isActive: json['isActive'] as bool?,
      enableSerial: json['enableSerial'] as bool?,
      isScaleItem: json['isScaleItem'] as bool?,
      storeCurrentStock: (json['storeCurrentStock'] as List<dynamic>?)
          ?.map((e) => StoreCurrentStock.fromJson(e as Map<String, dynamic>))
          .toList(),
      subItems: (json['subItems'] as List<dynamic>?)
          ?.map((e) => SubItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItemModelImplToJson(_$ItemModelImpl instance) =>
    <String, dynamic>{
      'itemIdpk': instance.itemIdpk,
      'barcode': instance.barcode,
      'itemCode': instance.itemCode,
      'itemName': instance.itemName,
      'description': instance.description,
      'unit': instance.unit,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'cost': instance.cost,
      'averageCost': instance.averageCost,
      'lastPurchaseCost': instance.lastPurchaseCost,
      'retailRate': instance.retailRate,
      'retailPriceLock': instance.retailPriceLock,
      'wholeSaleRate': instance.wholeSaleRate,
      'wholeSalePriceLock': instance.wholeSalePriceLock,
      'taxPercentage': instance.taxPercentage,
      'openingStock': instance.openingStock,
      'openingCost': instance.openingCost,
      'currentStock': instance.currentStock,
      'itemNameArabic': instance.itemNameArabic,
      'make': instance.make,
      'brand': instance.brand,
      'madeIn': instance.madeIn,
      'itemType': instance.itemType,
      'shelfNo': instance.shelfNo,
      'rackNo': instance.rackNo,
      'convention': instance.convention,
      'isMaster': instance.isMaster,
      'accessLetter': instance.accessLetter,
      'quickItem': instance.quickItem,
      'maxDiscPerc': instance.maxDiscPerc,
      'reorderLevel': instance.reorderLevel,
      'reorderQty': instance.reorderQty,
      'supplierIdfk': instance.supplierIdfk,
      'kitchenNo': instance.kitchenNo,
      'isEditable': instance.isEditable,
      'createdDate': instance.createdDate?.toIso8601String(),
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'updateGuid': instance.updateGuid,
      'isActive': instance.isActive,
      'enableSerial': instance.enableSerial,
      'isScaleItem': instance.isScaleItem,
      'storeCurrentStock': instance.storeCurrentStock,
      'subItems': instance.subItems,
    };

_$StoreCurrentStockImpl _$$StoreCurrentStockImplFromJson(
        Map<String, dynamic> json) =>
    _$StoreCurrentStockImpl(
      storeIdpk: json['storeIdpk'] as String?,
      itemIdpk: json['itemIdpk'] as String?,
      currentStock: (json['currentStock'] as num?)?.toInt(),
      companyIdpk: json['companyIdpk'] as String?,
    );

Map<String, dynamic> _$$StoreCurrentStockImplToJson(
        _$StoreCurrentStockImpl instance) =>
    <String, dynamic>{
      'storeIdpk': instance.storeIdpk,
      'itemIdpk': instance.itemIdpk,
      'currentStock': instance.currentStock,
      'companyIdpk': instance.companyIdpk,
    };

_$SubItemImpl _$$SubItemImplFromJson(Map<String, dynamic> json) =>
    _$SubItemImpl(
      itemIdpk: json['itemIdpk'] as String?,
      barcode: json['barcode'] as String?,
      itemName: json['itemName'] as String?,
      description: json['description'] as String?,
      convention: (json['convention'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      retailRate: (json['retailRate'] as num?)?.toDouble(),
      retailRateWithTax: (json['retailRateWithTax'] as num?)?.toDouble(),
      retailPriceLock: (json['retailPriceLock'] as num?)?.toDouble(),
      wholeSaleRate: (json['wholeSaleRate'] as num?)?.toDouble(),
      wholeSalePriceLock: (json['wholeSalePriceLock'] as num?)?.toDouble(),
      taxPercentage: (json['taxPercentage'] as num?)?.toDouble(),
      currentStock: (json['currentStock'] as num?)?.toDouble(),
      itemNameArabic: json['itemNameArabic'] as String?,
      accessLetter: json['accessLetter'] as String?,
      supplierIdfk: json['supplierIdfk'] as String?,
      isEditable: json['isEditable'] as bool?,
    );

Map<String, dynamic> _$$SubItemImplToJson(_$SubItemImpl instance) =>
    <String, dynamic>{
      'itemIdpk': instance.itemIdpk,
      'barcode': instance.barcode,
      'itemName': instance.itemName,
      'description': instance.description,
      'convention': instance.convention,
      'unit': instance.unit,
      'cost': instance.cost,
      'retailRate': instance.retailRate,
      'retailRateWithTax': instance.retailRateWithTax,
      'retailPriceLock': instance.retailPriceLock,
      'wholeSaleRate': instance.wholeSaleRate,
      'wholeSalePriceLock': instance.wholeSalePriceLock,
      'taxPercentage': instance.taxPercentage,
      'currentStock': instance.currentStock,
      'itemNameArabic': instance.itemNameArabic,
      'accessLetter': instance.accessLetter,
      'supplierIdfk': instance.supplierIdfk,
      'isEditable': instance.isEditable,
    };
