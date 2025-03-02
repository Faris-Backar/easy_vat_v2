class ItemEntity {
  final String? itemIdpk;
  final String? barcode;
  final String? itemCode;
  final String? itemName;
  final String? description;
  final String? unit;
  final String? category;
  final String? subCategory;
  final double? cost;
  final double? averageCost;
  final double? lastPurchaseCost;
  final double? retailRate;
  final double? retailPriceLock;
  final double? wholeSaleRate;
  final double? wholeSalePriceLock;
  final double? taxPercentage;
  final int? openingStock;
  final double? openingCost;
  final double? currentStock;
  final String? itemNameArabic;
  final String? make;
  final String? brand;
  final String? madeIn;
  final String? itemType;
  final String? shelfNo;
  final String? rackNo;
  final int? convention;
  final bool? isMaster;
  final String? accessLetter;
  final bool? quickItem;
  final double? maxDiscPerc;
  final int? reorderLevel;
  final int? reorderQty;
  final String? supplierIdfk;
  final int? kitchenNo;
  final bool? isEditable;
  final DateTime? createdDate;
  final String? createdBy;
  final String? modifiedBy;
  final DateTime? updatedDate;
  final String? updateGuid;
  final bool? isActive;
  final bool? enableSerial;
  final bool? isScaleItem;
  final List<StoreCurrentStockEntity>? storeCurrentStock;
  final List<SubItemEntity>? subItems;

  ItemEntity(
      {this.itemIdpk,
      this.barcode,
      this.itemCode,
      this.itemName,
      this.description,
      this.unit,
      this.category,
      this.subCategory,
      this.cost,
      this.averageCost,
      this.lastPurchaseCost,
      this.retailRate,
      this.retailPriceLock,
      this.wholeSaleRate,
      this.wholeSalePriceLock,
      this.taxPercentage,
      this.openingStock,
      this.openingCost,
      this.currentStock,
      this.itemNameArabic,
      this.make,
      this.brand,
      this.madeIn,
      this.itemType,
      this.shelfNo,
      this.rackNo,
      this.convention,
      this.isMaster,
      this.accessLetter,
      this.quickItem,
      this.maxDiscPerc,
      this.reorderLevel,
      this.reorderQty,
      this.supplierIdfk,
      this.kitchenNo,
      this.isEditable,
      this.createdDate,
      this.createdBy,
      this.modifiedBy,
      this.updatedDate,
      this.updateGuid,
      this.isActive,
      this.enableSerial,
      this.isScaleItem,
      this.storeCurrentStock,
      this.subItems});
}

class StoreCurrentStockEntity {
  final String? storeIdpk;
  final String? itemIdpk;
  final int? currentStock;
  final String? companyIdpk;

  StoreCurrentStockEntity(
      {this.storeIdpk, this.itemIdpk, this.currentStock, this.companyIdpk});
}

class SubItemEntity {
  final String? itemIdpk;
  final String? barcode;
  final String? itemName;
  final String? description;
  final int? convention;
  final String? unit;
  final double? cost;
  final double? retailRate;
  final double? retailRateWithTax;
  final double? retailPriceLock;
  final double? wholeSaleRate;
  final double? wholeSalePriceLock;
  final double? taxPercentage;
  final double? currentStock;
  final String? itemNameArabic;
  final String? accessLetter;
  final String? supplierIdfk;
  final bool? isEditable;

  SubItemEntity(
      {this.itemIdpk,
      this.barcode,
      this.itemName,
      this.description,
      this.convention,
      this.unit,
      this.cost,
      this.retailRate,
      this.retailRateWithTax,
      this.retailPriceLock,
      this.wholeSaleRate,
      this.wholeSalePriceLock,
      this.taxPercentage,
      this.currentStock,
      this.itemNameArabic,
      this.accessLetter,
      this.supplierIdfk,
      this.isEditable});
}
