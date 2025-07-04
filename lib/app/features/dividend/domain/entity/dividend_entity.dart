abstract class DividendEntity {
  final bool? status;
  final String? message;
  final List<DividendListEntity>? dividend;

  DividendEntity({this.status, this.message, this.dividend});
}

abstract class DividendListEntity {
  final String? dividendIDPK;
  final int? dividendNo;
  final String? referenceNo;
  final DateTime? dividendDate;
  final String? paymentMode;
  final String? crLedgerIDFK;
  final String? drLedgerIDFK;
  final String? expenseLedger;
  final String? cashAccount;
  final String? issuedBy;
  final double? netTotal;
  final String? remarks;
  final bool? isEditable;
  final bool? isCanceled;
  final String? createdBy;
  final DateTime? createdDate;
  final String? modifiedBy;
  final DateTime? modifiedDate;
  final String? rowguid;
  final String? companyIDPK;
  final List<DividendDetailsEntity>? dividendDetails;

  DividendListEntity({
    this.dividendIDPK,
    this.dividendNo,
    this.referenceNo,
    this.dividendDate,
    this.paymentMode,
    this.crLedgerIDFK,
    this.drLedgerIDFK,
    this.expenseLedger,
    this.cashAccount,
    this.issuedBy,
    this.netTotal,
    this.remarks,
    this.isEditable,
    this.isCanceled,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.rowguid,
    this.companyIDPK,
    this.dividendDetails,
  });
}

abstract class DividendDetailsEntity {
  final String? dividendIDPK;
  final String? ledgerIDPK;
  final double? currentBalance;
  final String? currentBalanceType;
  final String? ledgerName;
  final String? description;
  final double? netTotal;
  final String? rowguid;
  final String? companyIDPK;

  DividendDetailsEntity({
    this.dividendIDPK,
    this.ledgerIDPK,
    this.currentBalance,
    this.currentBalanceType,
    this.ledgerName,
    this.description,
    this.netTotal,
    this.rowguid,
    this.companyIDPK,
  });
}
