import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_quotation_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_sales_quotation_state.dart';
part 'fetch_sales_quotation.freezed.dart';

final salesQuotationNotifierProvider =
    StateNotifierProvider<SalesQuotationNotifiers, FetchSalesQuotationState>(
        (ref) {
  return SalesQuotationNotifiers(
    salesRepository: ref.read(salesRepositoryProvider),
  );
});

class SalesQuotationNotifiers extends StateNotifier<FetchSalesQuotationState> {
  final SalesRepository salesRepository;
  List<SalesQuotationEntity>? salesQuotationList;

  SalesQuotationNotifiers({required this.salesRepository})
      : super(FetchSalesQuotationState.initial());

  fetchSalesQuotation({required SalesParams params}) async {
    state = const FetchSalesQuotationState.loading();
    final result =
        await salesRepository.getSalesQuotation(salesQuotationRequest: params);
    result.fold(
        (failure) => state = FetchSalesQuotationState.failure(failure.message),
        (salesQuotationList) {
      salesQuotationList = salesQuotationList;
      double totalAmount = 0.0;
      for (var i = 0; i < (salesQuotationList.length); i++) {
        totalAmount += salesQuotationList[i].grossTotal ?? 0.0;
      }
      return state = FetchSalesQuotationState.success(
          salesQuotationList: salesQuotationList, totalAmount: totalAmount);
    });
  }

  searchSalesReturn(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (salesQuotationList?.length ?? 0.0); i++) {
        totalAmount += salesQuotationList?[i].grossTotal ?? 0.0;
      }
      state = FetchSalesQuotationState.success(
          salesQuotationList: salesQuotationList ?? [],
          totalAmount: totalAmount);
    } else {
      final filteredData = salesQuotationList?.where((invoice) {
            return (invoice.referenceNo?.contains(query) ?? false) ||
                (invoice.customerIdpk
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].grossTotal ?? 0.0;
      }
      state = FetchSalesQuotationState.success(
          salesQuotationList: filteredData, totalAmount: totalAmount);
    }
  }
}
