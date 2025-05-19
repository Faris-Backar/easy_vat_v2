import 'package:easy_vat_v2/app/features/sales/data/model/sub_item_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_order_entity.dart';

class SalesOrderResponseModel {
  bool status;
  String message;
  List<SalesOrderModel> salesOrder;

  SalesOrderResponseModel({
    required this.status,
    required this.message,
    required this.salesOrder,
  });

  factory SalesOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      SalesOrderResponseModel(
        status: json["status"],
        message: json["message"],
        salesOrder: json["salesOrder"] != null
            ? List<SalesOrderModel>.from(
                json["salesOrder"].map((x) => SalesOrderModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "salesOrder": List<dynamic>.from(salesOrder.map((x) => x.toJson()))
      };
}

class SalesOrderModel extends SalesOrderEntity {
  // Change the type to match SalesOrderEntity but use a different property name
  final List<SalesOrderDetailModel>? _salesOrderDetailsModel;

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
    List<SalesOrderDetailModel>? salesOrderDetails,
  })  : _salesOrderDetailsModel = salesOrderDetails,
        super(
            salesOrderDetails:
                salesOrderDetails?.map((model) => model.toEntity()).toList());

  // Override the getter to maintain type compatibility
  @override
  List<SalesOrderDetailEntity>? get salesOrderDetails {
    return _salesOrderDetailsModel?.map((detail) => detail.toEntity()).toList();
  }

  // Add a getter to access the model version when needed
  List<SalesOrderDetailModel>? get salesOrderDetailsModel =>
      _salesOrderDetailsModel;

  factory SalesOrderModel.fromJson(Map<String, dynamic> json) =>
      SalesOrderModel(
        salesOrderIdpk: json["salesOrderIDPK"],
        salesOrderNo: json["salesOrderNo"],
        salesOrderDate: DateTime.parse(json["salesOrderDate"]),
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
        grossTotal: json["grossTotal"]?.toDouble() ?? 0.0,
        dsicount: json["dsicount"]?.toDouble() ?? 0.0,
        tax: json["tax"]?.toDouble() ?? 0.0,
        netTotal: json["netTotal"]?.toDouble() ?? 0.0,
        remarks: json["remarks"],
        isEditable: json["isEditable"],
        isCanceled: json["isCanceled"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        rowguid: json["rowguid"],
        companyIdpk: json["companyIDPK"],
        salesOrderDetails: json["salesOrderDetails"] != null
            ? List<SalesOrderDetailModel>.from(json["salesOrderDetails"]
                .map((x) => SalesOrderDetailModel.fromJson(x)))
            : null,
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
        "salesOrderDetails": List<dynamic>.from(
            _salesOrderDetailsModel?.map((x) => x.toJson()) ?? []),
      };

  // Convert model to entity
  SalesOrderEntity toEntity() {
    return SalesOrderEntity(
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
      salesOrderDetails:
          _salesOrderDetailsModel?.map((detail) => detail.toEntity()).toList(),
    );
  }
}

class SalesOrderDetailModel {
  final String salesOrderIdpk;
  final String itemIdpk;
  final String itemName;
  final String barcode;
  final String itemCode;
  final String unit;
  final String description;
  final double quantity;
  final double sellingPrice;
  final double grossAmount;
  final double taxAmount;
  final double taxPercentage;
  final double netTotal;
  final double cost;
  final String suppliersIdpk;
  final String projectIdpk;
  final String quotationIdpk;
  final String importId;
  final String rowguid;
  final String companyIdpk;
  final List<SubItemModel> subItems;

  SalesOrderDetailModel({
    required this.salesOrderIdpk,
    required this.itemIdpk,
    required this.itemName,
    required this.barcode,
    required this.itemCode,
    required this.unit,
    required this.description,
    required this.quantity,
    required this.sellingPrice,
    required this.grossAmount,
    required this.taxAmount,
    required this.taxPercentage,
    required this.netTotal,
    required this.cost,
    required this.suppliersIdpk,
    required this.projectIdpk,
    required this.quotationIdpk,
    required this.importId,
    required this.rowguid,
    required this.companyIdpk,
    required this.subItems,
  });

  factory SalesOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      SalesOrderDetailModel(
        salesOrderIdpk: json["salesOrderIDPK"],
        itemIdpk: json["itemIDPK"],
        itemName: json["itemName"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        unit: json["unit"],
        description: json["description"],
        quantity: json["quantity"]?.toDouble() ?? 0.0,
        sellingPrice: json["sellingPrice"]?.toDouble() ?? 0.0,
        grossAmount: json["grossAmount"]?.toDouble() ?? 0.0,
        taxAmount: json["taxAmount"]?.toDouble() ?? 0.0,
        taxPercentage: json["taxPercentage"]?.toDouble() ?? 0.0,
        netTotal: json["netTotal"]?.toDouble() ?? 0.0,
        cost: json["cost"]?.toDouble() ?? 0.0,
        suppliersIdpk: json["suppliersIDPK"],
        projectIdpk: json["projectIDPK"],
        quotationIdpk: json["quotationIDPK"],
        importId: json["importID"],
        rowguid: json["rowguid"],
        companyIdpk: json["companyIDPK"],
        subItems: List<SubItemModel>.from(
            json["subItems"].map((x) => SubItemModel.fromJson(x))),
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
        "subItems": List<dynamic>.from(subItems.map((x) => x.toJson())),
      };

  // Convert model to entity
  SalesOrderDetailEntity toEntity() {
    return SalesOrderDetailEntity(
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
      subItems: subItems.map((subItem) => subItem.toEntity()).toList(),
    );
  }
}
