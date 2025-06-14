import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';

class PurchaseReturnEntity {
  final String? purchaseReturnIDPK;
  final int? purchaseReturnNo;
  final String? purchaseReturnMode;
  final String? supplierInvoiceNo;
  final String? referenceNo;
  final DateTime? purchaseReturnDate;
  final String? purchaseIDFK;
  final String? purchaseNo;
  final String? crLedgerIDFK;
  final String? drLedgerIDFK;
  final String? supplierIDFK;
  final String? supplierName;
  final String? remarks;
  final double? grossAmount;
  final double? discount;
  final double? tax;
  final double? netTotal;
  final double? roundOff;
  final bool? isEditable;
  final String? createdByID;
  final DateTime? createdDate;
  final String? modifiedByID;
  final DateTime? modifiedDate;
  final String? rowguid;
  final List<PurchaseReturnedItemEntity>? returnedItems;

  PurchaseReturnEntity({
    this.purchaseReturnIDPK,
    this.purchaseReturnNo,
    this.purchaseReturnMode,
    this.supplierInvoiceNo,
    this.referenceNo,
    this.purchaseReturnDate,
    this.purchaseIDFK,
    this.purchaseNo,
    this.crLedgerIDFK,
    this.drLedgerIDFK,
    this.supplierIDFK,
    this.supplierName,
    this.remarks,
    this.grossAmount,
    this.discount,
    this.tax,
    this.netTotal,
    this.roundOff,
    this.isEditable,
    this.createdByID,
    this.createdDate,
    this.modifiedByID,
    this.modifiedDate,
    this.rowguid,
    this.returnedItems,
  });
}

class PurchaseReturnedItemEntity {
  final String? purchaseReturnIDPK;
  final String? itemIDPK;
  final String? barcode;
  final String? itemCode;
  final String? itemName;
  final String? unit;
  final String? description;
  final double? actualQty;
  final double? billedQty;
  final double? cost;
  final double? sellingPrice;
  final double? discount;
  final double? grossTotal;
  final double? taxAmount;
  final double? taxPercentage;
  final double? netTotal;
  final String? storeIDFK;
  final double? currentStock;
  final List<SubItemEntity>? subItems;

  PurchaseReturnedItemEntity({
    this.purchaseReturnIDPK,
    this.itemIDPK,
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
    this.storeIDFK,
    this.currentStock,
    this.subItems,
  });
}
