import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/core/utils/date_format_utils.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';

class PurchaseResponseModel {
  bool? status;
  String? message;
  List<PurchaseModel>? purchase;

  PurchaseResponseModel({this.status, this.message, this.purchase});

  factory PurchaseResponseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseResponseModel(
      status: json["status"],
      message: json["message"],
      purchase: List<PurchaseModel>.from(
          json["purchase"].map((x) => PurchaseModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "purchase": List<dynamic>.from(purchase!.map((x) => x.toJson())),
      };
}

class PurchaseModel {
  String? purchaseIDPK;
  int? purchaseNo;
  String? purchaseMode;
  String? supplierInvoiceNo;
  String? crLedgerIDFK;
  String? drLedgerIDFK;
  String? supplierIDFK;
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
  List<PurchasedItemModel>? purchasedItems;

  PurchaseModel({
    this.purchaseIDPK,
    this.purchaseNo,
    this.purchaseMode,
    this.supplierInvoiceNo,
    this.crLedgerIDFK,
    this.drLedgerIDFK,
    this.supplierIDFK,
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

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      purchaseIDPK: json["purchaseIDPK"],
      purchaseNo: json["purchaseNo"],
      purchaseMode: json["purchaseMode"],
      supplierInvoiceNo: json["supplierInvoiceNo"],
      crLedgerIDFK: json["crLedgerIDFK"],
      drLedgerIDFK: json["drLedgerIDFK"],
      supplierIDFK: json["supplierIDFK"],
      referenceNo: json["referenceNo"],
      purchaseDate: DateTime.tryParse(json["purchaseDate"]),
      supplierName: json["supplierName"],
      purchasedBy: json["purchasedBy"],
      remarks: json["remarks"],
      lpoNo: json["lpoNo"],
      deliveryNo: json["deliveryNo"],
      quotationNo: json["quotationNo"],
      vehicleNo: json["vehicleNo"],
      grnNo: json["grnNo"],
      genaralNote: json["genaralNote"],
      grossAmount: AppUtils.toDouble(json["grossAmount"]),
      discount: AppUtils.toDouble(json["discount"]),
      tax: AppUtils.toDouble(json["tax"]),
      netTotal: AppUtils.toDouble(json["netTotal"]),
      roundOff: AppUtils.toDouble(json["roundOff"]),
      isEditable: json["isEditable"],
      isCanceled: json["isCanceled"],
      createdBy: json["createdBy"],
      createdDate: DateTime.tryParse(json["createdDate"]),
      modifiedBy: json["modifiedBy"],
      modifiedDate: DateTime.tryParse(json["modifiedDate"]),
      rowguid: json["rowguid"],
      isLockVoucher: json["isLockVoucher"],
      purchasedItems: List<PurchasedItemModel>.from(
          json["purchasedItems"].map((x) => PurchasedItemModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "purchaseIDPK": purchaseIDPK,
        "purchaseNo": purchaseNo,
        "purchaseMode": purchaseMode,
        "supplierInvoiceNo": supplierInvoiceNo,
        "crLedgerIDFK": crLedgerIDFK,
        "drLedgerIDFK": drLedgerIDFK,
        "supplierIDFK": supplierIDFK,
        "referenceNo": referenceNo,
        "purchaseDate": DateFormatUtils.serverformatDate(purchaseDate),
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
        "createdDate": DateFormatUtils.serverformatDate(createdDate),
        "modifiedBy": modifiedBy,
        "modifiedDate": DateFormatUtils.serverformatDate(modifiedDate),
        "rowguid": rowguid,
        "isLockVoucher": isLockVoucher,
        "purchasedItems":
            List<dynamic>.from(purchasedItems!.map((x) => x.toJson())),
      };
}
