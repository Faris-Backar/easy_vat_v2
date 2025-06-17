import 'package:easy_vat_v2/app/features/income/domain/entities/income_entity.dart';

class IncomeModel extends IncomeEntity {
  IncomeModel({super.message, super.incomeList, super.status});

  factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
      incomeList: json["income"] != null
          ? List<IncomeListModel>.from(
              json["income"].map((x) => IncomeListModel.fromJson(x)))
          : []);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "income": List<IncomeListModel>.from(
            (incomeList as List<IncomeListModel>?)?.map((x) => x.toJson()) ??
                [])
      };
}

class IncomeListModel extends IncomeListEntity {
  IncomeListModel(
      {super.incomeIDPK,
      super.incomeNo,
      super.referenceNo,
      super.incomeDate,
      super.paymentMode,
      super.purchasedBy,
      super.customerIDFK,
      super.crLedgerIDFK,
      super.drLedgerIDFK,
      super.supplierInvoiceNo,
      super.grossTotal,
      super.discount,
      super.tax,
      super.netTotal,
      super.roundOff,
      super.remarks,
      super.isEditable,
      super.isCanceled,
      super.createdBy,
      super.createdDate,
      super.modifiedBy,
      super.modifiedDate,
      super.rowguid,
      super.companyIDPK,
      super.customerName,
      List<IncomeDetailsModel>? incomeDetails})
      : super(incomeDetails: incomeDetails);

  factory IncomeListModel.fromJson(Map<String, dynamic> json) =>
      IncomeListModel(
          incomeIDPK: json["incomeIDPK"],
          incomeNo: json["incomeNo"],
          referenceNo: json["referenceNo"],
          incomeDate: json["incomeDate"] != null
              ? DateTime.parse(json["incomeDate"])
              : null,
          paymentMode: json["paymentMode"],
          purchasedBy: json["purchasedBy"],
          customerIDFK: json["customerIDFK"],
          crLedgerIDFK: json["crLedgerIDFK"],
          drLedgerIDFK: json["drLedgerIDFK"],
          supplierInvoiceNo: json["supplierInvoiceNo"],
          grossTotal: json["grossTotal"] != null
              ? (json["grossTotal"] as num).toDouble()
              : null,
          discount: json["discount"] != null
              ? (json["discount"] as num).toDouble()
              : null,
          tax: json["tax"] != null ? (json["tax"] as num).toDouble() : null,
          netTotal: json["netTotal"] != null
              ? (json["netTotal"] as num).toDouble()
              : null,
          roundOff: json["roundOff"] != null
              ? (json["roundOff"] as num).toDouble()
              : null,
          remarks: json["remarks"],
          isEditable: json["isEditable"],
          isCanceled: json["isCanceled"],
          createdBy: json["createdBy"],
          createdDate: json["createdDate"] != null
              ? DateTime.parse(json["createdDate"])
              : null,
          modifiedBy: json["modifiedBy"],
          modifiedDate: json["modifiedDate"] != null
              ? DateTime.parse(json["modifiedDate"])
              : null,
          rowguid: json["rowguid"],
          companyIDPK: json["companyIDPK"],
          customerName: json["customerName"],
          incomeDetails: json["incomeDetails"] != null
              ? List<IncomeDetailsModel>.from(json["incomeDetails"]
                  .map((x) => IncomeDetailsModel.fromJson(x)))
              : null);

  factory IncomeListModel.fromEntity(IncomeListEntity entity) {
    return IncomeListModel(
        incomeIDPK: entity.incomeIDPK,
        incomeNo: entity.incomeNo,
        referenceNo: entity.referenceNo,
        incomeDate: entity.incomeDate,
        paymentMode: entity.paymentMode,
        purchasedBy: entity.purchasedBy,
        customerIDFK: entity.customerIDFK,
        crLedgerIDFK: entity.crLedgerIDFK,
        drLedgerIDFK: entity.drLedgerIDFK,
        supplierInvoiceNo: entity.supplierInvoiceNo,
        grossTotal: entity.grossTotal,
        discount: entity.discount,
        tax: entity.tax,
        netTotal: entity.netTotal,
        roundOff: entity.roundOff,
        remarks: entity.remarks,
        isEditable: entity.isEditable,
        isCanceled: entity.isCanceled,
        createdBy: entity.createdBy,
        createdDate: entity.createdDate,
        modifiedBy: entity.modifiedBy,
        modifiedDate: entity.modifiedDate,
        rowguid: entity.rowguid,
        companyIDPK: entity.companyIDPK,
        customerName: entity.customerName,
        incomeDetails: entity.incomeDetails
            ?.map((item) => item is IncomeDetailsModel
                ? item
                : IncomeDetailsModel.fromEntity(item))
            .toList());
  }

