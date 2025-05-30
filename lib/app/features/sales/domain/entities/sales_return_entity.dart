class SalesReturnEntity {
  String? salesReturnIdpk;
  int? salesReturnNo;
  String? referenceNo;
  DateTime? returnDate;
  String? saleIdfk;
  int? saleNo;
  String? salesReturnMode;
  String? crLedgerIdfk;
  String? drLedgerIdfk;
  String? customerIdfk;
  String? customerName;
  String? authorizedById;
  double? grossAmount;
  double? tax;
  double? discount;
  double? netTotal;
  double? roundOff;
  String? createdById;
  DateTime? createdDate;
  String? modifiedById;
  DateTime? modifiedDate;
  String? rowguid;
  bool? isEditable;
  String? remarks;
  List<ReturnedItemEntity>? returnedItems;

  SalesReturnEntity({
    this.salesReturnIdpk,
    this.salesReturnNo,
    this.referenceNo,
    this.returnDate,
    this.saleIdfk,
    this.saleNo,
    this.salesReturnMode,
    this.crLedgerIdfk,
    this.drLedgerIdfk,
    this.customerIdfk,
    this.customerName,
    this.authorizedById,
    this.grossAmount,
    this.tax,
    this.discount,
    this.netTotal,
    this.roundOff,
    this.createdById,
    this.createdDate,
    this.modifiedById,
    this.modifiedDate,
    this.rowguid,
    this.isEditable,
    this.remarks,
    this.returnedItems,
  });
}

class ReturnedItemEntity {
  String? salesReturnIdpk;
  String? itemIdpk;
  String? barcode;
  String? itemCode;
  String? itemName;
  String? unit;
  String? description;
  double? actualQty;
  double? billedQty;
  double? cost;
  double? sellingPrice;
  double? discount;
  double? grossTotal;
  double? taxAmount;
  double? taxPercentage;
  double? netTotal;
  String? storeIdfk;
  List<SubItemEntity>? subItems;

  ReturnedItemEntity({
    this.salesReturnIdpk,
    this.itemIdpk,
    this.barcode,
    this.itemCode,
    this.itemName,
    this.unit,
    this.description,
    this.actualQty,
    this.billedQty,
    this.cost,
    this.sellingPrice,
    this.discount,
    this.grossTotal,
    this.taxAmount,
    this.taxPercentage,
    this.netTotal,
    this.storeIdfk,
    this.subItems,
  });
}

class SubItemEntity {
  String? itemIdpk;
  String? barcode;
  String? itemCode;
  String? itemName;
  String? description;
  int? convention;
  String? unit;
  double? cost;
  double? retailRate;
  double? retailRateWithTax;
  double? retailPriceLock;
  double? wholeSaleRate;
  double? wholeSalePriceLock;
  double? taxPercentage;
  int? currentStock;
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
