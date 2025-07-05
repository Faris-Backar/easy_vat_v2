abstract class JournalEntity {
  final bool? status;
  final String? message;
  final List<JournalEntryEntity>? journalEntry;

  JournalEntity({this.status, this.message, this.journalEntry});
}

abstract class JournalEntryEntity {
  final String? journalIDPK;
  final int? journalNo;
  final String? referenceNo;
  final DateTime? journalDate;
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
  final List<JournalEntryDetailEntity>? journalEntryDetail;

  JournalEntryEntity(
      {this.journalIDPK,
      this.journalNo,
      this.referenceNo,
      this.journalDate,
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
      this.journalEntryDetail});
}

abstract class JournalEntryDetailEntity {
  final String? journalIDPK;
  final String? ledgerIDPK;
  final String? ledgerName;
  final double? currentBalance;
  final String? currentBalanceType;
  final String? description;
  final double? drAmount;
  final double? crAmount;
  final String? companyIDPK;

  JournalEntryDetailEntity({
    this.journalIDPK,
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
