import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_entry_entity.dart';

class CreditNoteModel extends CreditNoteEntity {
  CreditNoteModel({super.message, super.creditNoteEntry, super.status});

  factory CreditNoteModel.fromJson(Map<String, dynamic> json) =>
      CreditNoteModel(
          creditNoteEntry: json["creditNoteEntry"] != null
              ? List<CreditNoteEntryModel>.from(json["creditNoteEntry"]
                  .map((x) => CreditNoteEntryModel.fromJson(x)))
              : []);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "creditNoteEntry": List<CreditNoteEntryModel>.from(
            (creditNoteEntry as List<CreditNoteEntryModel>?)
                    ?.map((x) => x.toJson()) ??
                [])
      };
}

class CreditNoteEntryModel extends CreditNoteEntryEntity {
  CreditNoteEntryModel({
    super.creditNoteIDPK,
    super.customerIDPK,
    super.crLedgerIDFK,
    super.drLedgerIDFK,
    super.creditNoteNo,
    super.referenceNo,
    super.creditNoteDate,
    super.paymentMode,
    super.soldBy,
    super.description,
    super.totalAmount,
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
    super.customerBalance,
    List<CreditNoteEntryDetailsModel>? creditNoteEntryDetails,
  }) : super(creditNoteEntryDetails: creditNoteEntryDetails);

  factory CreditNoteEntryModel.fromJson(Map<String, dynamic> json) =>
      CreditNoteEntryModel(
        creditNoteIDPK: json["creditNoteIDPK"],
        customerIDPK: json["customerIDPK"],
        crLedgerIDFK: json["crLedgerIDFK"],
        drLedgerIDFK: json["drLedgerIDFK"],
        creditNoteNo: json["creditNoteNo"],
        referenceNo: json["referenceNo"],
        creditNoteDate: json["creditNoteDate"] != null
            ? DateTime.parse(json["creditNoteDate"])
            : null,
        description: json["description"],
        paymentMode: json["paymentMode"],
        soldBy: json["soldBy"],
        totalAmount: json["totalAmount"] != null
            ? (json["totalAmount"] as num).toDouble()
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
        customerBalance: json["customerBalance"] != null
            ? (json["customerBalance"] as num).toDouble()
            : null,
        creditNoteEntryDetails: json["creditNoteEntryDetails"] != null
            ? List<CreditNoteEntryDetailsModel>.from(
                json["creditNoteEntryDetails"]
                    .map((x) => CreditNoteEntryDetailsModel.fromJson(x)))
            : null,
      );

  factory CreditNoteEntryModel.fromEntity(CreditNoteEntryEntity entity) {
    return CreditNoteEntryModel(
      creditNoteIDPK: entity.creditNoteIDPK,
      customerIDPK: entity.customerIDPK,
      crLedgerIDFK: entity.crLedgerIDFK,
      drLedgerIDFK: entity.drLedgerIDFK,
      creditNoteNo: entity.creditNoteNo,
      referenceNo: entity.referenceNo,
      creditNoteDate: entity.creditNoteDate,
      description: entity.description,
      paymentMode: entity.paymentMode,
      soldBy: entity.soldBy,
      totalAmount: entity.totalAmount,
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
      customerBalance: entity.customerBalance,
      creditNoteEntryDetails: entity.creditNoteEntryDetails
          ?.map((item) => item is CreditNoteEntryDetailsModel
              ? item
              : CreditNoteEntryDetailsModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "creditNoteIDPK": creditNoteIDPK,
        "customerIDPK": customerIDPK,
        "crLedgerIDFK": crLedgerIDFK,
        "drLedgerIDFK": drLedgerIDFK,
        "creditNoteNo": creditNoteNo,
        "referenceNo": referenceNo,
        "creditNoteDate": creditNoteDate?.toIso8601String(),
        "description": description,
        "paymentMode": paymentMode,
        "soldBy": soldBy,
        "totalAmount": totalAmount,
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
        "customerBalance": customerBalance,
        "creditNoteEntryDetails": creditNoteEntryDetails != null
            ? List<dynamic>.from(creditNoteEntryDetails!
                .map(
                    (x) => x is CreditNoteEntryDetailsModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  List<CreditNoteEntryDetailsModel>? get modelCreditNoteDetails =>
      creditNoteEntryDetails
          ?.map((item) => item is CreditNoteEntryDetailsModel
              ? item
              : CreditNoteEntryDetailsModel.fromEntity(item))
          .toList();
}

class CreditNoteEntryDetailsModel extends CreditNoteEntryDetailsEntity {
  CreditNoteEntryDetailsModel({
    super.creditNoteIDPK,
    super.ledgerIDPK,
    super.description,
    super.drAmount,
    super.tax,
    super.taxPercentage,
    super.netTotal,
    super.companyIDPK,
    super.ledgerBalance,
    super.ledgerName,
  });

  factory CreditNoteEntryDetailsModel.fromJson(Map<String, dynamic> json) =>
      CreditNoteEntryDetailsModel(
        creditNoteIDPK: json["creditNoteIDPK"],
        ledgerIDPK: json["ledgerIDPK"],
        description: json["description"],
        drAmount: json["drAmount"] != null
            ? (json["drAmount"] as num).toDouble()
            : null,
        tax: json["tax"] != null ? (json["tax"] as num).toDouble() : null,
        taxPercentage: json["taxPercentage"] != null
            ? (json["taxPercentage"] as num).toDouble()
            : null,
        netTotal: json["netTotal"] != null
            ? (json["netTotal"] as num).toDouble()
            : null,
        companyIDPK: json["companyIDPK"],
        ledgerBalance: json["ledgerBalance"] != null
            ? (json["ledgerBalance"] as num).toDouble()
            : null,
        ledgerName: json["ledgerName"],
      );

  factory CreditNoteEntryDetailsModel.fromEntity(
      CreditNoteEntryDetailsEntity entity) {
    return CreditNoteEntryDetailsModel(
      creditNoteIDPK: entity.creditNoteIDPK,
      ledgerIDPK: entity.ledgerIDPK,
      description: entity.description,
      drAmount: entity.drAmount,
      tax: entity.tax,
      taxPercentage: entity.taxPercentage,
      netTotal: entity.netTotal,
      companyIDPK: entity.companyIDPK,
      ledgerBalance: entity.ledgerBalance,
      ledgerName: entity.ledgerName,
    );
  }

  Map<String, dynamic> toJson() => {
        "creditNoteIDPK": creditNoteIDPK,
        "ledgerIDPK": ledgerIDPK,
        "description": description,
        "drAmount": drAmount,
        "tax": tax,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "companyIDPK": companyIDPK,
        "ledgerBalance": ledgerBalance,
        "ledgerName": ledgerName,
      };
}
