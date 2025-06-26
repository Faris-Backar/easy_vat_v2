abstract class CreditNoteEntity {
  final bool? status;
  final String? message;
  final List<CreditNoteEntryEntity>? creditNoteEntry;

  CreditNoteEntity({this.status, this.message, this.creditNoteEntry});
}

abstract class CreditNoteEntryEntity {
  final String? creditNoteIDPK;
  final String? customerIDPK;
  final String? drLedgerIDPK;
  final String? crLedgerIDPK;
  final int? creditNoteNo;
  final String? referenceNo;
  final DateTime? creditNoteDate;
  final String? description;
  final String? paymentMode;
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
  final String? customerName;
  final double? customerBalance;
  final List<CreditNoteEntryDetailsEntity>? creditNoteEntryDetails;

  CreditNoteEntryEntity(
      {this.creditNoteIDPK,
      this.customerIDPK,
      this.creditNoteNo,
      this.drLedgerIDPK,
      this.crLedgerIDPK,
      this.referenceNo,
      this.creditNoteDate,
      this.paymentMode,
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
      this.customerName,
      this.customerBalance,
      this.creditNoteEntryDetails});
}

abstract class CreditNoteEntryDetailsEntity {
  final String? creditNoteIDPK;
  final String? ledgerIDPK;
  final String? description;
  final double? drAmount;
  final double? tax;
  final double? taxPercentage;
  final double? netTotal;
  final String? companyIDPK;
  final double? ledgerBalance;
  final String? ledgerName;
  CreditNoteEntryDetailsEntity({
    this.creditNoteIDPK,
    this.ledgerIDPK,
    this.description,
    this.drAmount,
    this.tax,
    this.taxPercentage,
    this.netTotal,
    this.companyIDPK,
    this.ledgerBalance,
    this.ledgerName,
  });
}
