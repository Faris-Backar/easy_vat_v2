class ExpenseFilterParam {
  final DateTime? expenseDate;
  final String? paymentMode;
  final String? supplier;
  final bool clearAllFilter;

  ExpenseFilterParam(
      {this.expenseDate,
      this.paymentMode,
      this.supplier,
      this.clearAllFilter = false});
}
