import 'package:easy_vat_v2/app/features/sales_invoice/data/model/sales_invoice_request_model.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/usecase/create_sales_invoice_usecase.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/create_sales_inovice/create_sales_invoice_state.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createSalesInvoiceUsecaseProvider =
    Provider<CreateSalesInvoiceUsecase>((ref) {
  return CreateSalesInvoiceUsecase(
      salesInvoiceRepository: ref.read(salesInvoiceRepositoryProvider));
});

final createSalesNotifierProvider =
    StateNotifierProvider<CreateSalesInvoiceNotifier, CreateSalesInvoiceState>(
        (ref) {
  return CreateSalesInvoiceNotifier(
      createSalesInvoiceUsecase: ref.read(createSalesInvoiceUsecaseProvider));
});

class CreateSalesInvoiceNotifier
    extends StateNotifier<CreateSalesInvoiceState> {
  final CreateSalesInvoiceUsecase createSalesInvoiceUsecase;
  CreateSalesInvoiceNotifier({required this.createSalesInvoiceUsecase})
      : super(CreateSalesInvoiceState.initial());

  createSalesOrder({required SalesInvoiceRequestModel request}) async {
    state = CreateSalesInvoiceState.initial();
    state = CreateSalesInvoiceState.loading();
    try {
      final result = await createSalesInvoiceUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesInvoiceState.failure(l.message),
        (r) => state = CreateSalesInvoiceState.success(),
      );
    } catch (e) {
      state = CreateSalesInvoiceState.failure(e.toString());
    }
  }
}
