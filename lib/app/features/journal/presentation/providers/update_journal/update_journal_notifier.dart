import 'package:easy_vat_v2/app/features/journal/data/model/journal_request_model.dart';
import 'package:easy_vat_v2/app/features/journal/domain/usecase/journal/update_journal_usecase.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal/journal_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/update_journal/update_journal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateJournalUsecaseProvider = Provider<UpdateJournalUsecase>((ref) {
  return UpdateJournalUsecase(
      journalRepository: ref.read(journalRepositoryProvider));
});

final updateJournalNotifierProvider =
    StateNotifierProvider<UpdateJournalNotifier, UpdateJournalState>((ref) {
  return UpdateJournalNotifier(
      updateJournalUsecase: ref.read(updateJournalUsecaseProvider));
});

class UpdateJournalNotifier extends StateNotifier<UpdateJournalState> {
  final UpdateJournalUsecase updateJournalUsecase;

  UpdateJournalNotifier({required this.updateJournalUsecase})
      : super(UpdateJournalState.initial());

  updateJournal({required JournalRequestModel request}) async {
    state = UpdateJournalState.initial();
    state = UpdateJournalState.loading();
    try {
      final result = await updateJournalUsecase.call(params: request);

      result.fold((l) => state = UpdateJournalState.failure(l.message),
          (r) => state = UpdateJournalState.success());
    } catch (e) {
      state = UpdateJournalState.failure(e.toString());
    }
  }
}
