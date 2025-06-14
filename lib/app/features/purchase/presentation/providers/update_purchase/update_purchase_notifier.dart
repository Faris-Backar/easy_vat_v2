import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_return_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/update_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_return/update_purchase_return_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/update_purchase/update_purchase_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updatePurchaseUsecaseProvider =
    Provider<UpdatePurchaseInvoiceUsecase>((ref) {
  return UpdatePurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final updatePurchaseReturnUsecaseProvider =
    Provider<UpdatePurchaseReturnUsecase>((ref) {
  return UpdatePurchaseReturnUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

// final updatePurchaseOrderUsecaseProvider =
//     Provider<UpdatePurchaseOrderUsecase>((ref) {
//   return UpdatePurchaseOrderUsecase(
//       purchaseRepository: ref.read(purchaseRepositoryProvider));
// });

final updatePurchaseProvider =
    StateNotifierProvider<UpdatePurchaseNotifier, UpdatePurchaseState>((ref) {
  return UpdatePurchaseNotifier(
      updatePurchaseUsecase: ref.read(updatePurchaseUsecaseProvider),
      updatePurchaseReturnUsecase:
          ref.read(updatePurchaseReturnUsecaseProvider));
});

class UpdatePurchaseNotifier extends StateNotifier<UpdatePurchaseState> {
  final UpdatePurchaseInvoiceUsecase updatePurchaseUsecase;
  final UpdatePurchaseReturnUsecase updatePurchaseReturnUsecase;
  UpdatePurchaseNotifier({
    required this.updatePurchaseUsecase,
    required this.updatePurchaseReturnUsecase,
  }) : super(UpdatePurchaseState.initial());

  updatePurchaseInvoice({required PurchaseInvoiceModel params}) async {
    try {
      state = UpdatePurchaseState.loading();
      final result = await updatePurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = UpdatePurchaseState.error(message: l.message),
        (r) => state = UpdatePurchaseState.loaded(
            purchaseIDPK: r.purchaseIdpk ?? "",
            supplierName: r.supplierName ?? ""),
      );
    } catch (e) {
      state = UpdatePurchaseState.error(message: e.toString());
    }
  }

  updatePurchaseReturn({required PurchaseReturnModel params}) async {
    try {
      state = UpdatePurchaseState.loading();
      final result = await updatePurchaseReturnUsecase.call(params: params);
      result.fold(
        (l) => state = UpdatePurchaseState.error(message: l.message),
        (r) => state = UpdatePurchaseState.loaded(
            purchaseIDPK: r.purchaseIDFK ?? "",
            supplierName: r.supplierName ?? ""),
      );
    } catch (e) {
      state = UpdatePurchaseState.error(message: e.toString());
    }
  }
}
