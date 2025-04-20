import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/create_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/delete_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/update_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/create_purchase_invoice.dart/create_purchase_invoice_state.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPurchaseUsecaseProvider =
    Provider<CreatePurchaseInvoiceUsecase>((ref) {
  return CreatePurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final deletePurchaseUsecaseProvider =
    Provider<DeletePurchaseInvoiceUsecase>((ref) {
  return DeletePurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final updatePurchaseUsecaseProvider =
    Provider<UpdatePurchaseInvoiceUsecase>((ref) {
  return UpdatePurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final createPurchaseProvider =
    StateNotifierProvider<CreatePurchaseNotifier, CreatePurchaseState>((ref) {
  return CreatePurchaseNotifier(
      createPurchaseUsecase: ref.read(createPurchaseUsecaseProvider),
      updatePurchaseUsecase: ref.read(updatePurchaseUsecaseProvider),
      deletePurchaseUsecase: ref.read(deletePurchaseUsecaseProvider));
});

class CreatePurchaseNotifier extends StateNotifier<CreatePurchaseState> {
  final CreatePurchaseInvoiceUsecase createPurchaseUsecase;
  final UpdatePurchaseInvoiceUsecase updatePurchaseUsecase;
  final DeletePurchaseInvoiceUsecase deletePurchaseUsecase;
  CreatePurchaseNotifier(
      {required this.createPurchaseUsecase,
      required this.updatePurchaseUsecase,
      required this.deletePurchaseUsecase})
      : super(CreatePurchaseState.initial());

  createPurchaseInvoice({required PurchaseRequestModel params}) async {
    try {
      state = CreatePurchaseState.loading();
      final result = await createPurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = CreatePurchaseState.error(message: l.message),
        (r) => state = CreatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = CreatePurchaseState.error(message: e.toString());
    }
  }

  updatePurchaseInvoice({required PurchaseRequestModel params}) async {
    try {
      state = CreatePurchaseState.loading();
      final result = await deletePurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = CreatePurchaseState.error(message: l.message),
        (r) => state = CreatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = CreatePurchaseState.error(message: e.toString());
    }
  }

  deletePurchaseInvoice({required PurchaseRequestModel params}) async {
    try {
      state = CreatePurchaseState.loading();
      final result = await createPurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = CreatePurchaseState.error(message: l.message),
        (r) => state = CreatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = CreatePurchaseState.error(message: e.toString());
    }
  }

  createPurchaseOrder({required PurchaseRequestModel params}) async {
    try {
      state = CreatePurchaseState.loading();
      final result = await createPurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = CreatePurchaseState.error(message: l.message),
        (r) => state = CreatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = CreatePurchaseState.error(message: e.toString());
    }
  }

  updatePurchaseOrder({required PurchaseRequestModel params}) async {
    try {
      state = CreatePurchaseState.loading();
      final result = await deletePurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = CreatePurchaseState.error(message: l.message),
        (r) => state = CreatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = CreatePurchaseState.error(message: e.toString());
    }
  }

  deletePurchaseOrder({required PurchaseRequestModel params}) async {
    try {
      state = CreatePurchaseState.loading();
      final result = await createPurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = CreatePurchaseState.error(message: l.message),
        (r) => state = CreatePurchaseState.loaded(purchaseRequestModel: r),
      );
    } catch (e) {
      state = CreatePurchaseState.error(message: e.toString());
    }
  }
}
