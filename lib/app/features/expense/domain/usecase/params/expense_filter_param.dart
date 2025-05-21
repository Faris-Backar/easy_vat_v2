class ExpenseFilterParam {
  final String? paymentMode;
  final Null supplier;
  final bool clearAllFilter;

  ExpenseFilterParam(
      {this.paymentMode, this.supplier, this.clearAllFilter = false});
}
