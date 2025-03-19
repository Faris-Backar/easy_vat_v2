class SalesInvoiceFilterParams {
  final DateTime? salesDate;
  final String? salesMode;
  final String? soldBy;
  final bool clearAllFilter;

  SalesInvoiceFilterParams({
    this.salesDate,
    this.salesMode,
    this.soldBy,
    this.clearAllFilter = false,
  });
}
