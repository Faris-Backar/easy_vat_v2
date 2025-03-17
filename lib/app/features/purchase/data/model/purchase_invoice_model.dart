import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';

class PurchaseInvoiceModel extends PurchaseInvoiceEntity {
  PurchaseInvoiceModel({
    super.purchaseIdpk,
    super.purchaseNo,
    super.purchaseMode,
    super.supplierInvoiceNo,
    super.crLedgerIdfk,
    super.drLedgerIdfk,
    super.supplierIdfk,
    super.referenceNo,
    super.purchaseDate,
    super.supplierName,
    super.purchasedBy,
    super.remarks,
    super.lpoNo,
    super.deliveryNo,
    super.quotationNo,
    super.vehicleNo,
    super.grnNo,
    super.genaralNote,
    super.grossAmount,
    super.discount,
    super.tax,
    super.netTotal,
    super.roundOff,
    super.isEditable,
    super.isCanceled,
    super.createdBy,
    super.createdDate,
    super.modifiedBy,
    super.modifiedDate,
    super.rowguid,
    super.isLockVoucher,
    super.purchasedItems,
  });

  factory PurchaseInvoiceModel.fromJson(Map<String, dynamic> json) {
    return PurchaseInvoiceModel(
      purchaseIdpk: json["purchaseIDPK"],
      purchaseNo: json["purchaseNo"] ?? 0,
      purchaseMode: json["purchaseMode"] ?? '',
      supplierInvoiceNo: json["supplierInvoiceNo"] ?? '',
      crLedgerIdfk: json["crLedgerIDFK"] ?? '',
      drLedgerIdfk: json["drLedgerIDFK"] ?? '',
      supplierIdfk: json["supplierIDFK"] ?? '',
      referenceNo: json["referenceNo"] ?? '',
      purchaseDate: json["purchaseDate"] != null
          ? DateTime.tryParse(json["purchaseDate"])
          : null,
      supplierName: json["supplierName"] ?? '',
      purchasedBy: json["purchasedBy"] ?? '',
      remarks: json["remarks"] ?? '',
      lpoNo: json["lpoNo"] ?? '',
      deliveryNo: json["deliveryNo"] ?? '',
      quotationNo: json["quotationNo"] ?? '',
      vehicleNo: json["vehicleNo"] ?? '',
      grnNo: json["grnNo"] ?? '',
      genaralNote: json["genaralNote"] ?? '',
      grossAmount: json["grossAmount"]?.toDouble() ?? 0.0,
      discount: json["discount"]?.toDouble() ?? 0.0,
      tax: json["tax"]?.toDouble() ?? 0.0,
      netTotal: json["netTotal"]?.toDouble() ?? 0.0,
      roundOff: json["roundOff"]?.toDouble() ?? 0.0,
      isEditable: json["isEditable"] ?? false,
      isCanceled: json["isCanceled"] ?? false,
      createdBy: json["createdBy"] ?? '',
      createdDate: json["createdDate"] != null
          ? DateTime.tryParse(json["createdDate"])
          : null,
      modifiedBy: json["modifiedBy"] ?? '',
      modifiedDate: json["modifiedDate"] != null
          ? DateTime.tryParse(json["modifiedDate"])
          : null,
      rowguid: json["rowguid"] ?? '',
      isLockVoucher: json["isLockVoucher"] ?? false,
      purchasedItems: json["purchasedItems"] != null
          ? List<PurchasedItemModel>.from(
              json["purchasedItems"].map((x) => PurchasedItemModel.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "purchaseIDPK": purchaseIdpk,
        "purchaseNo": purchaseNo,
        "purchaseMode": purchaseMode,
        "supplierInvoiceNo": supplierInvoiceNo,
        "crLedgerIDFK": crLedgerIdfk,
        "drLedgerIDFK": drLedgerIdfk,
        "supplierIDFK": supplierIdfk,
        "referenceNo": referenceNo,
        "purchaseDate": purchaseDate?.toIso8601String(),
        "supplierName": supplierName,
        "purchasedBy": purchasedBy,
        "remarks": remarks,
        "lpoNo": lpoNo,
        "deliveryNo": deliveryNo,
        "quotationNo": quotationNo,
        "vehicleNo": vehicleNo,
        "grnNo": grnNo,
        "genaralNote": genaralNote,
        "grossAmount": grossAmount,
        "discount": discount,
        "tax": tax,
        "netTotal": netTotal,
        "roundOff": roundOff,
        "isEditable": isEditable,
        "isCanceled": isCanceled,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
        "isLockVoucher": isLockVoucher,
        // "purchasedItems": purchasedItems != null
        //     ? List<PurchasedItemModel>.from(purchasedItems!.map((x) => x.toJson()))
        //     : [],
      };
}

class PurchasedItemModel extends PurchasedItemEntity {
  PurchasedItemModel({
    super.purchaseIdpk,
    super.itemIdpk,
    super.barcode,
    super.itemCode,
    super.itemName,
    super.description,
    super.unit,
    super.billedQty,
    super.actualQty,
    super.cost,
    super.sellingPrice,
    super.discount,
    super.grossTotal,
    super.taxAmount,
    super.taxPercentage,
    super.netTotal,
    super.currentStock,
    super.profitPercentage,
    super.expiryDate,
    super.storeIdfk,
    super.purchaseOrderIdpk,
    super.goodsReceiptIdpk,
    super.importId,
    super.rowguid,
  });

  factory PurchasedItemModel.fromJson(Map<String, dynamic> json) {
    return PurchasedItemModel(
      purchaseIdpk: json["purchaseIDPK"] ?? '',
      itemIdpk: json["itemIDPK"] ?? '',
      barcode: json["barcode"] ?? '',
      itemCode: json["itemCode"] ?? '',
      itemName: json["itemName"] ?? '',
      description: json["description"] ?? '',
      unit: json["unit"] ?? '',
      billedQty: json["billedQty"] ?? 0,
      actualQty: json["actualQty"] ?? 0,
      cost: json["cost"] != null ? json["cost"].toDouble() : 0.0,
      sellingPrice:
          json["sellingPrice"] != null ? json["sellingPrice"].toDouble() : 0.0,
      discount: json["discount"] != null ? json["discount"].toDouble() : 0.0,
      grossTotal:
          json["grossTotal"] != null ? json["grossTotal"].toDouble() : 0.0,
      taxAmount: json["taxAmount"] != null ? json["taxAmount"].toDouble() : 0.0,
      taxPercentage: json["taxPercentage"] != null
          ? json["taxPercentage"].toDouble()
          : 0.0,
      netTotal: json["netTotal"] != null ? json["netTotal"].toDouble() : 0.0,
      currentStock: json["currentStock"] ?? 0,
      profitPercentage: json["profitPercentage"] != null
          ? json["profitPercentage"].toDouble()
          : 0.0,
      expiryDate: json["expiryDate"] != null
          ? DateTime.tryParse(json["expiryDate"])
          : null,
      storeIdfk: json["storeIDFK"] ?? '',
      purchaseOrderIdpk: json["purchaseOrderIDPK"] ?? '',
      goodsReceiptIdpk: json["goodsReceiptIDPK"] ?? '',
      importId: json["importID"] ?? '',
      rowguid: json["rowguid"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "purchaseIDPK": purchaseIdpk,
        "itemIDPK": itemIdpk,
        "barcode": barcode,
        "itemCode": itemCode,
        "itemName": itemName,
        "description": description,
        "unit": unit,
        "billedQty": billedQty,
        "actualQty": actualQty,
        "cost": cost,
        "sellingPrice": sellingPrice,
        "discount": discount,
        "grossTotal": grossTotal,
        "taxAmount": taxAmount,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "currentStock": currentStock,
        "profitPercentage": profitPercentage,
        "expiryDate": expiryDate?.toIso8601String(),
        "storeIDFK": storeIdfk,
        "purchaseOrderIDPK": purchaseOrderIdpk,
        "goodsReceiptIDPK": goodsReceiptIdpk,
        "importID": importId,
        "rowguid": rowguid,
      };
}
