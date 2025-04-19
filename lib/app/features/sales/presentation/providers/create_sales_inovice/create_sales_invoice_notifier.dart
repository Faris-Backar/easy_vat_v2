import 'package:easy_vat_v2/app/features/sales/data/model/sales_invoice_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/create_sales_invoice_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/create_sales_order_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/create_sales_inovice/create_sales_invoice_state.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createSalesInvoiceUsecaseProvider =
    Provider<CreateSalesInvoiceUsecase>((ref) {
  return CreateSalesInvoiceUsecase(
      salesInvoiceRepository: ref.read(salesRepositoryProvider));
});

final createSalesOrderUsecaseProvider =
    Provider<CreateSalesOrderUsecase>((ref) {
  return CreateSalesOrderUsecase(
      salesRepository: ref.read(salesRepositoryProvider));
});

final createSalesNotifierProvider =
    StateNotifierProvider<CreateSalesInvoiceNotifier, CreateSalesState>((ref) {
  return CreateSalesInvoiceNotifier(
      createSalesInvoiceUsecase: ref.read(createSalesInvoiceUsecaseProvider),
      createSalesOrderUsecase: ref.read(createSalesOrderUsecaseProvider));
});

class CreateSalesInvoiceNotifier extends StateNotifier<CreateSalesState> {
  final CreateSalesInvoiceUsecase createSalesInvoiceUsecase;
  final CreateSalesOrderUsecase createSalesOrderUsecase;

  CreateSalesInvoiceNotifier({
    required this.createSalesInvoiceUsecase,
    required this.createSalesOrderUsecase,
  }) : super(CreateSalesState.initial());

  createSalesInvoice({required SalesRequestModel request}) async {
    state = CreateSalesState.initial();
    state = CreateSalesState.loading();
    try {
      final result = await createSalesInvoiceUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesState.failure(l.message),
        (r) => state = CreateSalesState.success(),
      );
    } catch (e) {
      state = CreateSalesState.failure(e.toString());
    }
  }

  createSalesOrder({required SalesRequestModel request}) async {
    state = CreateSalesState.initial();
    state = CreateSalesState.loading();
    try {
      final result = await createSalesInvoiceUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesState.failure(l.message),
        (r) => state = CreateSalesState.success(),
      );
    } catch (e) {
      state = CreateSalesState.failure(e.toString());
    }
  }

  createSalesReturn({required SalesRequestModel request}) async {
    state = CreateSalesState.initial();
    state = CreateSalesState.loading();
    try {
      final result = await createSalesInvoiceUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesState.failure(l.message),
        (r) => state = CreateSalesState.success(),
      );
    } catch (e) {
      state = CreateSalesState.failure(e.toString());
    }
  }

  createSalesQuotation({required SalesRequestModel request}) async {
    state = CreateSalesState.initial();
    state = CreateSalesState.loading();
    try {
      final result = await createSalesInvoiceUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesState.failure(l.message),
        (r) => state = CreateSalesState.success(),
      );
    } catch (e) {
      state = CreateSalesState.failure(e.toString());
    }
  }
}
