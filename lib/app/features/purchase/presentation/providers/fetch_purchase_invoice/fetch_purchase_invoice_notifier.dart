import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/purchase/data/repository/purchase_repository_impl.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/purchase/domain/usecase/fetch_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_state.dart';

final purchaseRepositoryProvider = Provider<PurchaseRepository>((ref) {
  return PurchaseRepositoryImpl();
});

final fetchPurchaseUsecaseProvider = Provider<FetchPurchaseUsecase>((ref) {
  return FetchPurchaseUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final fetchPurchaseInvoiceProvider =
    StateNotifierProvider<FetchPurchaseNotifier, FetchPurchaseInvoiceState>(
        (ref) {
  return FetchPurchaseNotifier(
      fetchPurchaseUsecase: ref.read(fetchPurchaseUsecaseProvider));
});

class FetchPurchaseNotifier extends StateNotifier<FetchPurchaseInvoiceState> {
  final FetchPurchaseUsecase fetchPurchaseUsecase;
  FetchPurchaseNotifier({required this.fetchPurchaseUsecase})
      : super(FetchPurchaseInvoiceState.initial());

  fetchPurchaseInvoice() async {
    try {
      state = FetchPurchaseInvoiceState.loading();
      final result = await fetchPurchaseUsecase.call(params: NoParams());
      result.fold(
        (l) => state = FetchPurchaseInvoiceState.error(message: l.message),
        (r) => state = FetchPurchaseInvoiceState.loaded(purchaseInvoiceList: r),
      );
    } catch (e) {
      state = FetchPurchaseInvoiceState.error(message: e.toString());
    }
  }
}
