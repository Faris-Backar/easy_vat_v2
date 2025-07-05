abstract class ContraEntity {
  final bool? status;
  final String? message;
  final List<ContraEntryEntity>? contraEntry;

  ContraEntity({this.status, this.message, this.contraEntry});
}

abstract class ContraEntryEntity {
  final String? contraIDPK;
  final int? contraNo;
  final String? referenceNo;
  final DateTime? contraDate;
  final String? description;
  final double? totalAmount;
  final String? remarks;
  final bool? isEditable;
  final bool? isCanceled;
  final String? createdBy;
  final DateTime? createdDate;
  final String? modifiedBy;
  final DateTime? modifiedDate;
  final String? rowguid;
  final String? companyIDPK;
  final String? entryMode;
  final String? toAccount;
  final String? toAccountName;
  final List<ContraEntryDetailEntity>? contraEntryDetail;

  ContraEntryEntity(
      {this.contraIDPK,
      this.contraNo,
      this.referenceNo,
      this.contraDate,
      this.description,
      this.totalAmount,
      this.remarks,
      this.isEditable,
      this.isCanceled,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.rowguid,
      this.companyIDPK,
      this.entryMode,
      this.toAccount,
      this.toAccountName,
      this.contraEntryDetail});
}

abstract class ContraEntryDetailEntity {
  final String? contraIDPK;
  final String? ledgerIDPK;
  final String? ledgerName;
  final double? currentBalance;
  final String? currentBalanceType;
  final String? description;
  final double? drAmount;
  final double? crAmount;
  final String? companyIDPK;
  ContraEntryDetailEntity({
    this.contraIDPK,
    this.ledgerIDPK,
    this.ledgerName,
    this.currentBalance,
    this.currentBalanceType,
    this.description,
    this.drAmount,
    this.crAmount,
    this.companyIDPK,
  });
}
