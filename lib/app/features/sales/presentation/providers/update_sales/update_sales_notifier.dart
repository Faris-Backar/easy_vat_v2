import 'package:easy_vat_v2/app/features/sales/data/model/sales_quotation_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_invoice/update_sales_invoice.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_quotation/update_sales_quotation_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/update_sales/update_sales_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateSalesInvoiceUsecaseProvider =
    Provider<UpdateSalesInvoiceUsecase>((ref) {
  return UpdateSalesInvoiceUsecase(
      salesInvoiceRepository: ref.read(salesRepositoryProvider));
});
final updateSalesQuotationUsecaseProvider =
    Provider<UpdateSalesQuotationUsecase>((ref) {
  return UpdateSalesQuotationUsecase(
      salesReturnRepository: ref.read(salesRepositoryProvider));
});

final updateSalesNotifierProvider =
    StateNotifierProvider<UpdateSalesNotifier, UpdateSalesState>((ref) {
  return UpdateSalesNotifier(
      updateSalesInvoiceUsecase: ref.read(updateSalesInvoiceUsecaseProvider),
      updateSalesQuotationUsecase:
          ref.read(updateSalesQuotationUsecaseProvider));
});

class UpdateSalesNotifier extends StateNotifier<UpdateSalesState> {
  final UpdateSalesInvoiceUsecase updateSalesInvoiceUsecase;
  final UpdateSalesQuotationUsecase updateSalesQuotationUsecase;

  UpdateSalesNotifier({
    required this.updateSalesQuotationUsecase,
    required this.updateSalesInvoiceUsecase,
  }) : super(UpdateSalesState.initial());

  updateSalesInvoice({required SalesRequestModel request}) async {
    state = UpdateSalesState.initial();
    state = UpdateSalesState.loading();
    try {
      final result = await updateSalesInvoiceUsecase.call(params: request);

      result.fold(
        (l) => state = UpdateSalesState.failure(l.message),
        (r) => state = UpdateSalesState.success(),
      );
    } catch (e) {
      state = UpdateSalesState.failure(e.toString());
    }
  }

  updateSalesQuotation({required SalesQuotationModel request}) async {
    state = UpdateSalesState.initial();
    state = UpdateSalesState.loading();
    try {
      final result = await updateSalesQuotationUsecase.call(params: request);

      result.fold(
        (l) => state = UpdateSalesState.failure(l.message),
        (r) => state = UpdateSalesState.success(),
      );
    } catch (e) {
      state = UpdateSalesState.failure(e.toString());
    }
  }
}
