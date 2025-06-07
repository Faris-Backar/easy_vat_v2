import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_return_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_invoice/create_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/purchase_return/create_purchase_return_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/create_purchase/create_purchase_invoice_state.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPurchaseUsecaseProvider =
    Provider<CreatePurchaseInvoiceUsecase>((ref) {
  return CreatePurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final createPurchaseReturnUsecaseProvider =
    Provider<CreatePurchaseReturnUsecase>((ref) {
  return CreatePurchaseReturnUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final createPurchaseProvider =
    StateNotifierProvider<CreatePurchaseNotifier, CreatePurchaseState>((ref) {
  return CreatePurchaseNotifier(
    createPurchaseUsecase: ref.read(createPurchaseUsecaseProvider),
    createPurchaseReturnUsecase: ref.read(createPurchaseReturnUsecaseProvider),
  );
});

class CreatePurchaseNotifier extends StateNotifier<CreatePurchaseState> {
  final CreatePurchaseInvoiceUsecase createPurchaseUsecase;
  final CreatePurchaseReturnUsecase createPurchaseReturnUsecase;
  CreatePurchaseNotifier({
    required this.createPurchaseUsecase,
    required this.createPurchaseReturnUsecase,
  }) : super(CreatePurchaseState.initial());

  createPurchaseInvoice(PurchaseInvoiceModel purchaseInvoiceRequest) async {
    try {
      state = CreatePurchaseState.loading();
      final result =
          await createPurchaseUsecase.call(params: purchaseInvoiceRequest);
      result.fold(
        (l) => state = CreatePurchaseState.error(message: l.message),
        (r) => state = CreatePurchaseState.loaded(
            purchaseIDPK: r.purchaseIdpk ?? "", supplierName: r.supplierName),
      );
    } catch (e) {
      state = CreatePurchaseState.error(message: e.toString());
    }
  }

  createPurchaseOrder({required PurchaseRequestModel params}) async {
    // try {
    //   state = CreatePurchaseState.loading();
    //   final result = await createPurchaseReturnUsecase.call(params: params);
    //   result.fold(
    //     (l) => state = CreatePurchaseState.error(message: l.message),
    //     (r) => state = CreatePurchaseState.loaded(
    //         purchaseIDPK: "", supplierName: r.supplierName),
    //   );
    // } catch (e) {
    //   state = CreatePurchaseState.error(message: e.toString());
    // }
  }

  createPurchaseReturn(PurchaseReturnModel purchaseInvoiceRequest) async {
    try {
      state = CreatePurchaseState.loading();
      final result = await createPurchaseReturnUsecase.call(
          params: purchaseInvoiceRequest);
      result.fold(
        (l) => state = CreatePurchaseState.error(message: l.message),
        (r) => state = CreatePurchaseState.loaded(
            purchaseIDPK: r.purchaseIDFK ?? "",
            supplierName: r.supplierName ?? ""),
      );
    } catch (e) {
      state = CreatePurchaseState.error(message: e.toString());
    }
  }
}
