class CreditNoteFilterParams {
  final DateTime? creditNoteDate;
  final String? paymentMode;
  final String? customer;
  final bool clearAllFilter;

  CreditNoteFilterParams(
      {this.creditNoteDate,
      this.paymentMode,
      this.customer,
      this.clearAllFilter = false});
}
