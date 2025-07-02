import 'package:easy_vat_v2/app/features/sales/data/model/sales_order_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_quotation_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_return_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_invoice/create_sales_invoice_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_order/create_sales_order_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_quotation/create_sales_quotation_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_return/create_sales_return_usecase.dart';
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

final createSalesReturnUsecaseProvider =
    Provider<CreateSalesReturnUsecase>((ref) {
  return CreateSalesReturnUsecase(
    salesRepository: ref.read(salesRepositoryProvider),
  );
});

final createSalesQuotationUsecaseProvider =
    Provider<CreateSalesQuotationUsecase>((ref) {
  return CreateSalesQuotationUsecase(
    salesRepository: ref.read(salesRepositoryProvider),
  );
});

final createSalesNotifierProvider =
    StateNotifierProvider<CreateSalesNotifier, CreateSalesState>((ref) {
  return CreateSalesNotifier(
      createSalesInvoiceUsecase: ref.read(createSalesUsecaseProvider),
      createSalesOrderUsecase: ref.read(createSalesOrderUsecaseProvider),
      createSalesReturnUsecase: ref.read(createSalesReturnUsecaseProvider),
      createSalesQuotationUsecase:
          ref.read(createSalesQuotationUsecaseProvider));
});

class CreateSalesNotifier extends StateNotifier<CreateSalesState> {
  final CreateSalesInvoiceUsecase createSalesInvoiceUsecase;
  final CreateSalesOrderUsecase createSalesOrderUsecase;
  final CreateSalesReturnUsecase createSalesReturnUsecase;
  final CreateSalesQuotationUsecase createSalesQuotationUsecase;

  CreateSalesNotifier(
      {required this.createSalesInvoiceUsecase,
      required this.createSalesOrderUsecase,
      required this.createSalesReturnUsecase,
      required this.createSalesQuotationUsecase})
      : super(CreateSalesState.initial());

  createSalesInvoice({required SalesRequestModel request}) async {
    state = CreateSalesState.initial();
    state = CreateSalesState.loading();
    try {
      final result = await createSalesInvoiceUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesState.failure(l.message),
        (r) =>
            state = CreateSalesState.success(r.salesList?.first.saleIdpk ?? ""),
      );
    } catch (e) {
      state = CreateSalesState.failure(e.toString());
    }
  }

  createSalesOrder({required SalesOrderModel request}) async {
    state = CreateSalesState.initial();
    state = CreateSalesState.loading();
    try {
      final result = await createSalesOrderUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesState.failure(l.message),
        (r) => state = CreateSalesState.success(r.salesOrderIdpk ?? ""),
      );
    } catch (e) {
      state = CreateSalesState.failure(e.toString());
    }
  }

  createSalesReturn({required SalesReturnModel request}) async {
    state = CreateSalesState.initial();
    state = CreateSalesState.loading();
    try {
      final result = await createSalesReturnUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesState.failure(l.message),
        (r) => state = CreateSalesState.success(r.salesReturnIdpk ?? ""),
      );
    } catch (e) {
      state = CreateSalesState.failure(e.toString());
    }
  }

  createSalesQuotation({required SalesQuotationModel request}) async {
    state = CreateSalesState.initial();
    state = CreateSalesState.loading();
    try {
      final result = await createSalesQuotationUsecase.call(params: request);

      result.fold(
        (l) => state = CreateSalesState.failure(l.message),
        (r) => state = CreateSalesState.success(r.quotationIdpk ?? ""),
      );
    } catch (e) {
      state = CreateSalesState.failure(e.toString());
    }
  }
}
