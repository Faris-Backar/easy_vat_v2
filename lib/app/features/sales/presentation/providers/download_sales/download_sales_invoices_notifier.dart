import 'dart:developer';

import 'package:easy_vat_v2/app/features/sales/domain/usecase/sales_invoice/download_sales_invoice.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/download_sales/download_sales_invoices_state.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadSalesInvoiceUsecase = Provider(
  (ref) => DownloadSalesInvoiceUsecase(
      salesInvoiceRepository: ref.read(salesRepositoryProvider)),
);

final downloadsalesInvoiceNotifierProvider = StateNotifierProvider<
    DownloadSalesInvoicesNotifiers, DownloadSalesInvoicesState>((ref) {
  return DownloadSalesInvoicesNotifiers(
    salesInvoiceUsecase: ref.read(downloadSalesInvoiceUsecase),
  );
});

class DownloadSalesInvoicesNotifiers
    extends StateNotifier<DownloadSalesInvoicesState> {
  final DownloadSalesInvoiceUsecase salesInvoiceUsecase;

  DownloadSalesInvoicesNotifiers({required this.salesInvoiceUsecase})
      : super(DownloadSalesInvoicesState.initial());

  downloadSalesInvoices({required String salesIDPK}) async {
    state = DownloadSalesInvoicesState.initial();
    state = DownloadSalesInvoicesState.loading();
    try {
      final result = await salesInvoiceUsecase.call(params: salesIDPK);
      result.fold((l) => state = DownloadSalesInvoicesState.failure(l.message),
          (r) {
        log("downloaded path => $r");
        state = DownloadSalesInvoicesState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadSalesInvoicesState.failure(e.toString());
    }
  }
}
