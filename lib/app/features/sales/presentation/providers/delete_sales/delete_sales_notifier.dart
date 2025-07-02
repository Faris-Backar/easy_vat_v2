import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_invoice/delete_sales_invoice.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_quotation/delete_sales_quotation_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_return/delete_sales_return_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/delete_sales/delete_sales_state.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteSalesInvoiceUseCase = Provider<DeleteSalesInvoiceUsecase>((ref) {
  return DeleteSalesInvoiceUsecase(
      salesInvoiceRepository: ref.read(salesRepositoryProvider));
});

final deleteSalesReturnUseCase = Provider<DeleteSalesReturnUsecase>((ref) {
  return DeleteSalesReturnUsecase(
      salesReturnRepository: ref.read(salesRepositoryProvider));
});

final deleteSalesQuotationUseCase =
    Provider<DeleteSalesQuotationUsecase>((ref) {
  return DeleteSalesQuotationUsecase(
      salesQuotationRepository: ref.read(salesRepositoryProvider));
});

final deleteSalesNotifierProvider =
    StateNotifierProvider<DeleteSalesNotifier, DeleteSalesState>((ref) {
  return DeleteSalesNotifier(
      deleteSalesInvoiceUsecase: ref.read(deleteSalesInvoiceUseCase),
      deleteSalesReturnUsecase: ref.read(deleteSalesReturnUseCase),
      deleteSalesQuotationUsecase: ref.read(deleteSalesQuotationUseCase));
});

class DeleteSalesNotifier extends StateNotifier<DeleteSalesState> {
  final DeleteSalesInvoiceUsecase deleteSalesInvoiceUsecase;
  final DeleteSalesReturnUsecase deleteSalesReturnUsecase;
  final DeleteSalesQuotationUsecase deleteSalesQuotationUsecase;

  DeleteSalesNotifier(
      {required this.deleteSalesInvoiceUsecase,
      required this.deleteSalesReturnUsecase,
      required this.deleteSalesQuotationUsecase})
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

  deleteSalesReturn({required SalesParams request}) async {
    state = DeleteSalesState.initial();
    state = DeleteSalesState.loading();
    try {
      final result = await deleteSalesReturnUsecase.call(params: request);

      result.fold(
        (l) => state = DeleteSalesState.failure(l.message),
        (r) => state = DeleteSalesState.success(),
      );
    } catch (e) {
      state = DeleteSalesState.failure(e.toString());
    }
  }

  deleteSalesQuotation({required SalesParams request}) async {
    state = DeleteSalesState.initial();
    state = DeleteSalesState.loading();
    try {
      final result = await deleteSalesQuotationUsecase.call(params: request);

      result.fold(
        (l) => state = DeleteSalesState.failure(l.message),
        (r) => state = DeleteSalesState.success(),
      );
    } catch (e) {
      state = DeleteSalesState.failure(e.toString());
    }
  }
}
