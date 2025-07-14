import 'package:easy_vat_v2/app/features/sales/data/model/sub_item_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_order_entity.dart';

class SalesOrderModel extends SalesOrderEntity {
  final List<SalesOrderDetailModel>? salesOrderDetailsModel;

  SalesOrderModel({
    super.salesOrderIdpk,
    super.salesOrderNo,
    super.salesOrderDate,
    super.referenceNo,
    super.lpoNo,
    super.quotationNo,
    super.requestNo,
    super.generalNote,
    super.deliveryMethod,
    super.destination,
    super.vehicleNo,
    super.customerIdpk,
    super.salesmanIdpk,
    super.projectIdpk,
    super.invoiceAddress,
    super.shippingAddress,
    super.deliveryTerms,
    super.paymentTerms,
    super.grossTotal,
    super.dsicount,
    super.tax,
    super.netTotal,
    super.remarks,
    super.isEditable,
    super.isCanceled,
    super.createdBy,
    super.createdDate,
    super.modifiedBy,
    super.modifiedDate,
    super.rowguid,
    super.companyIdpk,
    this.salesOrderDetailsModel,
  }) : super(salesOrderDetails: salesOrderDetailsModel);

  factory SalesOrderModel.fromJson(Map<String, dynamic> json) =>
      SalesOrderModel(
        salesOrderIdpk: json["salesOrderIDPK"],
        salesOrderNo: json["salesOrderNo"],
        salesOrderDate: DateTime.tryParse(json["salesOrderDate"] ?? ''),
        referenceNo: json["referenceNo"],
        lpoNo: json["lpoNo"],
        quotationNo: json["quotationNo"],
        requestNo: json["requestNo"],
        generalNote: json["generalNote"],
        deliveryMethod: json["deliveryMethod"],
        destination: json["destination"],
        vehicleNo: json["vehicleNo"],
        customerIdpk: json["customerIDPK"],
        salesmanIdpk: json["salesmanIDPK"],
        projectIdpk: json["projectIDPK"],
        invoiceAddress: json["invoiceAddress"],
        shippingAddress: json["shippingAddress"],
        deliveryTerms: json["deliveryTerms"],
        paymentTerms: json["paymentTerms"],
        grossTotal: (json["grossTotal"] is int)
            ? json["grossTotal"].toDouble()
            : json["grossTotal"],
        dsicount: (json["dsicount"] is int)
            ? json["dsicount"].toDouble()
            : json["dsicount"],
        tax: (json["tax"] is int) ? json["tax"].toDouble() : json["tax"],
        netTotal: (json["netTotal"] is int)
            ? json["netTotal"].toDouble()
            : json["netTotal"],
        remarks: json["remarks"],
        isEditable: json["isEditable"],
        isCanceled: json["isCanceled"],
        createdBy: json["createdBy"],
        createdDate: DateTime.tryParse(json["createdDate"] ?? ''),
        modifiedBy: json["modifiedBy"],
        modifiedDate: DateTime.tryParse(json["modifiedDate"] ?? ''),
        rowguid: json["rowguid"],
        companyIdpk: json["companyIDPK"],
        salesOrderDetailsModel: (json["salesOrderDetails"] as List<dynamic>?)
            ?.map((e) => SalesOrderDetailModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "salesOrderIDPK": salesOrderIdpk,
        "salesOrderNo": salesOrderNo,
        "salesOrderDate": salesOrderDate?.toIso8601String(),
        "referenceNo": referenceNo,
        "lpoNo": lpoNo,
        "quotationNo": quotationNo,
        "requestNo": requestNo,
        "generalNote": generalNote,
        "deliveryMethod": deliveryMethod,
        "destination": destination,
        "vehicleNo": vehicleNo,
        "customerIDPK": customerIdpk,
        "salesmanIDPK": salesmanIdpk,
        "projectIDPK": projectIdpk,
        "invoiceAddress": invoiceAddress,
        "shippingAddress": shippingAddress,
        "deliveryTerms": deliveryTerms,
        "paymentTerms": paymentTerms,
        "grossTotal": grossTotal,
        "dsicount": dsicount,
        "tax": tax,
        "netTotal": netTotal,
        "remarks": remarks,
        "isEditable": isEditable,
        "isCanceled": isCanceled,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
        "companyIDPK": companyIdpk,
        "salesOrderDetails":
            salesOrderDetailsModel?.map((x) => x.toJson()).toList(),
      };

  factory SalesOrderModel.fromEntity(SalesOrderEntity entity) =>
      SalesOrderModel(
        salesOrderIdpk: entity.salesOrderIdpk,
        salesOrderNo: entity.salesOrderNo,
        salesOrderDate: entity.salesOrderDate,
        referenceNo: entity.referenceNo,
        lpoNo: entity.lpoNo,
        quotationNo: entity.quotationNo,
        requestNo: entity.requestNo,
        generalNote: entity.generalNote,
        deliveryMethod: entity.deliveryMethod,
        destination: entity.destination,
        vehicleNo: entity.vehicleNo,
        customerIdpk: entity.customerIdpk,
        salesmanIdpk: entity.salesmanIdpk,
        projectIdpk: entity.projectIdpk,
        invoiceAddress: entity.invoiceAddress,
        shippingAddress: entity.shippingAddress,
        deliveryTerms: entity.deliveryTerms,
        paymentTerms: entity.paymentTerms,
        grossTotal: entity.grossTotal,
        dsicount: entity.dsicount,
        tax: entity.tax,
        netTotal: entity.netTotal,
        remarks: entity.remarks,
        isEditable: entity.isEditable,
        isCanceled: entity.isCanceled,
        createdBy: entity.createdBy,
        createdDate: entity.createdDate,
        modifiedBy: entity.modifiedBy,
        modifiedDate: entity.modifiedDate,
        rowguid: entity.rowguid,
        companyIdpk: entity.companyIdpk,
        salesOrderDetailsModel: entity.salesOrderDetails
            ?.map((e) => SalesOrderDetailModel.fromEntity(e))
            .toList(),
      );

  SalesOrderEntity toEntity() => SalesOrderEntity(
        salesOrderIdpk: salesOrderIdpk,
        salesOrderNo: salesOrderNo,
        salesOrderDate: salesOrderDate,
        referenceNo: referenceNo,
        lpoNo: lpoNo,
        quotationNo: quotationNo,
        requestNo: requestNo,
        generalNote: generalNote,
        deliveryMethod: deliveryMethod,
        destination: destination,
        vehicleNo: vehicleNo,
        customerIdpk: customerIdpk,
        salesmanIdpk: salesmanIdpk,
        projectIdpk: projectIdpk,
        invoiceAddress: invoiceAddress,
        shippingAddress: shippingAddress,
        deliveryTerms: deliveryTerms,
        paymentTerms: paymentTerms,
        grossTotal: grossTotal,
        dsicount: dsicount,
        tax: tax,
        netTotal: netTotal,
        remarks: remarks,
        isEditable: isEditable,
        isCanceled: isCanceled,
        createdBy: createdBy,
        createdDate: createdDate,
        modifiedBy: modifiedBy,
        modifiedDate: modifiedDate,
        rowguid: rowguid,
        companyIdpk: companyIdpk,
        salesOrderDetails: salesOrderDetailsModel,
      );
}

class SalesOrderDetailModel extends SalesOrderDetailEntity {
  final List<SubItemModel>? subItem;

