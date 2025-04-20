import 'package:easy_vat_v2/app/features/sales/data/model/sales_invoice_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_invoice/create_sales_invoice_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_order/create_sales_order_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/create_sales/create_sales_state.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createSalesUsecaseProvider = Provider<CreateSalesInvoiceUsecase>((ref) {
  return CreateSalesInvoiceUsecase(
      salesInvoiceRepository: ref.read(salesRepositoryProvider));
});

final createSalesOrderUsecaseProvider =
    Provider<CreateSalesOrderUsecase>((ref) {
  return CreateSalesOrderUsecase(
      salesRepository: ref.read(salesRepositoryProvider));
});

final createSalesNotifierProvider =
    StateNotifierProvider<CreateSalesNotifier, CreateSalesState>((ref) {
  return CreateSalesNotifier(
      createSalesInvoiceUsecase: ref.read(createSalesUsecaseProvider),
      createSalesOrderUsecase: ref.read(createSalesOrderUsecaseProvider));
});

class CreateSalesNotifier extends StateNotifier<CreateSalesState> {
  final CreateSalesInvoiceUsecase createSalesInvoiceUsecase;
  final CreateSalesOrderUsecase createSalesOrderUsecase;

  CreateSalesNotifier({
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
