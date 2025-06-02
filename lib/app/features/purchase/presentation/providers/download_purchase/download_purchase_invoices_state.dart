import 'package:freezed_annotation/freezed_annotation.dart';
part 'download_purchase_invoices_state.freezed.dart';

@freezed
class DownloadPurchaseInvoicesState with _$DownloadPurchaseInvoicesState {
  const factory DownloadPurchaseInvoicesState.initial() = _Initial;
  const factory DownloadPurchaseInvoicesState.loading() = _Loading;
  const factory DownloadPurchaseInvoicesState.downloadCompleted(
      String pdfPath) = _DownloadCompleted;
  const factory DownloadPurchaseInvoicesState.failure(String message) =
      _Failure;
}