  SalesOrderDetailModel({
    super.salesOrderIdpk,
    super.itemIdpk,
    super.itemName,
    super.barcode,
    super.itemCode,
    super.unit,
    super.description,
    super.quantity,
    super.sellingPrice,
    super.grossAmount,
    super.taxAmount,
    super.taxPercentage,
    super.netTotal,
    super.cost,
    super.suppliersIdpk,
    super.projectIdpk,
    super.quotationIdpk,
    super.importId,
    super.rowguid,
    super.companyIdpk,
    this.subItem,
  }) : super(subItems: subItem);

  factory SalesOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      SalesOrderDetailModel(
        salesOrderIdpk: json["salesOrderIDPK"],
        itemIdpk: json["itemIDPK"],
        itemName: json["itemName"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        unit: json["unit"],
        description: json["description"],
        quantity: (json["quantity"] is int)
            ? json["quantity"].toDouble()
            : json["quantity"],
        sellingPrice: (json["sellingPrice"] is int)
            ? json["sellingPrice"].toDouble()
            : json["sellingPrice"],
        grossAmount: (json["grossAmount"] is int)
            ? json["grossAmount"].toDouble()
            : json["grossAmount"],
        taxAmount: (json["taxAmount"] is int)
            ? json["taxAmount"].toDouble()
            : json["taxAmount"],
        taxPercentage: (json["taxPercentage"] is int)
            ? json["taxPercentage"].toDouble()
            : json["taxPercentage"],
        netTotal: (json["netTotal"] is int)
            ? json["netTotal"].toDouble()
            : json["netTotal"],
        cost: (json["cost"] is int) ? json["cost"].toDouble() : json["cost"],
        suppliersIdpk: json["suppliersIDPK"],
        projectIdpk: json["projectIDPK"],
        quotationIdpk: json["quotationIDPK"],
        importId: json["importID"],
        rowguid: json["rowguid"],
        companyIdpk: json["companyIDPK"],
        subItem: (json["subItems"] as List<dynamic>?)
            ?.map((e) => SubItemModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "salesOrderIDPK": salesOrderIdpk,
        "itemIDPK": itemIdpk,
        "itemName": itemName,
        "barcode": barcode,
        "itemCode": itemCode,
        "unit": unit,
        "description": description,
        "quantity": quantity,
        "sellingPrice": sellingPrice,
        "grossAmount": grossAmount,
        "taxAmount": taxAmount,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "cost": cost,
        "suppliersIDPK": suppliersIdpk,
        "projectIDPK": projectIdpk,
        "quotationIDPK": quotationIdpk,
        "importID": importId,
        "rowguid": rowguid,
        "companyIDPK": companyIdpk,
        "subItems": subItem?.map((x) => x.toJson()).toList(),
      };

  factory SalesOrderDetailModel.fromEntity(SalesOrderDetailEntity entity) =>
      SalesOrderDetailModel(
        salesOrderIdpk: entity.salesOrderIdpk,
        itemIdpk: entity.itemIdpk,
        itemName: entity.itemName,
        barcode: entity.barcode,
        itemCode: entity.itemCode,
        unit: entity.unit,
        description: entity.description,
        quantity: entity.quantity,
        sellingPrice: entity.sellingPrice,
        grossAmount: entity.grossAmount,
        taxAmount: entity.taxAmount,
        taxPercentage: entity.taxPercentage,
        netTotal: entity.netTotal,
        cost: entity.cost,
        suppliersIdpk: entity.suppliersIdpk,
        projectIdpk: entity.projectIdpk,
        quotationIdpk: entity.quotationIdpk,
        importId: entity.importId,
        rowguid: entity.rowguid,
        companyIdpk: entity.companyIdpk,
        subItem: entity.subItems
            ?.map((sub) => SubItemModel.fromEntity(sub))
            .toList(),
      );

  SalesOrderDetailEntity toEntity() => SalesOrderDetailEntity(
        salesOrderIdpk: salesOrderIdpk,
        itemIdpk: itemIdpk,
        itemName: itemName,
        barcode: barcode,
        itemCode: itemCode,
        unit: unit,
        description: description,
        quantity: quantity,
        sellingPrice: sellingPrice,
        grossAmount: grossAmount,
        taxAmount: taxAmount,
        taxPercentage: taxPercentage,
        netTotal: netTotal,
        cost: cost,
        suppliersIdpk: suppliersIdpk,
        projectIdpk: projectIdpk,
        quotationIdpk: quotationIdpk,
        importId: importId,
        rowguid: rowguid,
        companyIdpk: companyIdpk,
        subItems: subItem,
      );
}
