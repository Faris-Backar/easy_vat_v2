class IncomeFilterParams {
  final DateTime? incomeDate;
  final String? paymentMode;
  final String? customer;
  final bool clearAllFilter;

  IncomeFilterParams(
      {this.incomeDate,
      this.paymentMode,
      this.customer,
      this.clearAllFilter = false});
}
