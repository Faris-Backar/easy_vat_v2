class PurchaseEntity {
  String? purchaseIdpk;
  int? purchaseNo;
  String? purchaseMode;
  String? supplierInvoiceNo;
  String? crLedgerIdfk;
  String? drLedgerIdfk;
  String? supplierIdfk;
  String? referenceNo;
  DateTime? purchaseDate;
  String? supplierName;
  String? purchasedBy;
  String? remarks;
  String? lpoNo;
  String? deliveryNo;
  String? quotationNo;
  String? vehicleNo;
  String? grnNo;
  String? genaralNote;
  double? grossAmount;
  double? discount;
  double? tax;
  double? netTotal;
  double? roundOff;
  bool? isEditable;
  bool? isCanceled;
  String? createdBy;
  DateTime? createdDate;
  String? modifiedBy;
  DateTime? modifiedDate;
  String? rowguid;
  bool? isLockVoucher;
  List<PurchasedItemEntity>? purchasedItems;

  PurchaseEntity({
    this.purchaseIdpk,
    this.purchaseNo,
    this.purchaseMode,
    this.supplierInvoiceNo,
    this.crLedgerIdfk,
    this.drLedgerIdfk,
    this.supplierIdfk,
    this.referenceNo,
    this.purchaseDate,
    this.supplierName,
    this.purchasedBy,
    this.remarks,
    this.lpoNo,
    this.deliveryNo,
    this.quotationNo,
    this.vehicleNo,
    this.grnNo,
    this.genaralNote,
    this.grossAmount,
    this.discount,
    this.tax,
    this.netTotal,
    this.roundOff,
    this.isEditable,
    this.isCanceled,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.rowguid,
    this.isLockVoucher,
    this.purchasedItems,
  });
}

class PurchasedItemEntity {
  String? purchaseIdpk;
  String? itemIdpk;
  String? barcode;
  String? itemCode;
  String? itemName;
  String? description;
  String? unit;
  int? billedQty;
  int? actualQty;
  double? cost;
  double? sellingPrice;
  double? discount;
  double? grossTotal;
  double? taxAmount;
  double? taxPercentage;
  double? netTotal;
  int? currentStock;
  double? profitPercentage;
  DateTime? expiryDate;
  String? storeIdfk;
  String? purchaseOrderIdpk;
  String? goodsReceiptIdpk;
  String? importId;
  String? rowguid;

  PurchasedItemEntity({
    this.purchaseIdpk,
    this.itemIdpk,
    this.barcode,
    this.itemCode,
    this.itemName,
    this.description,
    this.unit,
    this.billedQty,
    this.actualQty,
    this.cost,
    this.sellingPrice,
    this.discount,
    this.grossTotal,
    this.taxAmount,
    this.taxPercentage,
    this.netTotal,
    this.currentStock,
    this.profitPercentage,
    this.expiryDate,
    this.storeIdfk,
    this.purchaseOrderIdpk,
    this.goodsReceiptIdpk,
    this.importId,
    this.rowguid,
  });
}
