import 'package:easy_vat_v2/app/features/journal/domain/usecase/journal/download_journal_usecase.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/download_journal/download_journal_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal/journal_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadJournalUsecase = Provider((ref) => DownloadJournalUsecase(
    journalRepository: ref.read(journalRepositoryProvider)));

final downloadJournalNotifierProvider =
    StateNotifierProvider<DownloadJournalNotifiers, DownloadJournalState>(
        (ref) {
  return DownloadJournalNotifiers(
      journalUsecase: ref.read(downloadJournalUsecase));
});

class DownloadJournalNotifiers extends StateNotifier<DownloadJournalState> {
  final DownloadJournalUsecase journalUsecase;

  DownloadJournalNotifiers({required this.journalUsecase})
      : super(DownloadJournalState.initial());

  downloadJournal({required String journalIDPK}) async {
    state = DownloadJournalState.initial();
    state = DownloadJournalState.loading();
    try {
      final result = await journalUsecase.call(params: journalIDPK);
      result.fold((l) => state = DownloadJournalState.failure(l.message), (r) {
        state = DownloadJournalState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadJournalState.failure(e.toString());
    }
  }
}
