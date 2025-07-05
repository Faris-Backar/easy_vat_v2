import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_debit_note_state.freezed.dart';

@freezed
class DownloadDebitNoteState with _$DownloadDebitNoteState {
  const factory DownloadDebitNoteState.initial() = _Initial;
  const factory DownloadDebitNoteState.loading() = _Loading;
  const factory DownloadDebitNoteState.downloadCompleted(String pdfPath) =
      _DownloadCompleted;
  const factory DownloadDebitNoteState.failure(String message) = _Failure;
}
