import 'package:easy_vat_v2/app/features/sales/data/repository/sales_repository_impl.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_invoice_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  return SalesRepositoryImpl();
});

final salesInvoiceNotifierProvider =
    StateNotifierProvider<SalesInoiveNotifiers, SalesInvoiceState>((ref) {
  return SalesInoiveNotifiers(
    salesInvoiceRepository: ref.read(salesRepositoryProvider),
  );
});

class SalesInoiveNotifiers extends StateNotifier<SalesInvoiceState> {
  final SalesRepository salesInvoiceRepository;
  List<SalesInvoiceListEntity>? salesList;
  DateTime? fromDate;
  DateTime? toDate;

  SalesInoiveNotifiers({required this.salesInvoiceRepository})
      : super(SalesInvoiceState.initial());

  fetchSalesInvoice({required SalesParams params}) async {
    state = const SalesInvoiceState.loading();
    final result = await salesInvoiceRepository.getSalesInvoices(
        salesInvoiceRequestParams: params);
    result.fold((failure) => state = SalesInvoiceState.failure(failure.message),
        (salesInvoice) {
      salesList = salesInvoice.salesList;
      double totalAmount = 0.0;
      for (var i = 0; i < (salesInvoice.salesList?.length ?? 0.0); i++) {
        totalAmount += salesInvoice.salesList?[i].netTotal ?? 0.0;
      }
      return state = SalesInvoiceState.success(
          salesInvoice: salesInvoice.salesList ?? [], totalAmount: totalAmount);
    });
  }

  searchSalesInvoice(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (salesList?.length ?? 0.0); i++) {
        totalAmount += salesList?[i].netTotal ?? 0.0;
      }
      state = SalesInvoiceState.success(
          salesInvoice: salesList ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = salesList?.where((invoice) {
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
      state = SalesInvoiceState.success(
          salesInvoice: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
