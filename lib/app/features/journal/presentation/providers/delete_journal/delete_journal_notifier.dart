import 'package:easy_vat_v2/app/features/journal/domain/usecase/journal/delete_journal_usecase.dart';
import 'package:easy_vat_v2/app/features/journal/domain/usecase/params/journal_params.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/delete_journal/delete_journal_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal/journal_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteJournalUsecase = Provider<DeleteJournalUsecase>((ref) {
  return DeleteJournalUsecase(
      journalRepository: ref.read(journalRepositoryProvider));
});

final deleteJournalNotifierProvider =
    StateNotifierProvider<DeleteJournalNotifier, DeleteJournalState>((ref) {
  return DeleteJournalNotifier(
      deleteJournalUsecase: ref.read(deleteJournalUsecase));
});

class DeleteJournalNotifier extends StateNotifier<DeleteJournalState> {
  final DeleteJournalUsecase deleteJournalUsecase;

  DeleteJournalNotifier({required this.deleteJournalUsecase})
      : super(DeleteJournalState.initial());

  deleteJournal({required JournalParams request}) async {
    state = DeleteJournalState.initial();
    state = DeleteJournalState.loading();
    try {
      final result = await deleteJournalUsecase.call(params: request);

      result.fold((l) => state = DeleteJournalState.failure(l.message),
          (r) => state = DeleteJournalState.success());
    } catch (e) {
      state = DeleteJournalState.failure(e.toString());
    }
  }
}
