import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/create_sales_inovice/create_sales_invoice_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createSalesNotifierProvider =
    StateNotifierProvider<CreateSalesInvoiceNotifier, CreateSalesInvoiceState>(
        (ref) {
  return CreateSalesInvoiceNotifier();
});

class CreateSalesInvoiceNotifier
    extends StateNotifier<CreateSalesInvoiceState> {
  CreateSalesInvoiceNotifier() : super(CreateSalesInvoiceState.initial());

  CustomerEntity? selectedCustomer;

  setCustomer(CustomerEntity customer) {
    state = state.copyWith(selectedCustomer: customer);
  }

  clearData() {
    state = state.copyWith(selectedCustomer: null);
  }
}
