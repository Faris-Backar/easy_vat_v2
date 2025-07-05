import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_journal_state.freezed.dart';

@freezed
class DownloadJournalState with _$DownloadJournalState {
  const factory DownloadJournalState.initial() = _Initial;
  const factory DownloadJournalState.loading() = _Loading;
  const factory DownloadJournalState.downloadCompleted(String pdfPath) =
      _DownloadCompleted;
  const factory DownloadJournalState.failure(String message) = _Failure;
}
