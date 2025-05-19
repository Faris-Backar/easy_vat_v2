import 'package:easy_vat_v2/app/features/sales/domain/entities/sub_item_entity.dart';

class SalesOrderEntity {
  String? salesOrderIdpk;
  int? salesOrderNo;
  DateTime? salesOrderDate;
  String? referenceNo;
  String? lpoNo;
  String? quotationNo;
  String? requestNo;
  String? generalNote;
  String? deliveryMethod;
  String? destination;
  String? vehicleNo;
  String? customerIdpk;
  String? salesmanIdpk;
  String? projectIdpk;
  String? invoiceAddress;
  String? shippingAddress;
  String? deliveryTerms;
  String? paymentTerms;
  double? grossTotal;
  double? dsicount;
  double? tax;
  double? netTotal;
  String? remarks;
  bool? isEditable;
  bool? isCanceled;
  String? createdBy;
  DateTime? createdDate;
  String? modifiedBy;
  DateTime? modifiedDate;
  String? rowguid;
  String? companyIdpk;
  List<SalesOrderDetailEntity>? salesOrderDetails;

  SalesOrderEntity({
    this.salesOrderIdpk,
    this.salesOrderNo,
    this.salesOrderDate,
    this.referenceNo,
    this.lpoNo,
    this.quotationNo,
    this.requestNo,
    this.generalNote,
    this.deliveryMethod,
    this.destination,
    this.vehicleNo,
    this.customerIdpk,
    this.salesmanIdpk,
    this.projectIdpk,
    this.invoiceAddress,
    this.shippingAddress,
    this.deliveryTerms,
    this.paymentTerms,
    this.grossTotal,
    this.dsicount,
    this.tax,
    this.netTotal,
    this.remarks,
    this.isEditable,
    this.isCanceled,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.rowguid,
    this.companyIdpk,
    this.salesOrderDetails,
  });
}

class SalesOrderDetailEntity {
  String? salesOrderIdpk;
  String? itemIdpk;
  String? itemName;
  String? barcode;
  String? itemCode;
  String? unit;
  String? description;
  double? quantity;
  double? sellingPrice;
  double? grossAmount;
  double? taxAmount;
  double? taxPercentage;
  double? netTotal;
  double? cost;
  String? suppliersIdpk;
  String? projectIdpk;
  String? quotationIdpk;
  String? importId;
  String? rowguid;
  String? companyIdpk;
  List<SubItemEntity>? subItems;

  SalesOrderDetailEntity({
    this.salesOrderIdpk,
    this.itemIdpk,
    this.itemName,
    this.barcode,
    this.itemCode,
    this.unit,
    this.description,
    this.quantity,
    this.sellingPrice,
    this.grossAmount,
    this.taxAmount,
    this.taxPercentage,
    this.netTotal,
    this.cost,
    this.suppliersIdpk,
    this.projectIdpk,
    this.quotationIdpk,
    this.importId,
    this.rowguid,
    this.companyIdpk,
    this.subItems,
  });
}
