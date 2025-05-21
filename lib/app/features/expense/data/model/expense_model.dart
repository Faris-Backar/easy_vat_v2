import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';

class ExpenseListModel extends ExpenseListEntity {
  ExpenseListModel({
    super.expenseIDPK,
    super.expenseNo,
    super.referenceNo,
    super.expenseDate,
    super.paymentMode,
    super.purchasedBy,
    super.supplierIDFK,
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
    super.supplierName,
    List<ExpenseDetailsModel>? expenseDetails,
  }) : super(expenseDetails: expenseDetails);

  factory ExpenseListModel.fromJson(Map<String, dynamic> json) =>
      ExpenseListModel(
        expenseIDPK: json["expenseIDPK"],
        expenseNo: json["expenseNo"],
        referenceNo: json["referenceNo"],
        expenseDate: json["expense Date"] != null
            ? DateTime.parse(json["expense Date"])
            : null,
        paymentMode: json["paymentMode"],
        purchasedBy: json["purchasedBy"],
        supplierIDFK: json["supplierIDFK"],
        crLedgerIDFK: json["crLedgerIDFK"],
        drLedgerIDFK: json["drLedgerIDFK"],
        supplierInvoiceNo: json["supplierInvoiceNo"],
        grossTotal: json["grossTotal"],
        discount: json["discount"],
        tax: json["tax"],
        netTotal: json["netTotal"],
        roundOff: json["roundOff"],
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
        expenseDetails: json["expenseDetails"] != null
            ? List<ExpenseDetailsModel>.from(json["expenseDetails"]
                .map((x) => ExpenseDetailsModel.fromJson(x)))
            : null,
      );

  factory ExpenseListModel.fromEntity(ExpenseListEntity entity) {
    return ExpenseListModel(
      expenseIDPK: entity.expenseIDPK,
      expenseNo: entity.expenseNo,
      referenceNo: entity.referenceNo,
      expenseDate: entity.expenseDate,
      paymentMode: entity.paymentMode,
      purchasedBy: entity.purchasedBy,
      supplierIDFK: entity.supplierIDFK,
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
      supplierName: entity.supplierName,
      expenseDetails: entity.expenseDetails
          ?.map((item) => item is ExpenseDetailsModel
              ? item
              : ExpenseDetailsModel.fromEntity(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "expenseIDPK": expenseIDPK,
        "expenseNo": expenseNo,
        "referenceNo": referenceNo,
        "expenseDate": expenseDate?.toIso8601String(),
        "paymentMode": paymentMode,
        "purchasedBy": purchasedBy,
        "supplierIDFK": supplierIDFK,
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
        "supplierName": supplierName,
        "expenseDetails": expenseDetails != null
            ? List<dynamic>.from(expenseDetails!
                .map((x) => x is ExpenseDetailsModel ? x.toJson() : null)
                .where((x) => x != null))
            : [],
      };

  List<ExpenseDetailsModel>? get modelExpenseDetails => expenseDetails
      ?.map((item) => item is ExpenseDetailsModel
          ? item
          : ExpenseDetailsModel.fromEntity(item))
      .toList();
}

class ExpenseDetailsModel extends ExpenseDetailsEntity {
  ExpenseDetailsModel(
      {super.expenseIDPK,
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

  factory ExpenseDetailsModel.fromJson(Map<String, dynamic> json) =>
      ExpenseDetailsModel(
          expenseIDPK: json["expenseIDPK"],
          ledgerIDPK: json["ledgerIDPK"],
          description: json["description"],
          grossTotal: json["grossTotal"],
          taxPercentage: json["taxpercentage"],
          netTotal: json["netTotal"],
          rowguid: json["rowguid"],
          companyIDPK: json["companyIDPK"],
          currentBalance: json["currentBalance"],
          ledgerName: json["ledgerName"]);

  factory ExpenseDetailsModel.fromEntity(ExpenseDetailsEntity entity) {
    return ExpenseDetailsModel(
        expenseIDPK: entity.expenseIDPK,
        ledgerIDPK: entity.ledgerIDPK,
        description: entity.description,
        grossTotal: entity.grossTotal,
        taxPercentage: entity.taxPercentage,
        netTotal: entity.netTotal,
        rowguid: entity.rowguid,
        companyIDPK: entity.companyIDPK,
        currentBalance: entity.currentBalance,
        ledgerName: entity.ledgerName);
  }

  Map<String, dynamic> toJson() => {
        "expenseIDPK": expenseIDPK,
        "ledgerIDPK": ledgerIDPK,
        "description": description,
        "grossTotal": grossTotal,
        "taxPercentage": taxPercentage,
        "netTotal": netTotal,
        "rowguid": rowguid,
        "companyIDPK": companyIDPK,
        "currentBalance": currentBalance,
        "ledgerName": ledgerName
      };
}
