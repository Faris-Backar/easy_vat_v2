import 'package:easy_vat_v2/app/features/sales/data/repository/sales_repository_impl.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_filter_params.dart';
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
      return state = SalesInvoiceState.success(salesInvoice.salesList ?? []);
    });
  }

  void filterSalesInvoice({required SalesInvoiceFilterParams params}) {
    if (params.clearAllFilter) {
      state = SalesInvoiceState.success(salesList ?? []);
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

      state = SalesInvoiceState.success(filteredSales ?? []);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
