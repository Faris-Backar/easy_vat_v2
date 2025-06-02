import 'package:easy_vat_v2/app/features/purchase/data/repository/purchase_repository_impl.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/fetch_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_state.dart';

final purchaseRepositoryProvider = Provider<PurchaseRepository>((ref) {
  return PurchaseRepositoryImpl();
});

final fetchPurchaseUsecaseProvider =
    Provider<FetchPurchaseInvoiceUsecase>((ref) {
  return FetchPurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final fetchPurchaseInvoiceProvider =
    StateNotifierProvider<FetchPurchaseNotifier, FetchPurchaseInvoiceState>(
        (ref) {
  return FetchPurchaseNotifier(
      fetchPurchaseUsecase: ref.read(fetchPurchaseUsecaseProvider));
});

class FetchPurchaseNotifier extends StateNotifier<FetchPurchaseInvoiceState> {
  final FetchPurchaseInvoiceUsecase fetchPurchaseUsecase;
  List<PurchaseInvoiceEntity> purchaseInvoiceList = [];
  FetchPurchaseNotifier({required this.fetchPurchaseUsecase})
      : super(FetchPurchaseInvoiceState.initial());

  fetchPurchaseInvoice({required PurchaseParams params}) async {
    try {
      state = FetchPurchaseInvoiceState.loading();
      final result = await fetchPurchaseUsecase.call(params: params);
      result.fold(
          (l) => state = FetchPurchaseInvoiceState.error(message: l.message),
          (r) {
        purchaseInvoiceList = r;
        double totalAmount = 0.0;
        for (var i = 0; i < (purchaseInvoiceList.length); i++) {
          totalAmount += purchaseInvoiceList[i].netTotal ?? 0.0;
        }
        state = FetchPurchaseInvoiceState.success(
            purchaseInvoiceList: r, total: totalAmount);
      });
    } catch (e) {
      state = FetchPurchaseInvoiceState.error(message: e.toString());
    }
  }
}
