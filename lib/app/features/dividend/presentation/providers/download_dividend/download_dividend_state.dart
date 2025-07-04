import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_dividend_state.freezed.dart';

@freezed
class DownloadDividendState with _$DownloadDividendState {
  const factory DownloadDividendState.initial() = _Initial;
  const factory DownloadDividendState.loading() = _Loading;
  const factory DownloadDividendState.downloadCompleted(String pdfPath) =
      _DownloadCompleted;
  const factory DownloadDividendState.failure(String message) = _Failure;
}
