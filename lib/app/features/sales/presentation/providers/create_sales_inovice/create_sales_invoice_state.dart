import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_sales_invoice_state.freezed.dart';

@freezed
class CreateSalesInvoiceState with _$CreateSalesInvoiceState {
  const factory CreateSalesInvoiceState.initial() = _Initial;
  const factory CreateSalesInvoiceState.loading() = _Loading;
  const factory CreateSalesInvoiceState.success() = _Success;
  const factory CreateSalesInvoiceState.failure(String error) = _Failure;
}
