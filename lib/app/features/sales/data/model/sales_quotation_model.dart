import 'package:easy_vat_v2/app/features/items/data/model/item_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_quotation_entity.dart';

class SalesQuotationModel extends SalesQuotationEntity {
  final List<QuotationDetailModel>? quotationDetailModel;

  SalesQuotationModel({
    super.quotationIdpk,
    super.quotationNo,
    super.quotationDate,
    super.referenceNo,
    super.requestNo,
    super.quotationValidity,
    super.projectDescription,
    super.customerIdpk,
    super.salesmanIdpk,
    super.projectIdpk,
    super.deliveryTerms,
    super.paymentTerms,
    super.vehicleNo,
    super.genaralNote,
    super.grossTotal,
    super.dsicount,
    super.tax,
    super.grandTotal,
    super.remarks,
    super.createdBy,
    super.createdDate,
    super.modifiedBy,
    super.modifiedDate,
    super.rowguid,
    super.companyIdpk,
    super.quotationSubject,
    this.quotationDetailModel,
  }) : super(quotationDetails: quotationDetailModel);

  factory SalesQuotationModel.fromJson(Map<String, dynamic> json) =>
      SalesQuotationModel(
        quotationIdpk: json["quotationIDPK"],
        quotationNo: (json["quotationNo"] is int)
            ? json["quotationNo"].toDouble()
            : json["quotationNo"],
        quotationDate: DateTime.tryParse(json["quotationDate"] ?? ''),
        referenceNo: json["referenceNo"],
        requestNo: json["requestNo"],
        quotationValidity: json["quotationValidity"],
        projectDescription: json["projectDescription"],
        customerIdpk: json["customerIDPK"],
        salesmanIdpk: json["salesmanIDPK"],
        projectIdpk: json["projectIDPK"],
        deliveryTerms: json["deliveryTerms"],
        paymentTerms: json["paymentTerms"],
        vehicleNo: json["vehicleNo"],
        genaralNote: json["genaralNote"],
        grossTotal: (json["grossTotal"] is int)
            ? json["grossTotal"].toDouble()
            : json["grossTotal"],
        dsicount: (json["dsicount"] is int)
            ? json["dsicount"].toDouble()
            : json["dsicount"],
        tax: (json["tax"] is int) ? json["tax"].toDouble() : json["tax"],
        grandTotal: (json["grandTotal"] is int)
            ? json["grandTotal"].toDouble()
            : json["grandTotal"],
        remarks: json["remarks"],
        createdBy: json["createdBy"],
        createdDate: DateTime.tryParse(json["createdDate"] ?? ''),
        modifiedBy: json["modifiedBy"],
        modifiedDate: DateTime.tryParse(json["modifiedDate"] ?? ''),
        rowguid: json["rowguid"],
        companyIdpk: json["companyIDPK"],
        quotationSubject: json["quotationSubject"],
        quotationDetailModel: (json["quotationDetails"] as List<dynamic>?)
            ?.map((x) => QuotationDetailModel.fromJson(x))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "quotationIDPK": quotationIdpk,
        "quotationNo": quotationNo,
        "quotationDate": quotationDate?.toIso8601String(),
        "referenceNo": referenceNo,
        "requestNo": requestNo,
        "quotationValidity": quotationValidity,
        "projectDescription": projectDescription,
        "customerIDPK": customerIdpk,
        "salesmanIDPK": salesmanIdpk,
        "projectIDPK": projectIdpk,
        "deliveryTerms": deliveryTerms,
        "paymentTerms": paymentTerms,
        "vehicleNo": vehicleNo,
        "genaralNote": genaralNote,
        "grossTotal": grossTotal,
        "dsicount": dsicount,
        "tax": tax,
        "grandTotal": grandTotal,
        "remarks": remarks,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
        "companyIDPK": companyIdpk,
        "quotationSubject": quotationSubject,
        "quotationDetails":
            quotationDetailModel?.map((x) => x.toJson()).toList(),
      };

  factory SalesQuotationModel.fromEntity(SalesQuotationEntity entity) =>
      SalesQuotationModel(
        quotationIdpk: entity.quotationIdpk,
        quotationNo: entity.quotationNo,
        quotationDate: entity.quotationDate,
        referenceNo: entity.referenceNo,
        requestNo: entity.requestNo,
        quotationValidity: entity.quotationValidity,
        projectDescription: entity.projectDescription,
        customerIdpk: entity.customerIdpk,
        salesmanIdpk: entity.salesmanIdpk,
        projectIdpk: entity.projectIdpk,
        deliveryTerms: entity.deliveryTerms,
        paymentTerms: entity.paymentTerms,
        vehicleNo: entity.vehicleNo,
        genaralNote: entity.genaralNote,
        grossTotal: entity.grossTotal,
        dsicount: entity.dsicount,
        tax: entity.tax,
        grandTotal: entity.grandTotal,
        remarks: entity.remarks,
        createdBy: entity.createdBy,
        createdDate: entity.createdDate,
        modifiedBy: entity.modifiedBy,
        modifiedDate: entity.modifiedDate,
        rowguid: entity.rowguid,
        companyIdpk: entity.companyIdpk,
        quotationSubject: entity.quotationSubject,
        quotationDetailModel: entity.quotationDetails
            ?.map((e) => QuotationDetailModel.fromEntity(e))
            .toList(),
      );

