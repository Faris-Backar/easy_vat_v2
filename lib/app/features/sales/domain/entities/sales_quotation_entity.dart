import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';

class SalesQuotationEntity {
  final String? quotationIdpk;
  final int? quotationNo;
  final DateTime? quotationDate;
  final String? referenceNo;
  final String? requestNo;
  final String? quotationValidity;
  final String? projectDescription;
  final String? customerIdpk;
  final String? customerName;
  final String? salesmanIdpk;
  final String? projectIdpk;
  final String? deliveryTerms;
  final String? paymentTerms;
  final String? vehicleNo;
  final String? genaralNote;
  final double? grossTotal;
  final double? dsicount;
  final double? tax;
  final double? grandTotal;
  final String? remarks;
  final String? createdBy;
  final DateTime? createdDate;
  final String? modifiedBy;
  final DateTime? modifiedDate;
  final String? rowguid;
  final String? companyIdpk;
  final String? quotationSubject;
  final List<QuotationDetailEntity>? quotationDetails;

  const SalesQuotationEntity({
    this.quotationIdpk,
    this.quotationNo,
    this.quotationDate,
    this.referenceNo,
    this.requestNo,
    this.quotationValidity,
    this.projectDescription,
    this.customerIdpk,
    this.customerName,
    this.salesmanIdpk,
    this.projectIdpk,
    this.deliveryTerms,
    this.paymentTerms,
    this.vehicleNo,
    this.genaralNote,
    this.grossTotal,
    this.dsicount,
    this.tax,
    this.grandTotal,
    this.remarks,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.rowguid,
    this.companyIdpk,
    this.quotationSubject,
    this.quotationDetails,
  });
}

class QuotationDetailEntity {
  final String? quotationIdpk;
  final String? itemIdpk;
  final String? itemName;
  final String? barcode;
  final String? itemCode;
  final String? unit;
  final String? description;
  final double? quantity;
  final double? sellingPrice;
  final double? grossTotal;
  final double? taxAmount;
  final double? taxPercentage;
  final double? netTotal;
  final double? cost;
  final double? totalCost;
  final double? profitAmount;
  final double? profitPercentage;
  final String? suppliersIdpk;
  final String? projectIdpk;
  final String? lpoIdpk;
  final String? rowguid;
  final String? companyIdpk;
  final List<SubItemEntity>? subItems;

  const QuotationDetailEntity({
    this.quotationIdpk,
    this.itemIdpk,
    this.itemName,
    this.barcode,
    this.itemCode,
    this.unit,
    this.description,
    this.quantity,
    this.sellingPrice,
    this.grossTotal,
    this.taxAmount,
    this.taxPercentage,
    this.netTotal,
    this.cost,
    this.totalCost,
    this.profitAmount,
    this.profitPercentage,
    this.suppliersIdpk,
    this.projectIdpk,
    this.lpoIdpk,
    this.rowguid,
    this.companyIdpk,
    this.subItems,
  });
}
