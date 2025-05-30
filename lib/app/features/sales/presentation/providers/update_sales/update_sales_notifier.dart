import 'package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_invoice/update_sales_invoice.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/update_sales/update_sales_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateSalesInvoiceUsecaseProvider =
    Provider<UpdateSalesInvoiceUsecase>((ref) {
  return UpdateSalesInvoiceUsecase(
      salesInvoiceRepository: ref.read(salesRepositoryProvider));
});

final updateSalesNotifierProvider =
    StateNotifierProvider<UpdateSalesNotifier, UpdateSalesState>((ref) {
  return UpdateSalesNotifier(
    updateSalesInvoiceUsecase: ref.read(updateSalesInvoiceUsecaseProvider),
  );
});

class UpdateSalesNotifier extends StateNotifier<UpdateSalesState> {
  final UpdateSalesInvoiceUsecase updateSalesInvoiceUsecase;

  UpdateSalesNotifier({
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
}
