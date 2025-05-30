class SalesInvoiceFilterParams {
  final String? salesMode;
  final String? soldBy;
  final String? customerIdpk;
  final bool clearAllFilter;

  SalesInvoiceFilterParams({
    this.salesMode,
    this.soldBy,
    this.customerIdpk,
    this.clearAllFilter = false,
  });
}
