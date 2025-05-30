import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/update_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_order/update_purchase_order_usecase.dart';
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

final updatePurchaseOrderUsecaseProvider =
    Provider<UpdatePurchaseOrderUsecase>((ref) {
  return UpdatePurchaseOrderUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final updatePurchaseProvider =
    StateNotifierProvider<UpdatePurchaseNotifier, UpdatePurchaseState>((ref) {
  return UpdatePurchaseNotifier(
    updatePurchaseUsecase: ref.read(updatePurchaseUsecaseProvider),
    updatePurchaseReturnUsecase: ref.read(updatePurchaseReturnUsecaseProvider),
    updatePurchaseOrderUsecase: ref.read(updatePurchaseOrderUsecaseProvider),
  );
});

class UpdatePurchaseNotifier extends StateNotifier<UpdatePurchaseState> {
  final UpdatePurchaseInvoiceUsecase updatePurchaseUsecase;
  final UpdatePurchaseReturnUsecase updatePurchaseReturnUsecase;
  final UpdatePurchaseOrderUsecase updatePurchaseOrderUsecase;
  UpdatePurchaseNotifier({
    required this.updatePurchaseUsecase,
    required this.updatePurchaseReturnUsecase,
    required this.updatePurchaseOrderUsecase,
  }) : super(UpdatePurchaseState.initial());

  updatePurchaseInvoice({required PurchaseRequestModel params}) async {
    try {
      state = UpdatePurchaseState.loading();
      final result = await updatePurchaseInvoice.call(params: params);
      result.fold(
        (l) => state = UpdatePurchaseState.error(message: l.message),
        (r) => state = UpdatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = UpdatePurchaseState.error(message: e.toString());
    }
  }

  updatePurchaseOrder({required PurchaseRequestModel params}) async {
    try {
      state = UpdatePurchaseState.loading();
      final result = await updatePurchaseOrderUsecase.call(params: params);
      result.fold(
        (l) => state = UpdatePurchaseState.error(message: l.message),
        (r) => state = UpdatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = UpdatePurchaseState.error(message: e.toString());
    }
  }

  updatePurchaseReturn({required PurchaseRequestModel params}) async {
    try {
      state = UpdatePurchaseState.loading();
      final result = await updatePurchaseReturn.call(params: params);
      result.fold(
        (l) => state = UpdatePurchaseState.error(message: l.message),
        (r) => state = UpdatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = UpdatePurchaseState.error(message: e.toString());
    }
  }
}
