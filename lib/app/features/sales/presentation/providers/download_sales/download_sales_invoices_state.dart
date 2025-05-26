import 'package:freezed_annotation/freezed_annotation.dart';
part 'download_sales_invoices_state.freezed.dart';

@freezed
class DownloadSalesInvoicesState with _$DownloadSalesInvoicesState {
  const factory DownloadSalesInvoicesState.initial() = _Initial;
  const factory DownloadSalesInvoicesState.loading() = _Loading;
  const factory DownloadSalesInvoicesState.downloadCompleted(String pdfPath) =
      _DownloadCompleted;
  const factory DownloadSalesInvoicesState.failure(String message) = _Failure;
}