  Map<String, dynamic> toJson() => {
        "incomeIDPK": incomeIDPK,
        "incomeNo": incomeNo,
        "referenceNo": referenceNo,
        "incomeDate": incomeDate?.toIso8601String(),
        "paymentMode": paymentMode,
        "purchasedBy": purchasedBy,
        "customerIDFK": customerIDFK,
        "crLedgerIDFK": crLedgerIDFK,
        "drLedgerIDFK": drLedgerIDFK,
        "supplierInvoiceNo": supplierInvoiceNo,
        "grossTotal": grossTotal,
        "discount": discount,
        "tax": tax,
        "netTotal": netTotal,
        "roundOff": roundOff,
        "remarks": remarks,
        "isEditable": isEditable,
        "isCanceled": isCanceled,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
        "companyIDPK": companyIDPK,
        "customerName": customerName,
        "incomeDetails": incomeDetails != null
            ? List<dynamic>.from(incomeDetails!
                .map((x) => x is IncomeDetailsModel ? x.toJson() : null)
                .where((x) => x != null))
            : []
      };

  List<IncomeDetailsModel>? get modelIncomeDetails => incomeDetails
      ?.map((item) => item is IncomeDetailsModel
          ? item
          : IncomeDetailsModel.fromEntity(item))
      .toList();
}

class IncomeDetailsModel extends IncomeDetailsEntity {
  IncomeDetailsModel(
      {super.incomeIDPK,
      super.ledgerIDPK,
      super.description,
      super.grossTotal,
      super.taxAmount,
      super.taxPercentage,
      super.netTotal,
      super.rowguid,
      super.companyIDPK,
      super.currentBalance,
      super.ledgerName});

  factory IncomeDetailsModel.fromJson(Map<String, dynamic> json) =>
      IncomeDetailsModel(
        incomeIDPK: json["incomeIDPK"],
        ledgerIDPK: json["ledgerIDPK"],
        description: json["description"],
        grossTotal: json["grossTotal"] != null
            ? (json["grossTotal"] as num).toDouble()
            : null,
        taxAmount: json["taxAmount"] != null
            ? (json["taxAmount"] as num).toDouble()
            : null,
        taxPercentage: json["taxPercentage"] != null
            ? (json["taxPercentage"] as num).toDouble()
            : null,
        netTotal: json["netTotal"] != null
            ? (json["netTotal"] as num).toDouble()
            : null,
        rowguid: json["rowguid"],
        companyIDPK: json["companyIDPK"],
        currentBalance: json["currentBalance"] != null
            ? (json["currentBalance"] as num).toDouble()
            : null,
        ledgerName: json["ledgerName"],
      );

  factory IncomeDetailsModel.fromEntity(IncomeDetailsEntity entity) {
    return IncomeDetailsModel(
      incomeIDPK: entity.incomeIDPK,
      ledgerIDPK: entity.ledgerIDPK,
      description: entity.description,
      grossTotal: entity.grossTotal,
      taxAmount: entity.taxAmount,
      taxPercentage: entity.taxPercentage,
      netTotal: entity.netTotal,
      rowguid: entity.rowguid,
      companyIDPK: entity.companyIDPK,
      currentBalance: entity.currentBalance,
      ledgerName: entity.ledgerName,
    );
  }

  Map<String, dynamic> toJson() => {
        "incomeIDPK": incomeIDPK,
        "ledgerIDPK": ledgerIDPK,
        "description": description,
        "grossTotal": grossTotal,
        "taxAmount": taxAmount,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "rowguid": rowguid,
        "companyIDPK": companyIDPK,
        "currentBalance": currentBalance,
        "ledgerName": ledgerName,
      };
}
