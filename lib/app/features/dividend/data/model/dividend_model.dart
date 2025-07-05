import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';

class DividendModel extends DividendEntity {
  DividendModel({super.message, super.dividend, super.status});

  factory DividendModel.fromJson(Map<String, dynamic> json) => DividendModel(
        status: json['status'],
        message: json['message'],
        dividend: json['dividend'] != null
            ? List<DividendListModel>.from(
                json['dividend'].map((x) => DividendListModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "dividend": List<DividendListModel>.from(
            (dividend as List<DividendListModel>?)?.map((x) => x.toJson()) ??
                [])
      };
}

class DividendListModel extends DividendListEntity {
  DividendListModel({
    super.dividendIDPK,
    super.dividendNo,
    super.referenceNo,
    super.dividendDate,
    super.paymentMode,
    super.crLedgerIDFK,
    super.drLedgerIDFK,
    super.expenseLedger,
    super.cashAccount,
    super.issuedBy,
    super.netTotal,
    super.remarks,
    super.isEditable,
    super.isCanceled,
    super.createdBy,
    super.createdDate,
    super.modifiedBy,
    super.modifiedDate,
    super.rowguid,
    super.companyIDPK,
    List<DividendDetailsModel>? dividendDetails,
  }) : super(dividendDetails: dividendDetails);

  factory DividendListModel.fromJson(Map<String, dynamic> json) =>
      DividendListModel(
        dividendIDPK: json["dividendIDPK"],
        dividendNo: json["dividendNo"],
        referenceNo: json["referenceNo"],
        dividendDate: json["dividendDate"] != null
            ? DateTime.parse(json["dividendDate"])
            : null,
        paymentMode: json["paymentMode"],
        crLedgerIDFK: json["crLedgerIDFK"],
        drLedgerIDFK: json["drLedgerIDFK"],
        expenseLedger: json["expenseLedger"],
        cashAccount: json["cashAccount"],
        issuedBy: json["issuedBy"],
        netTotal: json["netTotal"] != null
            ? (json["netTotal"] as num).toDouble()
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
        dividendDetails: json["dividendDetails"] != null
            ? List<DividendDetailsModel>.from(json["dividendDetails"]
                .map((x) => DividendDetailsModel.fromJson(x)))
            : null,
      );

  factory DividendListModel.fromEntity(DividendListEntity entity) {
    return DividendListModel(
      dividendIDPK: entity.dividendIDPK,
      dividendNo: entity.dividendNo,
      referenceNo: entity.referenceNo,
      dividendDate: entity.dividendDate,
      paymentMode: entity.paymentMode,
      crLedgerIDFK: entity.crLedgerIDFK,
      drLedgerIDFK: entity.drLedgerIDFK,
      expenseLedger: entity.expenseLedger,
      cashAccount: entity.cashAccount,
      issuedBy: entity.issuedBy,
      netTotal: entity.netTotal,
      remarks: entity.remarks,
      isEditable: entity.isEditable,
      isCanceled: entity.isCanceled,
      createdBy: entity.createdBy,
      createdDate: entity.createdDate,
      modifiedBy: entity.modifiedBy,
      modifiedDate: entity.modifiedDate,
      rowguid: entity.rowguid,
      companyIDPK: entity.companyIDPK,
      dividendDetails: entity.dividendDetails
          ?.map((item) => item is DividendDetailsModel
              ? item
              : DividendDetailsModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "dividendIDPK": dividendIDPK,
        "dividendNo": dividendNo,
        "referenceNo": referenceNo,
        "dividendDate": dividendDate?.toIso8601String(),
        "paymentMode": paymentMode,
        "crLedgerIDFK": crLedgerIDFK,
        "drLedgerIDFK": drLedgerIDFK,
        "expenseLedger": expenseLedger,
        "cashAccount": cashAccount,
        "issuedBy": issuedBy,
        "netTotal": netTotal,
        "remarks": remarks,
        "isEditable": isEditable,
        "isCanceled": isCanceled,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate?.toIso8601String(),
        "rowguid": rowguid,
        "companyIDPK": companyIDPK,
        "dividendDetails": dividendDetails != null
            ? List<dynamic>.from(dividendDetails!
                .map((x) => x is DividendDetailsModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  List<DividendDetailsModel>? get modelDividendDetails => dividendDetails
      ?.map((item) => item is DividendDetailsModel
          ? item
          : DividendDetailsModel.fromEntity(item))
      .toList();
}

class DividendDetailsModel extends DividendDetailsEntity {
  DividendDetailsModel(
      {super.dividendIDPK,
      super.ledgerIDPK,
      super.currentBalance,
      super.currentBalanceType,
      super.ledgerName,
      super.description,
      super.netTotal,
      super.rowguid,
      super.companyIDPK});

  factory DividendDetailsModel.fromJson(Map<String, dynamic> json) =>
      DividendDetailsModel(
        dividendIDPK: json["dividendIDPK"],
        ledgerIDPK: json["ledgerIDPK"],
        currentBalance: json["currentBalance"] != null
            ? (json["currentBalance"] as num).toDouble()
            : null,
        currentBalanceType: json["currentBalanceType"],
        ledgerName: json["ledgerName"],
        description: json["description"],
        netTotal: json["netTotal"] != null
            ? (json["netTotal"] as num).toDouble()
            : null,
        rowguid: json["rowguid"],
        companyIDPK: json["companyIDPK"],
      );

  factory DividendDetailsModel.fromEntity(DividendDetailsEntity entity) {
    return DividendDetailsModel(
      dividendIDPK: entity.dividendIDPK,
      ledgerIDPK: entity.ledgerIDPK,
      currentBalance: entity.currentBalance,
      currentBalanceType: entity.currentBalanceType,
      ledgerName: entity.ledgerName,
      description: entity.description,
      netTotal: entity.netTotal,
      rowguid: entity.rowguid,
      companyIDPK: entity.companyIDPK,
    );
  }

  Map<String, dynamic> toJson() => {
        "dividendIDPK": dividendIDPK,
        "ledgerIDPK": ledgerIDPK,
        "currentBalance": currentBalance,
        "currentBalanceType": currentBalanceType,
        "ledgerName": ledgerName,
        "description": description,
        "netTotal": netTotal,
        "rowguid": rowguid,
        "companyIDPK": companyIDPK,
      };
}
