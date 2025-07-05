import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_contra_state.freezed.dart';

@freezed
class DownloadContraState with _$DownloadContraState {
  const factory DownloadContraState.initial() = _Initial;
  const factory DownloadContraState.loading() = _Loading;
  const factory DownloadContraState.downloadCompleted(String pdfPath) =
      _DownloadCompleted;
  const factory DownloadContraState.failure(String message) = _Failure;
}
