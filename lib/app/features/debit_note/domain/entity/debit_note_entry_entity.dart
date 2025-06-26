abstract class DebitNoteEntity {
  final bool? status;
  final String? message;
  final List<DebitNoteEntryEntity>? debitNoteEntry;

  DebitNoteEntity({this.status, this.message, this.debitNoteEntry});
}

abstract class DebitNoteEntryEntity {
  final String? debitNoteIDPK;
  final String? supplierIDPK;
  final String? crLedgerIDPK;
  final String? drLedgerIDPK;
  final int? debitNoteNo;
  final String? referenceNo;
  final DateTime? debitNoteDate;
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
  final String? supplierName;
  final double? customerBalance;
  final List<DebitNoteEntryDetailsEntity>? debitNoteEntryDetails;

  DebitNoteEntryEntity(
      {this.debitNoteIDPK,
      this.supplierIDPK,
      this.crLedgerIDPK,
      this.drLedgerIDPK,
      this.debitNoteNo,
      this.referenceNo,
      this.debitNoteDate,
      this.description,
      this.paymentMode,
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
      this.supplierName,
      this.customerBalance,
      this.debitNoteEntryDetails});
}

abstract class DebitNoteEntryDetailsEntity {
  final String? debitNoteIDPK;
  final String? ledgerIDPK;
  final String? description;
  final double? crAmount;
  final double? tax;
  final double? taxPercentage;
  final double? netTotal;
  final String? companyIDPK;
  final double? ledgerBalance;
  final String? ledgerName;

  DebitNoteEntryDetailsEntity({
    this.debitNoteIDPK,
    this.ledgerIDPK,
    this.description,
    this.crAmount,
    this.tax,
    this.taxPercentage,
    this.netTotal,
    this.companyIDPK,
    this.ledgerBalance,
    this.ledgerName,
  });
}
