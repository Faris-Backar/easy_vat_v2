import 'package:easy_vat_v2/app/features/sales_invoice/domain/entities/sales_invoice_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_invoice_state.freezed.dart';

@freezed
class SalesInvoiceState with _$SalesInvoiceState {
  const factory SalesInvoiceState.initial() = _Initial;
  const factory SalesInvoiceState.loading() = _Loading;
  const factory SalesInvoiceState.success(SalesInvoiceEntity salesInvoice) =
      _Success;
  const factory SalesInvoiceState.failure(String message) = _Failure;
}
