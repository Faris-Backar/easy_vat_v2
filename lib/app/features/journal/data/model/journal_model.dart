import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_entity.dart';

class JournalModel extends JournalEntity {
  JournalModel({super.message, super.status, super.journalEntry});

  factory JournalModel.fromJson(Map<String, dynamic> json) => JournalModel(
        journalEntry: json["journalEntry"] != null
            ? List<JournalEntryModel>.from(
                json["journalEntry"].map((x) => JournalEntryModel.fromJson(x)))
            : [],
      );
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "journalEntry": List<JournalEntryModel>.from(
            (journalEntry as List<JournalEntryModel>?)
                    ?.map((x) => x.toJson()) ??
                [])
      };
}

class JournalEntryModel extends JournalEntryEntity {
  JournalEntryModel({
    super.journalIDPK,
    super.journalNo,
    super.referenceNo,
    super.journalDate,
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
    super.entryMode,
    super.toAccount,
    List<JournalEntryDetailModel>? journalEntryDetail,
  }) : super(journalEntryDetail: journalEntryDetail);

  factory JournalEntryModel.fromJson(Map<String, dynamic> json) =>
      JournalEntryModel(
          journalIDPK: json["journalIDPK"],
          journalNo: json["journalNo"],
          referenceNo: json["referenceNo"],
          journalDate: json["journalDate"] != null
              ? DateTime.parse(json["journalDate"])
              : null,
          description: json["description"],
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
          entryMode: json["entryMode"],
          toAccount: json["toAccount"],
          journalEntryDetail: json["journalEntryDetail"] != null
              ? List<JournalEntryDetailModel>.from(json["journalEntryDetail"]
                  .map((x) => JournalEntryDetailModel.fromJson(x)))
              : null);

  factory JournalEntryModel.fromEntity(JournalEntryEntity entity) {
    return JournalEntryModel(
      journalIDPK: entity.journalIDPK,
      journalNo: entity.journalNo,
      referenceNo: entity.referenceNo,
      journalDate: entity.journalDate,
      description: entity.description,
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
      entryMode: entity.entryMode,
      toAccount: entity.toAccount,
      journalEntryDetail: entity.journalEntryDetail
          ?.map((item) => item is JournalEntryDetailModel
              ? item
              : JournalEntryDetailModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "journalIDPK": journalIDPK,
        "journalNo": journalNo,
        "referenceNo": referenceNo,
        "journalDate": journalDate?.toIso8601String(),
        "description": description,
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
        "entryMode": entryMode,
        "toAccount": toAccount,
        "journalEntryDetail": journalEntryDetail != null
            ? List<dynamic>.from(journalEntryDetail!
                .map((x) => x is JournalEntryDetailModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };
  List<JournalEntryDetailModel>? get modelJournalEntryDetail =>
      journalEntryDetail
          ?.map((item) => item is JournalEntryDetailModel
              ? item
              : JournalEntryDetailModel.fromEntity(item))
          .toList();
}

class JournalEntryDetailModel extends JournalEntryDetailEntity {
  JournalEntryDetailModel({
    super.journalIDPK,
    super.ledgerIDPK,
    super.ledgerName,
    super.currentBalance,
    super.currentBalanceType,
    super.description,
    super.drAmount,
    super.crAmount,
    super.companyIDPK,
  });

  factory JournalEntryDetailModel.fromJson(Map<String, dynamic> json) =>
      JournalEntryDetailModel(
        journalIDPK: json["journalIDPK"],
        ledgerIDPK: json["ledgerIDPK"],
        ledgerName: json["ledgerName"],
        currentBalance: json["currentBalance"] != null
            ? (json["currentBalance"] as num).toDouble()
            : null,
        currentBalanceType: json["currentBalanceType"],
        description: json["description"],
        drAmount: json["drAmount"] != null
            ? (json["drAmount"] as num).toDouble()
            : null,
        crAmount: json["crAmount"] != null
            ? (json["crAmount"] as num).toDouble()
            : null,
        companyIDPK: json["companyIDPK"],
      );

  factory JournalEntryDetailModel.fromEntity(JournalEntryDetailEntity entity) {
    return JournalEntryDetailModel(
      journalIDPK: entity.journalIDPK,
      ledgerIDPK: entity.ledgerIDPK,
      ledgerName: entity.ledgerName,
      currentBalance: entity.currentBalance,
      currentBalanceType: entity.currentBalanceType,
      description: entity.description,
      drAmount: entity.drAmount,
      crAmount: entity.crAmount,
      companyIDPK: entity.companyIDPK,
    );
  }

  Map<String, dynamic> toJson() => {
        "journalIDPK": journalIDPK,
        "ledgerIDPK": ledgerIDPK,
        "ledgerName": ledgerName,
        "currentBalance": currentBalance,
        "currentBalanceType": currentBalanceType,
        "description": description,
        "drAmount": drAmount,
        "crAmount": crAmount,
        "companyIDPK": companyIDPK,
      };
}
