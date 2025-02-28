import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_sales_invoice_state.freezed.dart';

@freezed
class CreateSalesInvoiceState with _$CreateSalesInvoiceState {
  const factory CreateSalesInvoiceState({
    required CustomerEntity? selectedCustomer,
    required CreateSalesInvoiceStatus status,
    String? errorMessage,
  }) = _CreateSalesInvoiceState;

  factory CreateSalesInvoiceState.initial() => const CreateSalesInvoiceState(
        selectedCustomer: null,
        status: CreateSalesInvoiceStatus.initial,
      );
}

enum CreateSalesInvoiceStatus { initial, loading, success, failure }
