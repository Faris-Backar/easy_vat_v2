class DebitNoteFilterParams {
  final DateTime? debitNoteDate;
  final String? paymentMode;
  final String? supplier;
  final bool clearAllFilter;

  DebitNoteFilterParams(
      {this.debitNoteDate,
      this.paymentMode,
      this.supplier,
      this.clearAllFilter = false});
}
