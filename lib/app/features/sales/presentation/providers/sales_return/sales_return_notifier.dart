import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/fetch_sales_return_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_filter_params.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_return/sales_return_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchSalesReturnUsecaseProvider =
    Provider<FetchSalesReturnUsecase>((ref) {
  return FetchSalesReturnUsecase(
      salesRepository: ref.read(salesRepositoryProvider));
});

final salesReturnNotifierProvider =
    StateNotifierProvider<SalesReturnNotifiers, SalesReturnState>((ref) {
  return SalesReturnNotifiers(
    fetchSalesReturnUsecase: ref.read(fetchSalesReturnUsecaseProvider),
  );
});

class SalesReturnNotifiers extends StateNotifier<SalesReturnState> {
  final FetchSalesReturnUsecase fetchSalesReturnUsecase;
  List<SalesListEntity>? salesList;
  DateTime? fromDate;
  DateTime? toDate;

  SalesReturnNotifiers({required this.fetchSalesReturnUsecase})
      : super(SalesReturnState.initial());

  fetchSalesReturn({required SalesParams params}) async {
    state = const SalesReturnState.loading();
    final result = await fetchSalesReturnUsecase.call(params: params);
    result.fold((failure) => state = SalesReturnState.failure(failure.message),
        (salesInvoice) {
      salesList = salesInvoice.salesList;
      return state = SalesReturnState.success(salesInvoice.salesList ?? []);
    });
  }

  void filterSalesInvoice({required SalesInvoiceFilterParams params}) {
    if (params.clearAllFilter) {
      state = SalesReturnState.success(salesList ?? []);
    } else {
      if (salesList == null) return;

      final filteredSales = salesList?.where((sale) {
        final matchesDate = params.salesDate == null ||
            (sale.saleDate != null &&
                sale.saleDate!.toLocal().isAtSameMomentAs(params.salesDate!));

        final matchesMode = params.salesMode == null ||
            (sale.saleMode != null &&
                sale.saleMode!.toLowerCase() ==
                    params.salesMode!.toLowerCase());

        final matchesSoldBy = params.soldBy == null ||
            (sale.soldBy != null &&
                sale.soldBy!.toLowerCase() == params.soldBy!.toLowerCase());

        return matchesDate && matchesMode && matchesSoldBy;
      }).toList();

      state = SalesReturnState.success(filteredSales ?? []);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
