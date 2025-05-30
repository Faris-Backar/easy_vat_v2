import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_filter_params.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_return/fetch_sales_return_usecase.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_return/sales_return_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchSalesReturnUsecaseProvider =
    Provider<FetchSalesReturnUsecase>((ref) {
  return FetchSalesReturnUsecase(
      salesReturnRepository: ref.read(salesRepositoryProvider));
});

final salesReturnNotifierProvider =
    StateNotifierProvider<SalesReturnNotifiers, SalesReturnState>((ref) {
  return SalesReturnNotifiers(
    fetchSalesReturnUsecase: ref.read(fetchSalesReturnUsecaseProvider),
  );
});

class SalesReturnNotifiers extends StateNotifier<SalesReturnState> {
  final FetchSalesReturnUsecase fetchSalesReturnUsecase;
  List<SalesReturnEntity>? salesList;
  DateTime? fromDate;
  DateTime? toDate;

  SalesReturnNotifiers({required this.fetchSalesReturnUsecase})
      : super(SalesReturnState.initial());

  fetchSalesReturn({required SalesParams params}) async {
    state = const SalesReturnState.loading();
    final result = await fetchSalesReturnUsecase.call(params: params);
    result.fold((failure) => state = SalesReturnState.failure(failure.message),
        (salesReturn) {
      salesList = salesReturn;
      return state = SalesReturnState.success(salesReturn);
    });
  }

  void filterSalesReturn({required SalesInvoiceFilterParams params}) {
    // if (params.clearAllFilter) {
    //   state = SalesReturnState.success(salesList?.returnedItems ?? []);
    // } else {
    //   if (salesList == null) return;

    //   final filteredSales = salesList?.returnedItems?.where((sale) {
    //     final matchesDate = params.salesDate == null ||
    //         (salesList?.returnDate != null &&
    //             salesList!.returnDate!
    //                 .toLocal()
    //                 .isAtSameMomentAs(params.salesDate!));

    //     final matchesMode = params.salesMode == null ||
    //         (salesList?.salesReturnMode != null &&
    //             salesList?.salesReturnMode!.toLowerCase() ==
    //                 params.salesMode!.toLowerCase());

    //     final matchesSoldBy = params.soldBy == null ||
    //         (salesList?.authorizedById != null &&
    //             salesList?.authorizedById!.toLowerCase() ==
    //                 params.soldBy!.toLowerCase());

    //     return matchesDate && matchesMode && matchesSoldBy;
    //   }).toList();

    state = SalesReturnState.success([]);
    // }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
