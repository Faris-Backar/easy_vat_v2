class SalesOrderRequestModel {
  String salesOrderIdpk;
  int salesOrderNo;
  DateTime salesOrderDate;
  String referenceNo;
  String lpoNo;
  String quotationNo;
  String requestNo;
  String generalNote;
  String deliveryMethod;
  String destination;
  String vehicleNo;
  String customerIdpk;
  String salesmanIdpk;
  String projectIdpk;
  String invoiceAddress;
  String shippingAddress;
  String deliveryTerms;
  String paymentTerms;
  double grossTotal;
  double dsicount;
  double tax;
  double netTotal;
  String remarks;
  bool isEditable;
  bool isCanceled;
  String createdBy;
  DateTime createdDate;
  String modifiedBy;
  DateTime modifiedDate;
  String rowguid;
  String companyIdpk;
  List<SalesOrderDetail> salesOrderDetails;

  SalesOrderRequestModel({
    required this.salesOrderIdpk,
    required this.salesOrderNo,
    required this.salesOrderDate,
    required this.referenceNo,
    required this.lpoNo,
    required this.quotationNo,
    required this.requestNo,
    required this.generalNote,
    required this.deliveryMethod,
    required this.destination,
    required this.vehicleNo,
    required this.customerIdpk,
    required this.salesmanIdpk,
    required this.projectIdpk,
    required this.invoiceAddress,
    required this.shippingAddress,
    required this.deliveryTerms,
    required this.paymentTerms,
    required this.grossTotal,
    required this.dsicount,
    required this.tax,
    required this.netTotal,
    required this.remarks,
    required this.isEditable,
    required this.isCanceled,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.rowguid,
    required this.companyIdpk,
    required this.salesOrderDetails,
  });

  factory SalesOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      SalesOrderRequestModel(
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
        grossTotal: json["grossTotal"],
        dsicount: json["dsicount"],
        tax: json["tax"],
        netTotal: json["netTotal"],
        remarks: json["remarks"],
        isEditable: json["isEditable"],
        isCanceled: json["isCanceled"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        rowguid: json["rowguid"],
        companyIdpk: json["companyIDPK"],
        salesOrderDetails: List<SalesOrderDetail>.from(
            json["salesOrderDetails"].map((x) => SalesOrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "salesOrderIDPK": salesOrderIdpk,
        "salesOrderNo": salesOrderNo,
        "salesOrderDate": salesOrderDate.toIso8601String(),
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
        "createdDate": createdDate.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate.toIso8601String(),
        "rowguid": rowguid,
        "companyIDPK": companyIdpk,
        "salesOrderDetails":
            List<dynamic>.from(salesOrderDetails.map((x) => x.toJson())),
      };
}

class SalesOrderDetail {
  String salesOrderIdpk;
  String itemIdpk;
  String itemName;
  String barcode;
  String itemCode;
  String unit;
  String description;
  double quantity;
  double sellingPrice;
  double grossAmount;
  double taxAmount;
  double taxPercentage;
  double netTotal;
  double cost;
  String suppliersIdpk;
  String projectIdpk;
  String quotationIdpk;
  String importId;
  String rowguid;
  String companyIdpk;
  List<SubItem> subItems;

  SalesOrderDetail({
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

  factory SalesOrderDetail.fromJson(Map<String, dynamic> json) =>
      SalesOrderDetail(
        salesOrderIdpk: json["salesOrderIDPK"],
        itemIdpk: json["itemIDPK"],
        itemName: json["itemName"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        unit: json["unit"],
        description: json["description"],
        quantity: json["quantity"],
        sellingPrice: json["sellingPrice"],
        grossAmount: json["grossAmount"],
        taxAmount: json["taxAmount"],
        taxPercentage: json["taxPercentage"],
        netTotal: json["netTotal"],
        cost: json["cost"],
        suppliersIdpk: json["suppliersIDPK"],
        projectIdpk: json["projectIDPK"],
        quotationIdpk: json["quotationIDPK"],
        importId: json["importID"],
        rowguid: json["rowguid"],
        companyIdpk: json["companyIDPK"],
        subItems: List<SubItem>.from(
            json["subItems"].map((x) => SubItem.fromJson(x))),
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
}

class SubItem {
  String itemIdpk;
  String barcode;
  String itemCode;
  String itemName;
  String description;
  int convention;
  String unit;
  int cost;
  int retailRate;
  int retailRateWithTax;
  int retailPriceLock;
  int wholeSaleRate;
  int wholeSalePriceLock;
  int taxPercentage;
  int currentStock;
  String itemNameArabic;
  String accessLetter;
  String supplierIdfk;
  bool isEditable;

  SubItem({
    required this.itemIdpk,
    required this.barcode,
    required this.itemCode,
    required this.itemName,
    required this.description,
    required this.convention,
    required this.unit,
    required this.cost,
    required this.retailRate,
    required this.retailRateWithTax,
    required this.retailPriceLock,
    required this.wholeSaleRate,
    required this.wholeSalePriceLock,
    required this.taxPercentage,
    required this.currentStock,
    required this.itemNameArabic,
    required this.accessLetter,
    required this.supplierIdfk,
    required this.isEditable,
  });

  factory SubItem.fromJson(Map<String, dynamic> json) => SubItem(
        itemIdpk: json["itemIDPK"],
        barcode: json["barcode"],
        itemCode: json["itemCode"],
        itemName: json["itemName"],
        description: json["description"],
        convention: json["convention"],
        unit: json["unit"],
        cost: json["cost"],
        retailRate: json["retailRate"],
        retailRateWithTax: json["retailRateWithTax"],
        retailPriceLock: json["retailPriceLock"],
        wholeSaleRate: json["wholeSaleRate"],
        wholeSalePriceLock: json["wholeSalePriceLock"],
        taxPercentage: json["taxPercentage"],
        currentStock: json["currentStock"],
        itemNameArabic: json["itemNameArabic"],
        accessLetter: json["accessLetter"],
        supplierIdfk: json["supplierIDFK"],
        isEditable: json["isEditable"],
      );

  Map<String, dynamic> toJson() => {
        "itemIDPK": itemIdpk,
        "barcode": barcode,
        "itemCode": itemCode,
        "itemName": itemName,
        "description": description,
        "convention": convention,
        "unit": unit,
        "cost": cost,
        "retailRate": retailRate,
        "retailRateWithTax": retailRateWithTax,
        "retailPriceLock": retailPriceLock,
        "wholeSaleRate": wholeSaleRate,
        "wholeSalePriceLock": wholeSalePriceLock,
        "taxPercentage": taxPercentage,
        "currentStock": currentStock,
        "itemNameArabic": itemNameArabic,
        "accessLetter": accessLetter,
        "supplierIDFK": supplierIdfk,
        "isEditable": isEditable,
      };
}
