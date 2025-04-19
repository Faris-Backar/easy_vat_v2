import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_sales_invoice_state.freezed.dart';

@freezed
class CreateSalesState with _$CreateSalesInvoiceState {
  const factory CreateSalesState.initial() = _Initial;
  const factory CreateSalesState.loading() = _Loading;
  const factory CreateSalesState.success() = _Success;
  const factory CreateSalesState.failure(String error) = _Failure;
}
