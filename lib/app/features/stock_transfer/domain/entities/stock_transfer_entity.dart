abstract class StockTransferEntity {
  final bool? status;
  final String? message;
  final List<StockTransferListEntity>? stockTransfer;

  StockTransferEntity({this.status, this.message, this.stockTransfer});
}

abstract class StockTransferListEntity {
  final String? stockTransferIDPK;
  final DateTime? transferDate;
  final int? transferNo;
  final String? referenceNo;
  final String? requestIDPK;
  final String? requestNo;
  final String? requestBy;
  final String? fromStoreIDPK;
  final String? toStoreIDPK;
  final double? totalNetCost;
  final double? totalSellValue;
  final String? remarks;
  final bool? isEditable;
  final bool? isCanceled;
  final String? createdBy;
  final DateTime? createdDate;
  final String? modifiedBy;
  final DateTime? modifiedDate;
  final String? rowguid;
  final String? companyIDPK;
  final String? fromStoreName;
  final String? toStoreName;
  final List<StockTransferDetailsEntity>? stockTransferDetails;

  StockTransferListEntity(
      {this.stockTransferIDPK,
      this.transferDate,
      this.transferNo,
      this.referenceNo,
      this.requestIDPK,
      this.requestNo,
      this.requestBy,
      this.fromStoreIDPK,
      this.toStoreIDPK,
      this.totalNetCost,
      this.totalSellValue,
      this.remarks,
      this.isEditable,
      this.isCanceled,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.rowguid,
      this.companyIDPK,
      this.fromStoreName,
      this.toStoreName,
      this.stockTransferDetails});
}

abstract class StockTransferDetailsEntity {
  final String? stockTransferIDPK;
  final String? itemIDPK;
  final String? barcode;
  final String? itemCode;
  final String? itemName;
  final String? unit;
  final double? currentStock;
  final String? description;
  final double? requestedQty;
  final double? transferQty;
  final double? retailRate;
  final double? cost;
  final double? netCost;
  final double? sellValue;
  final double? stockValue;
  final String? rowguid;
  final String? companyIDPK;
  final List<SubItemsEntity>? subItems;
  const StockTransferDetailsEntity(
      {this.stockTransferIDPK,
      this.itemIDPK,
      this.barcode,
      this.itemCode,
      this.itemName,
      this.unit,
      this.currentStock,
      this.description,
      this.requestedQty,
      this.transferQty,
      this.retailRate,
      this.cost,
      this.sellValue,
      this.stockValue,
      this.netCost,
      this.rowguid,
      this.companyIDPK,
      this.subItems});
}

abstract class SubItemsEntity {
  final String? itemIDPK;
  final String? barcode;
  final String? itemCode;
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
  final String? supplierIDFK;
  final bool? isEditable;
  SubItemsEntity({
    this.itemIDPK,
    this.barcode,
    this.itemCode,
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
    this.supplierIDFK,
    this.isEditable,
  });
}
