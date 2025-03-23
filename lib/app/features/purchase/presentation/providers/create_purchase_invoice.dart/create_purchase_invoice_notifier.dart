import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/create_purchase_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/create_purchase_invoice.dart/create_purchase_invoice_state.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPurchaseUsecaseProvider = Provider<CreatePurchaseUsecase>((ref) {
  return CreatePurchaseUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider));
});

final createPurchaseInvoiceProvider =
    StateNotifierProvider<CreatePurchaseNotifier, CreatePurchaseInvoiceState>(
        (ref) {
  return CreatePurchaseNotifier(
      createPurchaseUsecase: ref.read(createPurchaseUsecaseProvider));
});

class CreatePurchaseNotifier extends StateNotifier<CreatePurchaseInvoiceState> {
  final CreatePurchaseUsecase createPurchaseUsecase;
  CreatePurchaseNotifier({required this.createPurchaseUsecase})
      : super(CreatePurchaseInvoiceState.initial());

  createPurchaseInvoice({required PurchaseRequestModel params}) async {
    try {
      state = CreatePurchaseInvoiceState.loading();
      final result = await createPurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = CreatePurchaseInvoiceState.error(message: l.message),
        (r) =>
            state = CreatePurchaseInvoiceState.loaded(purchaseInvoiceList: r),
      );
    } catch (e) {
      state = CreatePurchaseInvoiceState.error(message: e.toString());
    }
  }

  updatePurchaseInvoice({required PurchaseRequestModel params}) async {
    try {
      state = CreatePurchaseInvoiceState.loading();
      final result = await createPurchaseUsecase.call(params: params);
      result.fold(
        (l) => state = CreatePurchaseInvoiceState.error(message: l.message),
        (r) =>
            state = CreatePurchaseInvoiceState.loaded(purchaseInvoiceList: r),
      );
    } catch (e) {
      state = CreatePurchaseInvoiceState.error(message: e.toString());
    }
  }
}
