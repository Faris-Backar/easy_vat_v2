import 'package:easy_vat_v2/app/features/sales/data/repository/sales_repository_impl.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/fetch_sales_return/fetch_sales_return_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  return SalesRepositoryImpl();
});

final salesReturnNotifierProvider =
    StateNotifierProvider<SalesReturnNotifiers, FetchSalesReturnState>((ref) {
  return SalesReturnNotifiers(
    salesInvoiceRepository: ref.read(salesRepositoryProvider),
  );
});

class SalesReturnNotifiers extends StateNotifier<FetchSalesReturnState> {
  final SalesRepository salesInvoiceRepository;
  List<SalesReturnEntity>? salesReturnList;
  DateTime? fromDate;
  DateTime? toDate;

  SalesReturnNotifiers({required this.salesInvoiceRepository})
      : super(FetchSalesReturnState.initial());

  fetchSalesReturn({required SalesParams params}) async {
    state = const FetchSalesReturnState.loading();
    final result = await salesInvoiceRepository.getSalesreturn(
        salesReturnRequestParams: params);
    result.fold(
        (failure) => state = FetchSalesReturnState.failure(failure.message),
        (salesReturnList) {
      salesReturnList = salesReturnList;
      double totalAmount = 0.0;
      for (var i = 0; i < (salesReturnList.length); i++) {
        totalAmount += salesReturnList[i].netTotal ?? 0.0;
      }
      return state = FetchSalesReturnState.success(
          salesReturnList: salesReturnList, totalAmount: totalAmount);
    });
  }

  searchSalesReturn(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (salesReturnList?.length ?? 0.0); i++) {
        totalAmount += salesReturnList?[i].netTotal ?? 0.0;
      }
      state = FetchSalesReturnState.success(
          salesReturnList: salesReturnList ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = salesReturnList?.where((invoice) {
            return (invoice.referenceNo?.contains(query) ?? false) ||
                (invoice.customerName
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].netTotal ?? 0.0;
      }
      state = FetchSalesReturnState.success(
          salesReturnList: filteredData, totalAmount: totalAmount);
    }
  }
}
