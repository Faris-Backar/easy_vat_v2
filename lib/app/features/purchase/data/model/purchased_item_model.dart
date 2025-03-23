import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';

class PurchasedItemModel {
  String? purchaseIdpk;
  String? itemIdpk;
  String? barcode;
  String? itemCode;
  String? itemName;
  String? description;
  String? unit;
  double? billedQty;
  double? actualQty;
  double? cost;
  double? sellingPrice;
  double? discount;
  double? grossTotal;
  double? taxAmount;
  double? taxPercentage;
  double? netTotal;
  double? currentStock;
  double? profitPercentage;
  DateTime? expiryDate;
  String? storeIdfk;
  String? purchaseOrderIdpk;
  String? goodsReceiptIdpk;
  String? importId;
  String? rowguid;

  PurchasedItemModel({
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
        expiryDate: DateTime.tryParse(json["expiryDate"]),
        storeIdfk: json["storeIDFK"],
        purchaseOrderIdpk: json["purchaseOrderIDPK"],
        goodsReceiptIdpk: json["goodsReceiptIDPK"],
        importId: json["importID"],
        rowguid: json["rowguid"],
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
      };
}
