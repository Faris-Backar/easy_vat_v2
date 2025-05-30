abstract class ExpenseEntity {
  final bool? status;
  final String? message;
  final List<ExpenseListEntity>? expenseList;

  ExpenseEntity({this.status, this.message, this.expenseList});
}

abstract class ExpenseListEntity {
  final String? expenseIDPK;
  final int? expenseNo;
  final String? referenceNo;
  final DateTime? expenseDate;
  final String? paymentMode;
  final String? purchasedBy;
  final String? supplierIDFK;
  final String? crLedgerIDFK;
  final String? drLedgerIDFK;
  final String? supplierInvoiceNo;
  final double? grossTotal;
  final double? discount;
  final double? tax;
  final double? netTotal;
  final double? roundOff;
  final String? remarks;
  final bool? isEditable;
  final bool? isCanceled;
  final String? createdBy;
  final DateTime? createdDate;
  final String? modifiedBy;
  final DateTime? modifiedDate;
  final String? rowguid;
  final String? companyIDPK;
  final String? supplierName;
  final List<ExpenseDetailsEntity>? expenseDetails;

  ExpenseListEntity(
      {this.expenseDetails,
      this.expenseIDPK,
      this.expenseNo,
      this.referenceNo,
      this.expenseDate,
      this.paymentMode,
      this.purchasedBy,
      this.supplierIDFK,
      this.crLedgerIDFK,
      this.drLedgerIDFK,
      this.supplierInvoiceNo,
      this.grossTotal,
      this.discount,
      this.tax,
      this.netTotal,
      this.roundOff,
      this.remarks,
      this.isEditable,
      this.isCanceled,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.rowguid,
      this.companyIDPK,
      this.supplierName});
}

abstract class ExpenseDetailsEntity {
  final String? expenseIDPK;
  final String? ledgerIDPK;
  final String? description;
  final double? grossTotal;
  final double? taxAmount;
  final double? taxPercentage;
  final double? netTotal;
  final String? rowguid;
  final String? companyIDPK;
  final double? currentBalance;
  final String? ledgerName;

  ExpenseDetailsEntity(
      {this.expenseIDPK,
      this.ledgerIDPK,
      this.description,
      this.grossTotal,
      this.taxAmount,
      this.taxPercentage,
      this.netTotal,
      this.rowguid,
      this.companyIDPK,
      this.currentBalance,
      this.ledgerName});
}
