import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_return_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_return/fetch_purchase_return_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_return/fetch_purchase_return_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _fetchPurchaseReturnUsecaseProvider =
    Provider<FetchPurchaseReturnUsecase>((ref) {
  return FetchPurchaseReturnUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final fetchPurchaseReturnProvider = StateNotifierProvider<
    FetchPurchaseReturnNotifier, FetchPurchaseReturnState>((ref) {
  return FetchPurchaseReturnNotifier(
      fetchPurchaseReturnUsecase:
          ref.read(_fetchPurchaseReturnUsecaseProvider));
});

class FetchPurchaseReturnNotifier
    extends StateNotifier<FetchPurchaseReturnState> {
  final FetchPurchaseReturnUsecase fetchPurchaseReturnUsecase;
  List<PurchaseReturnEntity> purchaseReturnList = [];
  FetchPurchaseReturnNotifier({required this.fetchPurchaseReturnUsecase})
      : super(FetchPurchaseReturnState.initial());

  fetchPurchaseReturn({required PurchaseParams params}) async {
    try {
      state = FetchPurchaseReturnState.loading();
      final result = await fetchPurchaseReturnUsecase.call(params: params);
      result.fold(
          (l) => state = FetchPurchaseReturnState.error(message: l.message),
          (r) {
        purchaseReturnList = r;
        double totalAmount = 0.0;
        for (var i = 0; i < (purchaseReturnList.length); i++) {
          totalAmount += purchaseReturnList[i].netTotal ?? 0.0;
        }
        state = FetchPurchaseReturnState.success(
            purchaseReturnList: r, total: totalAmount);
      });
    } catch (e) {
      state = FetchPurchaseReturnState.error(message: e.toString());
    }
  }

  searchPurchaseReturn(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (purchaseReturnList.length); i++) {
        totalAmount += purchaseReturnList[i].netTotal ?? 0.0;
      }
      state = FetchPurchaseReturnState.success(
          purchaseReturnList: purchaseReturnList, total: totalAmount);
    } else {
      final filteredData = purchaseReturnList.where((invoice) {
        return (invoice.referenceNo
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ??
                false) ||
            (invoice.supplierName
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ??
                false);
      }).toList();
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].netTotal ?? 0.0;
      }
      state = FetchPurchaseReturnState.success(
          purchaseReturnList: filteredData, total: totalAmount);
    }
  }
}
