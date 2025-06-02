import 'package:easy_vat_v2/app/features/purchase/domain/usecase/download_purchase_invoice_usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/download_purchase/download_purchase_invoices_state.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadPurchaseInvoiceUsecase = Provider(
  (ref) => DownloadPurchaseInvoiceUsecase(
      purchaseRepository: ref.read(purchaseRepositoryProvider)),
);

final downloadPurchaseInvoiceNotifierProvider = StateNotifierProvider<
    DownloadPurchaseInvoicesNotifiers, DownloadPurchaseInvoicesState>((ref) {
  return DownloadPurchaseInvoicesNotifiers(
    purchaseInvoiceUsecase: ref.read(downloadPurchaseInvoiceUsecase),
  );
});

class DownloadPurchaseInvoicesNotifiers
    extends StateNotifier<DownloadPurchaseInvoicesState> {
  final DownloadPurchaseInvoiceUsecase purchaseInvoiceUsecase;

  DownloadPurchaseInvoicesNotifiers({required this.purchaseInvoiceUsecase})
      : super(DownloadPurchaseInvoicesState.initial());

  downloadPurchaseInvoices({required String salesIDPK}) async {
    state = DownloadPurchaseInvoicesState.initial();
    state = DownloadPurchaseInvoicesState.loading();
    try {
      final result = await purchaseInvoiceUsecase.call(params: salesIDPK);
      result.fold(
          (l) => state = DownloadPurchaseInvoicesState.failure(l.message), (r) {
        state = DownloadPurchaseInvoicesState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadPurchaseInvoicesState.failure(e.toString());
    }
  }
}
