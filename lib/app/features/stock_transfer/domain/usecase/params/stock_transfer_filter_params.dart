class StockTransferFilterParams {
  final DateTime? stockTransferDate;
  final bool clearAllFilter;
  StockTransferFilterParams(
      {this.stockTransferDate, this.clearAllFilter = false});
}
