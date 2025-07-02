abstract class IncomeEntity {
  final bool? status;
  final String? message;
  final List<IncomeListEntity>? incomeList;

  IncomeEntity({this.status, this.message, this.incomeList});
}

abstract class IncomeListEntity {
  final String? incomeIDPK;
  final int? incomeNo;
  final String? referenceNo;
  final DateTime? incomeDate;
  final String? paymentMode;
  final String? soldBy;
  final String? customerIDFK;
  final String? crLedgerIDFK;
  final String? drLedgerIDFK;
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
  final String? customerName;
  final List<IncomeDetailsEntity>? incomeDetails;

  IncomeListEntity(
      {this.incomeIDPK,
      this.incomeNo,
      this.referenceNo,
      this.incomeDate,
      this.paymentMode,
      this.soldBy,
      this.customerIDFK,
      this.crLedgerIDFK,
      this.drLedgerIDFK,
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
      this.customerName,
      this.incomeDetails});
}

abstract class IncomeDetailsEntity {
  final String? incomeIDPK;
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
  final String? ledgerCode;

  IncomeDetailsEntity(
      {this.incomeIDPK,
      this.ledgerIDPK,
      this.description,
      this.grossTotal,
      this.taxAmount,
      this.taxPercentage,
      this.netTotal,
      this.rowguid,
      this.companyIDPK,
      this.currentBalance,
      this.ledgerName,
      this.ledgerCode});
}
