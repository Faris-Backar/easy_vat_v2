import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/items/data/model/item_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';

class PurchasedItemModel extends PurchasedItemEntity {
  PurchasedItemModel(
      {super.purchaseIdpk,
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
      super.subItems});

  factory PurchasedItemModel.fromJson(Map<String, dynamic> json) =>
      PurchasedItemModel(
        purchaseIdpk: json["purchaseIDPK"],
        itemIdpk: json["itemIDPK"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        description: json["description"],
        unit: json["unit"],
        billedQty: AppUtils.toDouble(json["billedQty"]),
        actualQty: AppUtils.toDouble(json["actualQty"]),
        cost: AppUtils.toDouble(json["cost"]),
        sellingPrice: AppUtils.toDouble(json["sellingPrice"]),
        discount: AppUtils.toDouble(json["discount"]),
        grossTotal: AppUtils.toDouble(json["grossTotal"]),
        taxAmount: AppUtils.toDouble(json["taxAmount"]),
        taxPercentage: AppUtils.toDouble(json["taxPercentage"]),
        netTotal: AppUtils.toDouble(json["netTotal"]),
        currentStock: AppUtils.toDouble(json["currentStock"]),
        profitPercentage: AppUtils.toDouble(json["profitPercentage"]),
        expiryDate: DateTime.tryParse(json["expiryDate"] ?? ''),
        storeIdfk: json["storeIDFK"],
        purchaseOrderIdpk: json["purchaseOrderIDPK"],
        goodsReceiptIdpk: json["goodsReceiptIDPK"],
        importId: json["importID"],
        rowguid: json["rowguid"],
        subItems: json['subItems'] != null
            ? (json['subItems'] as List<dynamic>?)
                ?.map((e) => SubItemModel.fromJson(e))
                .toList()
            : [],
      );

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
        "expiryDate": DateFormatUtils.serverformatDate(expiryDate),
        "storeIDFK": storeIdfk,
        "purchaseOrderIDPK": purchaseOrderIdpk,
        "goodsReceiptIDPK": goodsReceiptIdpk,
        "importID": importId,
        "rowguid": rowguid,
        "subItems":subItems!=null?
            subItems?.map((e) => SubItemModel.fromEntity(e).toJson()).toList():[],
      };

  PurchasedItemEntity toEntity() => PurchasedItemEntity(
      purchaseIdpk: purchaseIdpk,
      itemIdpk: itemIdpk,
      barcode: barcode,
      itemCode: itemCode,
      itemName: itemName,
      description: description,
      unit: unit,
      billedQty: billedQty,
      actualQty: actualQty,
      cost: cost,
      sellingPrice: sellingPrice,
      discount: discount,
      grossTotal: grossTotal,
      taxAmount: taxAmount,
      taxPercentage: taxPercentage,
      netTotal: netTotal,
      currentStock: currentStock,
      profitPercentage: profitPercentage,
      expiryDate: expiryDate,
      storeIdfk: storeIdfk,
      purchaseOrderIdpk: purchaseOrderIdpk,
      goodsReceiptIdpk: goodsReceiptIdpk,
      importId: importId,
      rowguid: rowguid,
      subItems: subItems);

  static PurchasedItemModel fromEntity(PurchasedItemEntity entity) =>
      PurchasedItemModel(
        purchaseIdpk: entity.purchaseIdpk,
        itemIdpk: entity.itemIdpk,
        barcode: entity.barcode,
        itemCode: entity.itemCode,
        itemName: entity.itemName,
        description: entity.description,
        unit: entity.unit,
        billedQty: entity.billedQty,
        actualQty: entity.actualQty,
        cost: entity.cost,
        sellingPrice: entity.sellingPrice,
        discount: entity.discount,
        grossTotal: entity.grossTotal,
        taxAmount: entity.taxAmount,
        taxPercentage: entity.taxPercentage,
        netTotal: entity.netTotal,
        currentStock: entity.currentStock,
        profitPercentage: entity.profitPercentage,
        expiryDate: entity.expiryDate,
        storeIdfk: entity.storeIdfk,
        purchaseOrderIdpk: entity.purchaseOrderIdpk,
        goodsReceiptIdpk: entity.goodsReceiptIdpk,
        importId: entity.importId,
        rowguid: entity.rowguid,
        subItems: entity.subItems
            ?.map((e) => SubItemModel.fromEntity(e))
            .toList(), // <-- Fix here
      );
}
