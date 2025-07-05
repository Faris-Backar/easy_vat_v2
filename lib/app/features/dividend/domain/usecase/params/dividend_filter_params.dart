class DividendFilterParams {
  final DateTime? dividendDate;
  final String? paymentMode;
  final bool clearAllFilter;
  DividendFilterParams(
      {this.dividendDate, this.paymentMode, this.clearAllFilter = false});
}
