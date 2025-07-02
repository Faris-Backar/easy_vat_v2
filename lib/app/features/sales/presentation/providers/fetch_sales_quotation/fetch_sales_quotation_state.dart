part of 'fetch_sales_quotation.dart';

@freezed
class FetchSalesQuotationState with _$FetchSalesQuotationState {
  const factory FetchSalesQuotationState.initial() = _Initial;
  const factory FetchSalesQuotationState.loading() = _Loading;
  const factory FetchSalesQuotationState.success(
      {required List<SalesQuotationEntity> salesQuotationList,
      double? totalAmount}) = _Success;
  const factory FetchSalesQuotationState.failure(String message) = _Failure;
}