  SalesQuotationEntity toEntity() => SalesQuotationEntity(
        quotationIdpk: quotationIdpk,
        quotationNo: quotationNo,
        quotationDate: quotationDate,
        referenceNo: referenceNo,
        requestNo: requestNo,
        quotationValidity: quotationValidity,
        projectDescription: projectDescription,
        customerIdpk: customerIdpk,
        salesmanIdpk: salesmanIdpk,
        projectIdpk: projectIdpk,
        deliveryTerms: deliveryTerms,
        paymentTerms: paymentTerms,
        vehicleNo: vehicleNo,
        genaralNote: genaralNote,
        grossTotal: grossTotal,
        dsicount: dsicount,
        tax: tax,
        grandTotal: grandTotal,
        remarks: remarks,
        createdBy: createdBy,
        createdDate: createdDate,
        modifiedBy: modifiedBy,
        modifiedDate: modifiedDate,
        rowguid: rowguid,
        companyIdpk: companyIdpk,
        quotationSubject: quotationSubject,
        quotationDetails: quotationDetailModel,
      );
}

class QuotationDetailModel extends QuotationDetailEntity {
  List<SubItemModel>? subItem;

  QuotationDetailModel({
    super.quotationIdpk,
    super.itemIdpk,
    super.itemName,
    super.barcode,
    super.itemCode,
    super.unit,
    super.description,
    super.quantity,
    super.sellingPrice,
    super.grossTotal,
    super.taxAmount,
    super.taxPercentage,
    super.netTotal,
    super.cost,
    super.totalCost,
    super.profitAmount,
    super.profitPercentage,
    super.suppliersIdpk,
    super.projectIdpk,
    super.lpoIdpk,
    super.rowguid,
    super.companyIdpk,
    this.subItem,
  }) : super(subItems: subItem);

  factory QuotationDetailModel.fromJson(Map<String, dynamic> json) =>
      QuotationDetailModel(
        quotationIdpk: json["quotationIDPK"],
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
        grossTotal: (json["grossTotal"] is int)
            ? json["grossTotal"].toDouble()
            : json["grossTotal"],
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
        totalCost: (json["totalCost"] is int)
            ? json["totalCost"].toDouble()
            : json["totalCost"],
        profitAmount: (json["profitAmount"] is int)
            ? json["profitAmount"].toDouble()
            : json["profitAmount"],
        profitPercentage: (json["profitPercentage"] is int)
            ? json["profitPercentage"].toDouble()
            : json["profitPercentage"],
        suppliersIdpk: json["suppliersIDPK"],
        projectIdpk: json["projectIDPK"],
        lpoIdpk: json["lpoIDPK"],
        rowguid: json["rowguid"],
        companyIdpk: json["companyIDPK"],
        subItem: (json["subItems"] as List<dynamic>?)
            ?.map((x) => SubItemModel.fromJson(x))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "quotationIDPK": quotationIdpk,
        "itemIDPK": itemIdpk,
        "itemName": itemName,
        "barcode": barcode,
        "itemCode": itemCode,
        "unit": unit,
        "description": description,
        "quantity": quantity,
        "sellingPrice": sellingPrice,
        "grossTotal": grossTotal,
        "taxAmount": taxAmount,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "cost": cost,
        "totalCost": totalCost,
        "profitAmount": profitAmount,
        "profitPercentage": profitPercentage,
        "suppliersIDPK": suppliersIdpk,
        "projectIDPK": projectIdpk,
        "lpoIDPK": lpoIdpk,
        "rowguid": rowguid,
        "companyIDPK": companyIdpk,
        "subItems": subItem?.map((x) => x.toJson()).toList(),
      };

  factory QuotationDetailModel.fromEntity(QuotationDetailEntity entity) =>
      QuotationDetailModel(
        quotationIdpk: entity.quotationIdpk,
        itemIdpk: entity.itemIdpk,
        itemName: entity.itemName,
        barcode: entity.barcode,
        itemCode: entity.itemCode,
        unit: entity.unit,
        description: entity.description,
        quantity: entity.quantity,
        sellingPrice: entity.sellingPrice,
        grossTotal: entity.grossTotal,
        taxAmount: entity.taxAmount,
        taxPercentage: entity.taxPercentage,
        netTotal: entity.netTotal,
        cost: entity.cost,
        totalCost: entity.totalCost,
        profitAmount: entity.profitAmount,
        profitPercentage: entity.profitPercentage,
        suppliersIdpk: entity.suppliersIdpk,
        projectIdpk: entity.projectIdpk,
        lpoIdpk: entity.lpoIdpk,
        rowguid: entity.rowguid,
        companyIdpk: entity.companyIdpk,
        subItem:
            entity.subItems?.map((e) => SubItemModel.fromEntity(e)).toList(),
      );

  QuotationDetailEntity toEntity() => QuotationDetailEntity(
        quotationIdpk: quotationIdpk,
        itemIdpk: itemIdpk,
        itemName: itemName,
        barcode: barcode,
        itemCode: itemCode,
        unit: unit,
        description: description,
        quantity: quantity,
        sellingPrice: sellingPrice,
        grossTotal: grossTotal,
        taxAmount: taxAmount,
        taxPercentage: taxPercentage,
        netTotal: netTotal,
        cost: cost,
        totalCost: totalCost,
        profitAmount: profitAmount,
        profitPercentage: profitPercentage,
        suppliersIdpk: suppliersIdpk,
        projectIdpk: projectIdpk,
        lpoIdpk: lpoIdpk,
        rowguid: rowguid,
        companyIdpk: companyIdpk,
        subItems: subItem,
      );
}
