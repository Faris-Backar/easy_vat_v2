import 'package:easy_vat_v2/app/features/sales/data/repository/sales_repository_impl.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
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
  List<SalesInvoiceListEntity>? salesList;
  DateTime? fromDate;
  DateTime? toDate;

  SalesOrderNotifiers({required this.fetchSalesOrderUsecase})
      : super(SalesOrderState.initial());

  fetchSalesOrder({required SalesParams params}) async {
    state = const SalesOrderState.loading();
    final result = await fetchSalesOrderUsecase.call(params: params);
    result.fold((failure) => state = SalesOrderState.failure(failure.message),
        (salesInvoice) {
      salesList = salesInvoice.salesList;
      return state = SalesOrderState.success(salesInvoice.salesList ?? []);
    });
  }

  // void filterSalesInvoice({required SalesInvoiceFilterParams params}) {
  //   if (params.clearAllFilter) {
  //     state = SalesOrderState.success(salesList ?? []);
  //   } else {
  //     if (salesList == null) return;

  //     final filteredSales = salesList?.where((sale) {
  //       final matchesDate = params.salesDate == null ||
  //           (sale.saleDate != null &&
  //               sale.saleDate!.toLocal().isAtSameMomentAs(params.salesDate!));

  //       final matchesMode = params.salesMode == null ||
  //           (sale.saleMode != null &&
  //               sale.saleMode!.toLowerCase() ==
  //                   params.salesMode!.toLowerCase());

  //       final matchesSoldBy = params.soldBy == null ||
  //           (sale.soldBy != null &&
  //               sale.soldBy!.toLowerCase() == params.soldBy!.toLowerCase());

  //       return matchesDate && matchesMode && matchesSoldBy;
  //     }).toList();

  //     state = SalesOrderState.success(filteredSales ?? []);
  //   }
  // }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
