import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/data/repository/sales_invoice_repository_impl.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/repositories/sales_order_repository.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/sales_invoice_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final salesInvoiceRepositoryProvider = Provider<SalesInvoiceRepository>((ref) {
  return SalesInvoiceRepositoryImpl(client: ref.read(dioProvider));
});

final salesInvoiceNotifierProvider =
    StateNotifierProvider<SalesInoiveNotifiers, SalesInvoiceState>((ref) {
  return SalesInoiveNotifiers(
    salesInvoiceRepository: ref.read(salesInvoiceRepositoryProvider),
  );
});

class SalesInoiveNotifiers extends StateNotifier<SalesInvoiceState> {
  final SalesInvoiceRepository salesInvoiceRepository;
  SalesInoiveNotifiers({required this.salesInvoiceRepository})
      : super(SalesInvoiceState.initial());

  fetchSalesInvoice({required SalesInvoiceParams params}) async {
    state = const SalesInvoiceState.loading();
    final result = await salesInvoiceRepository.getSalesInvoices(
        salesInvoiceRequestParams: params);
    result.fold(
      (failure) => state = SalesInvoiceState.failure(failure.message),
      (salesInvoice) => state = SalesInvoiceState.success(salesInvoice),
    );
  }
}
