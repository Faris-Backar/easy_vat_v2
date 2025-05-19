class SubItemEntity {
  String? itemIdpk;
  String? barcode;
  String? itemCode;
  String? itemName;
  String? description;
  double? convention;
  String? unit;
  double? cost;
  double? retailRate;
  double? retailRateWithTax;
  double? retailPriceLock;
  double? wholeSaleRate;
  double? wholeSalePriceLock;
  double? taxPercentage;
  double? currentStock;
  String? itemNameArabic;
  String? accessLetter;
  String? supplierIdfk;
  bool? isEditable;

  SubItemEntity({
    this.itemIdpk,
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
    this.supplierIdfk,
    this.isEditable,
  });
}
