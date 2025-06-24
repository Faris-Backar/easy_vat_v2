import 'package:easy_vat_v2/app/features/journal/data/model/journal_request_model.dart';
import 'package:easy_vat_v2/app/features/journal/domain/usecase/journal/create_journal_usecase.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/create_journal/create_journal_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal/journal_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createJournalUsecaseProvider = Provider<CreateJournalUsecase>((ref) {
  return CreateJournalUsecase(
      journalRepository: ref.read(journalRepositoryProvider));
});

final createJournalNotifierProvider =
    StateNotifierProvider<CreateJournalNotifier, CreateJournalState>((ref) {
  return CreateJournalNotifier(
      createJournalUsecase: ref.read(createJournalUsecaseProvider));
});

class CreateJournalNotifier extends StateNotifier<CreateJournalState> {
  final CreateJournalUsecase createJournalUsecase;
  CreateJournalNotifier({required this.createJournalUsecase})
      : super(CreateJournalState.initial());

  createJournal({required JournalRequestModel request}) async {
    state = CreateJournalState.initial();
    state = CreateJournalState.loading();
    try {
      final result = await createJournalUsecase.call(params: request);
      result.fold(
          (l) => state = CreateJournalState.failure(l.message),
          (r) => state = CreateJournalState.success(
              r.journalEntry?.first.journalIDPK ?? ""));
    } catch (e) {
      state = CreateJournalState.failure(e.toString());
    }
  }
}
