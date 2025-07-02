import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_income_state.freezed.dart';

@freezed
class DownloadIncomeState with _$DownloadIncomeState {
  const factory DownloadIncomeState.initial() = _Initial;
  const factory DownloadIncomeState.loading() = _Loading;
  const factory DownloadIncomeState.downloadCompleted(String pdfPath) =
      _DownloadCompleted;
  const factory DownloadIncomeState.failure(String message) = _Failure;
}
