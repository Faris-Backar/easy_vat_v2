import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_entry_entity.dart';

class DebitNoteModel extends DebitNoteEntity {
  DebitNoteModel({super.message, super.status, super.debitNoteEntry});

  factory DebitNoteModel.fromJson(Map<String, dynamic> json) => DebitNoteModel(
      debitNoteEntry: json["debitNoteEntry"] != null
          ? List<DebitNoteEntryModel>.from(json["debitNoteEntry"]
              .map((x) => DebitNoteEntryModel.fromJson(x)))
          : []);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "debitNoteEntry": List<DebitNoteEntryModel>.from(
            (debitNoteEntry as List<DebitNoteEntryModel>?)
                    ?.map((x) => x.toJson()) ??
                [])
      };
}

class DebitNoteEntryModel extends DebitNoteEntryEntity {
  DebitNoteEntryModel({
    super.debitNoteIDPK,
    super.supplierIDPK,
    super.crLedgerIDFK,
    super.drLedgerIDFK,
    super.debitNoteNo,
    super.referenceNo,
    super.supplierReferenceNo,
    super.purchasedBy,
    super.debitNoteDate,
    super.description,
    super.paymentMode,
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
    super.supplierName,
    super.supplierBalance,
    List<DebitNoteEntryDetailsModel>? debitNoteEntryDetails,
  }) : super(debitNoteEntryDetails: debitNoteEntryDetails);

  factory DebitNoteEntryModel.fromJson(Map<String, dynamic> json) =>
      DebitNoteEntryModel(
        debitNoteIDPK: json["debitNoteIDPK"],
        supplierIDPK: json["supplierIDPK"],
        crLedgerIDFK: json["crLedgerIDFK"],
        drLedgerIDFK: json["drLedgerIDFK"],
        debitNoteNo: json["debitNoteNo"],
        purchasedBy: json["purchasedBy"],
        referenceNo: json["referenceNo"],
        supplierReferenceNo: json["supplierReferenceNo"],
        debitNoteDate: json["debitNoteDate"] != null
            ? DateTime.parse(json["debitNoteDate"])
            : null,
        description: json["description"],
        paymentMode: json["paymentMode"],
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
        supplierName: json["supplierName"],
        supplierBalance: json["supplierBalance"] != null
            ? (json["supplierBalance"] as num).toDouble()
            : null,
        debitNoteEntryDetails: json["debitNoteEntryDetails"] != null
            ? List<DebitNoteEntryDetailsModel>.from(
                json["debitNoteEntryDetails"]
                    .map((x) => DebitNoteEntryDetailsModel.fromJson(x)))
            : null,
      );

  factory DebitNoteEntryModel.fromEntity(DebitNoteEntryEntity entity) {
    return DebitNoteEntryModel(
      debitNoteIDPK: entity.debitNoteIDPK,
      supplierIDPK: entity.supplierIDPK,
      crLedgerIDFK: entity.crLedgerIDFK,
      drLedgerIDFK: entity.drLedgerIDFK,
      debitNoteNo: entity.debitNoteNo,
      purchasedBy: entity.purchasedBy,
      referenceNo: entity.referenceNo,
      supplierReferenceNo: entity.supplierReferenceNo,
      debitNoteDate: entity.debitNoteDate,
      description: entity.description,
      paymentMode: entity.paymentMode,
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
      supplierName: entity.supplierName,
      supplierBalance: entity.supplierBalance,
      debitNoteEntryDetails: entity.debitNoteEntryDetails
          ?.map((item) => item is DebitNoteEntryDetailsModel
              ? item
              : DebitNoteEntryDetailsModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "debitNoteIDPK": debitNoteIDPK,
        "supplierIDPK": supplierIDPK,
        "crLedgerIDFK": crLedgerIDFK,
        "drLedgerIDFK": drLedgerIDFK,
        "debitNoteNo": debitNoteNo,
        "referenceNo": referenceNo,
        "supplierReferenceNo": supplierReferenceNo,
        "purchasedBy": purchasedBy,
        "debitNoteDate": debitNoteDate?.toIso8601String(),
        "description": description,
        "paymentMode": paymentMode,
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
        "supplierName": supplierName,
        "supplierBalance": supplierBalance,
        "debitNoteEntryDetails": debitNoteEntryDetails != null
            ? List<dynamic>.from(debitNoteEntryDetails!
                .map((x) => x is DebitNoteEntryDetailsModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  List<DebitNoteEntryDetailsModel>? get modelDebitNoteEntryDetails =>
      debitNoteEntryDetails
          ?.map((item) => item is DebitNoteEntryDetailsModel
              ? item
              : DebitNoteEntryDetailsModel.fromEntity(item))
          .toList();
}

class DebitNoteEntryDetailsModel extends DebitNoteEntryDetailsEntity {
  DebitNoteEntryDetailsModel({
    super.debitNoteIDPK,
    super.ledgerIDPK,
    super.description,
    super.crAmount,
    super.tax,
    super.taxPercentage,
    super.netTotal,
    super.companyIDPK,
    super.ledgerBalance,
    super.ledgerName,
  });

  factory DebitNoteEntryDetailsModel.fromJson(Map<String, dynamic> json) =>
      DebitNoteEntryDetailsModel(
        debitNoteIDPK: json["debitNoteIDPK"],
        ledgerIDPK: json["ledgerIDPK"],
        description: json["description"],
        crAmount: json["crAmount"] != null
            ? (json["crAmount"] as num).toDouble()
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

  factory DebitNoteEntryDetailsModel.fromEntity(
      DebitNoteEntryDetailsEntity entity) {
    return DebitNoteEntryDetailsModel(
      debitNoteIDPK: entity.debitNoteIDPK,
      ledgerIDPK: entity.ledgerIDPK,
      description: entity.description,
      crAmount: entity.crAmount,
      tax: entity.tax,
      taxPercentage: entity.taxPercentage,
      netTotal: entity.netTotal,
      companyIDPK: entity.companyIDPK,
      ledgerBalance: entity.ledgerBalance,
      ledgerName: entity.ledgerName,
    );
  }

  Map<String, dynamic> toJson() => {
        "debitNoteIDPK": debitNoteIDPK,
        "ledgerIDPK": ledgerIDPK,
        "description": description,
        "crAmount": crAmount,
        "tax": tax,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "companyIDPK": companyIDPK,
        "ledgerBalance": ledgerBalance,
        "ledgerName": ledgerName,
      };
}
