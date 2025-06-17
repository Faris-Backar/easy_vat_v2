import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_expense_state.freezed.dart';

@freezed
class DownloadExpenseState with _$DownloadExpenseState {
  const factory DownloadExpenseState.initial() = _Initial;
  const factory DownloadExpenseState.loading() = _Loading;
  const factory DownloadExpenseState.downloadCompleted(String pdfPath) =
      _DownloadCompleted;
  const factory DownloadExpenseState.failure(String message) = _Failure;
}
