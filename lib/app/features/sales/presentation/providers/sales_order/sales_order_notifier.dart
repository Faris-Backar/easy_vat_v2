import 'package:easy_vat_v2/app/features/sales/data/repository/sales_repository_impl.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_order_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_order/fetch_sales_order_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_order/sales_order_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchSalesOrderUsecaseProvider = Provider<FetchSalesOrderUsecase>((ref) {
  return FetchSalesOrderUsecase(salesRepository: SalesRepositoryImpl());
});

final salesOrderNotifierProvider =
    StateNotifierProvider<SalesOrderNotifiers, SalesOrderState>((ref) {
  return SalesOrderNotifiers(
    fetchSalesOrderUsecase: ref.read(fetchSalesOrderUsecaseProvider),
  );
});

class SalesOrderNotifiers extends StateNotifier<SalesOrderState> {
  final FetchSalesOrderUsecase fetchSalesOrderUsecase;
  List<SalesOrderEntity>? salesOrderList;
  DateTime? fromDate;
  DateTime? toDate;

  SalesOrderNotifiers({required this.fetchSalesOrderUsecase})
      : super(SalesOrderState.initial());

  fetchSalesOrder({required SalesParams params}) async {
    state = const SalesOrderState.loading();
    final result = await fetchSalesOrderUsecase.call(params: params);
    result.fold((failure) => state = SalesOrderState.failure(failure.message),
        (salesOrders) {
      salesOrderList = salesOrders;
      double totalAmount = 0.0;
      for (var i = 0; i < (salesOrders.length); i++) {
        totalAmount += salesOrders[i].netTotal ?? 0.0;
      }
      return state = SalesOrderState.success(
          salesOrderList: salesOrders, totalAmount: totalAmount);
    });
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
