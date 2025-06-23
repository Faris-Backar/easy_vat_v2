import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';

class ContraModel extends ContraEntity {
  ContraModel({super.message, super.status, super.contraEntry});

  factory ContraModel.fromJson(Map<String, dynamic> json) => ContraModel(
      contraEntry: json["contraEntry"] != null
          ? List<ContraEntryModel>.from(
              json["contraEntry"].map((x) => ContraEntryModel.fromJson(x)))
          : []);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "contraEntry": List<ContraEntryModel>.from(
            (contraEntry as List<ContraEntryModel>?)?.map((x) => x.toJson()) ??
                [])
      };
}

class ContraEntryModel extends ContraEntryEntity {
  ContraEntryModel({
    super.contraIDPK,
    super.contraNo,
    super.referenceNo,
    super.contraDate,
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
    super.toAccountName,
    List<ContraEntryDetailsModel>? contraEntryDetails,
  }) : super(contraEntryDetails: contraEntryDetails);

  factory ContraEntryModel.fromJson(Map<String, dynamic> json) =>
      ContraEntryModel(
        contraIDPK: json["contraIDPK"],
        contraNo: json["contraNo"],
        referenceNo: json["referenceNo"],
        contraDate: json["contraDate"] != null
            ? DateTime.parse(json["contraDate"])
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
        toAccountName: json["toAccountName"],
        contraEntryDetails: json["contraEntryDetails"] != null
            ? List<ContraEntryDetailsModel>.from(json["contraEntryDetails"]
                .map((x) => ContraEntryDetailsModel.fromJson(x)))
            : null,
      );

  factory ContraEntryModel.fromEntity(ContraEntryEntity entity) {
    return ContraEntryModel(
      contraIDPK: entity.contraIDPK,
      contraNo: entity.contraNo,
      referenceNo: entity.referenceNo,
      contraDate: entity.contraDate,
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
      toAccountName: entity.toAccountName,
      contraEntryDetails: entity.contraEntryDetails
          ?.map((item) => item is ContraEntryDetailsModel
              ? item
              : ContraEntryDetailsModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "contraIDPK": contraIDPK,
        "contraNo": contraNo,
        "referenceNo": referenceNo,
        "contraDate": contraDate?.toIso8601String(),
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
        "toAccountName": toAccountName,
        "contraEntryDetails": contraEntryDetails != null
            ? List<dynamic>.from(contraEntryDetails!
                .map((x) => x is ContraEntryDetailsModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  List<ContraEntryDetailsModel>? get modelContraEntryDetails =>
      contraEntryDetails
          ?.map((item) => item is ContraEntryDetailsModel
              ? item
              : ContraEntryDetailsModel.fromEntity(item))
          .toList();
}

class ContraEntryDetailsModel extends ContraEntryDetailsEntity {
  ContraEntryDetailsModel({
    super.contraIDPK,
    super.ledgerIDPK,
    super.ledgerName,
    super.currentBalance,
    super.currentBalanceType,
    super.description,
    super.drAmount,
    super.crAmount,
    super.companyIDPK,
  });

  factory ContraEntryDetailsModel.fromJson(Map<String, dynamic> json) =>
      ContraEntryDetailsModel(
        contraIDPK: json["contraIDPK"],
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

  factory ContraEntryDetailsModel.fromEntity(ContraEntryDetailsEntity entity) {
    return ContraEntryDetailsModel(
      contraIDPK: entity.contraIDPK,
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
        "contraIDPK": contraIDPK,
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
