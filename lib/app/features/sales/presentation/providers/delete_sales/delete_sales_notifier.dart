import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_invoice/delete_sales_invoice.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/delete_sales/delete_sales_state.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteSalesInvoiceUseCase = Provider<DeleteSalesInvoiceUsecase>((ref) {
  return DeleteSalesInvoiceUsecase(
      salesInvoiceRepository: ref.read(salesRepositoryProvider));
});

final deleteSalesNotifierProvider =
    StateNotifierProvider<DeleteSalesNotifier, DeleteSalesState>((ref) {
  return DeleteSalesNotifier(
      deleteSalesInvoiceUsecase: ref.read(deleteSalesInvoiceUseCase));
});

class DeleteSalesNotifier extends StateNotifier<DeleteSalesState> {
  final DeleteSalesInvoiceUsecase deleteSalesInvoiceUsecase;

  DeleteSalesNotifier({required this.deleteSalesInvoiceUsecase})
      : super(DeleteSalesState.initial());

  deleteSalesInvoice({required SalesParams request}) async {
    state = DeleteSalesState.initial();
    state = DeleteSalesState.loading();
    try {
      final result = await deleteSalesInvoiceUsecase.call(params: request);

      result.fold(
        (l) => state = DeleteSalesState.failure(l.message),
        (r) => state = DeleteSalesState.success(),
      );
    } catch (e) {
      state = DeleteSalesState.failure(e.toString());
    }
  }
}
