import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/delete_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/delete_purchase/delete_purchase_state.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deletePurchaseInvoiceUsecaseProvider =
    Provider<DeletePurchaseInvoiceUsecase>((ref) {
  return DeletePurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final deletePurchaseProvider =
    StateNotifierProvider<DeletePurchaseNotifier, DeletePurchaseState>((ref) {
  return DeletePurchaseNotifier(
    deletePurchaseInvoiceUsecase:
        ref.read(deletePurchaseInvoiceUsecaseProvider),
  );
});

class DeletePurchaseNotifier extends StateNotifier<DeletePurchaseState> {
  final DeletePurchaseInvoiceUsecase deletePurchaseInvoiceUsecase;
  DeletePurchaseNotifier({
    required this.deletePurchaseInvoiceUsecase,
  }) : super(DeletePurchaseState.initial());

  deletePurchaseInvoice({required PurchaseParams params}) async {
    try {
      state = DeletePurchaseState.loading();
      final result = await deletePurchaseInvoiceUsecase.call(params: params);
      result.fold(
        (l) => state = DeletePurchaseState.error(message: l.message),
        (r) => state = DeletePurchaseState.loaded(),
      );
    } catch (e) {
      state = DeletePurchaseState.error(message: e.toString());
    }
  }

  // deletePurchaseOrder({required PurchaseRequestModel params}) async {
  //   try {
  //     state = DeletePurchaseState.loading();
  //     final result = await deletePurchaseReturnUsecase.call(params: params);
  //     result.fold(
  //       (l) => state = DeletePurchaseState.error(message: l.message),
  //       (r) => state = DeletePurchaseState.loaded(purchaseRequestModel: r),
  //     );
  //   } catch (e) {
  //     state = DeletePurchaseState.error(message: e.toString());
  //   }
  // }

  // deletePurchaseReturn({required PurchaseRequestModel params}) async {
  //   try {
  //     state = DeletePurchaseState.loading();
  //     final result = await deletePurchaseReturnUsecase.call(params: params);
  //     result.fold(
  //       (l) => state = DeletePurchaseState.error(message: l.message),
  //       (r) => state = DeletePurchaseState.loaded(purchaseRequestModel: r),
  //     );
  //   } catch (e) {
  //     state = DeletePurchaseState.error(message: e.toString());
  //   }
  // }
}
