import 'package:easy_vat_v2/app/features/items/data/model/item_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_return_entity.dart';

class PurchaseReturnModel extends PurchaseReturnEntity {
  PurchaseReturnModel({
    super.purchaseReturnIDPK,
    super.purchaseReturnNo,
    super.purchaseReturnMode,
    super.supplierInvoiceNo,
    super.referenceNo,
    super.purchaseReturnDate,
    super.purchaseIDFK,
    super.purchaseNo,
    super.crLedgerIDFK,
    super.drLedgerIDFK,
    super.supplierIDFK,
    super.supplierName,
    super.remarks,
    super.grossAmount,
    super.discount,
    super.tax,
    super.netTotal,
    super.roundOff,
    super.isEditable,
    super.createdByID,
    super.createdDate,
    super.modifiedByID,
    super.modifiedDate,
    super.rowguid,
    required List<PurchaseReturnedItemModel> returnedItems,
  }) : super(returnedItems: returnedItems);

  factory PurchaseReturnModel.fromJson(Map<String, dynamic> json) {
    return PurchaseReturnModel(
      purchaseReturnIDPK: json['purchaseReturnIDPK'],
      purchaseReturnNo: json['purchaseReturnNo'] is int
          ? json['purchaseReturnNo']
          : int.tryParse(json['purchaseReturnNo'].toString()),
      purchaseReturnMode: json['purchaseReturnMode'],
      supplierInvoiceNo: json['supplierInvoiceNo'],
      referenceNo: json['referenceNo'],
      purchaseReturnDate: DateTime.tryParse(json['purchaseReturnDate'] ?? ''),
      purchaseIDFK: json['purchaseIDFK'],
      purchaseNo: json['purchaseNo'],
      crLedgerIDFK: json['crLedgerIDFK'],
      drLedgerIDFK: json['drLedgerIDFK'],
      supplierIDFK: json['supplierIDFK'],
      supplierName: json['supplierName'],
      remarks: json['remarks'],
      grossAmount: (json['grossAmount'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toDouble(),
      tax: (json['tax'] ?? 0).toDouble(),
      netTotal: (json['netTotal'] ?? 0).toDouble(),
      roundOff: (json['roundOff'] ?? 0).toDouble(),
      isEditable: json['isEditable'],
      createdByID: json['createdByID'],
      createdDate: DateTime.tryParse(json['createdDate'] ?? ''),
      modifiedByID: json['modifiedByID'],
      modifiedDate: DateTime.tryParse(json['modifiedDate'] ?? ''),
      rowguid: json['rowguid'],
      returnedItems: (json['returnedItems'] as List?)
              ?.map((item) => PurchaseReturnedItemModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'purchaseReturnIDPK': purchaseReturnIDPK,
      'purchaseReturnNo': purchaseReturnNo?.toString(),
      'purchaseReturnMode': purchaseReturnMode,
      'supplierInvoiceNo': supplierInvoiceNo,
      'referenceNo': referenceNo,
      'purchaseReturnDate': purchaseReturnDate?.toIso8601String(),
      'purchaseIDFK': purchaseIDFK,
      'purchaseNo': purchaseNo,
      'crLedgerIDFK': crLedgerIDFK,
      'drLedgerIDFK': drLedgerIDFK,
      'supplierIDFK': supplierIDFK,
      'supplierName': supplierName,
      'remarks': remarks,
      'grossAmount': grossAmount,
      'discount': discount,
      'tax': tax,
      'netTotal': netTotal,
      'roundOff': roundOff,
      'isEditable': isEditable,
      'createdByID': createdByID,
      'createdDate': createdDate?.toIso8601String(),
      'modifiedByID': modifiedByID,
      'modifiedDate': modifiedDate?.toIso8601String(),
      'rowguid': rowguid,
      'returnedItems': returnedItems
          ?.map((item) => PurchaseReturnedItemModel.fromEntity(item).toJson())
          .toList(),
    };
  }

  static PurchaseReturnEntity fromEntity(PurchaseReturnModel model) {
    return PurchaseReturnEntity(
      purchaseReturnIDPK: model.purchaseReturnIDPK,
      purchaseReturnNo: model.purchaseReturnNo,
      purchaseReturnMode: model.purchaseReturnMode,
      supplierInvoiceNo: model.supplierInvoiceNo,
      referenceNo: model.referenceNo,
      purchaseReturnDate: model.purchaseReturnDate,
      purchaseIDFK: model.purchaseIDFK,
      purchaseNo: model.purchaseNo,
      crLedgerIDFK: model.crLedgerIDFK,
      drLedgerIDFK: model.drLedgerIDFK,
      supplierIDFK: model.supplierIDFK,
      supplierName: model.supplierName,
      remarks: model.remarks,
      grossAmount: model.grossAmount,
      discount: model.discount,
      tax: model.tax,
      netTotal: model.netTotal,
      roundOff: model.roundOff,
      isEditable: model.isEditable,
      createdByID: model.createdByID,
      createdDate: model.createdDate,
      modifiedByID: model.modifiedByID,
      modifiedDate: model.modifiedDate,
      rowguid: model.rowguid,
      returnedItems: model.returnedItems
          ?.map((item) => PurchaseReturnedItemModel.fromEntity(item))
          .toList(),
    );
  }
}

class PurchaseReturnedItemModel extends PurchaseReturnedItemEntity {
  PurchaseReturnedItemModel({
    super.purchaseReturnIDPK,
    super.itemIDPK,
    super.barcode,
    super.itemCode,
    super.itemName,
    super.unit,
    super.description,
    super.actualQty,
    super.billedQty,
    super.cost,
    super.sellingPrice,
    super.discount,
    super.grossTotal,
    super.taxAmount,
    super.taxPercentage,
    super.netTotal,
    super.storeIDFK,
    super.currentStock,
    List<SubItemModel>? subItems,
  }) : super(subItems: subItems);

  factory PurchaseReturnedItemModel.fromJson(Map<String, dynamic> json) {
    return PurchaseReturnedItemModel(
      purchaseReturnIDPK: json['purchaseReturnIDPK'],
      itemIDPK: json['itemIDPK'],
      barcode: json['barcode'],
      itemCode: json['itemCode'],
      itemName: json['itemName'],
      unit: json['unit'],
      description: json['description'],
      actualQty: (json['actualQty'] ?? 0).toDouble(),
      billedQty: (json['billedQty'] ?? 0).toDouble(),
      cost: (json['cost'] ?? 0).toDouble(),
      sellingPrice: (json['sellingPrice'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toDouble(),
      grossTotal: (json['grossTotal'] ?? 0).toDouble(),
      taxAmount: (json['taxAmount'] ?? 0).toDouble(),
      taxPercentage: (json['taxPercentage'] ?? 0).toDouble(),
      netTotal: (json['netTotal'] ?? 0).toDouble(),
      storeIDFK: json['storeIDFK'],
      currentStock: (json['currentStock'] ?? 0).toDouble(),
      subItems: (json['subItems'] as List?)
              ?.map((item) => SubItemModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'purchaseReturnIDPK': purchaseReturnIDPK,
      'itemIDPK': itemIDPK,
      'barcode': barcode,
      'itemCode': itemCode,
      'itemName': itemName,
      'unit': unit,
      'description': description,
      'actualQty': actualQty,
      'billedQty': billedQty,
      'cost': cost,
      'sellingPrice': sellingPrice,
      'discount': discount,
      'grossTotal': grossTotal,
      'taxAmount': taxAmount,
      'taxPercentage': taxPercentage,
      'netTotal': netTotal,
      'storeIDFK': storeIDFK,
      'currentStock': currentStock,
      'subItems': subItems
              ?.map((item) => SubItemModel.fromEntity(item).toJson())
              .toList() ??
          [],
    };
  }

  static PurchaseReturnedItemModel fromEntity(
      PurchaseReturnedItemEntity entity) {
    return PurchaseReturnedItemModel(
      purchaseReturnIDPK: entity.purchaseReturnIDPK,
      itemIDPK: entity.itemIDPK,
      barcode: entity.barcode,
      itemCode: entity.itemCode,
      itemName: entity.itemName,
      unit: entity.unit,
      description: entity.description,
      actualQty: entity.actualQty,
      billedQty: entity.billedQty,
      cost: entity.cost,
      sellingPrice: entity.sellingPrice,
      discount: entity.discount,
      grossTotal: entity.grossTotal,
      taxAmount: entity.taxAmount,
      taxPercentage: entity.taxPercentage,
      netTotal: entity.netTotal,
      storeIDFK: entity.storeIDFK,
      currentStock: entity.currentStock,
      subItems: entity.subItems
              ?.map((item) => SubItemModel.fromEntity(item))
              .toList() ??
          [],
    );
  }
}
