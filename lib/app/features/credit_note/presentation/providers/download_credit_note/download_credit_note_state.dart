import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_credit_note_state.freezed.dart';

@freezed
class DownloadCreditNoteState with _$DownloadCreditNoteState {
  const factory DownloadCreditNoteState.initial() = _Initial;
  const factory DownloadCreditNoteState.loading() = _Loading;
  const factory DownloadCreditNoteState.downloadCompleted(String pdfPath) =
      _DownloadCompleted;
  const factory DownloadCreditNoteState.failure(String message) = _Failure;
}
