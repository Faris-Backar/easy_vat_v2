import 'package:easy_vat_v2/app/features/journal/data/repository/journal_repository_impl.dart';
import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_entity.dart';
import 'package:easy_vat_v2/app/features/journal/domain/repositories/journal_repository.dart';
import 'package:easy_vat_v2/app/features/journal/domain/usecase/params/journal_params.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal/journal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final journalRepositoryProvider = Provider<JournalRepository>((ref) {
  return JournalRepositoryImpl();
});

final journalNotifierProvider =
    StateNotifierProvider<JournalNotifiers, JournalState>((ref) {
  return JournalNotifiers(
      journalRepository: ref.read(journalRepositoryProvider));
});

class JournalNotifiers extends StateNotifier<JournalState> {
  final JournalRepository journalRepository;
  List<JournalEntryEntity>? journalList;
  DateTime? fromDate;
  DateTime? toDate;

  JournalNotifiers({required this.journalRepository})
      : super(JournalState.initial());

  fetchJournal({required JournalParams params}) async {
    state = const JournalState.loading();
    final result =
        await journalRepository.getJournal(journalRequestParams: params);
    result.fold((failure) => state = JournalState.failure(failure.message),
        (journal) {
      journalList = journal.journalEntry;
      double totalAmount = 0.0;
      for (var i = 0; i < (journal.journalEntry?.length ?? 0); i++) {
        totalAmount += journal.journalEntry?[i].totalAmount ?? 0.0;
      }
      return state = JournalState.success(
          journal: journal.journalEntry ?? [], totalAmount: totalAmount);
    });
  }

  searchJournal(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (journalList?.length ?? 0.0); i++) {
        totalAmount += journalList?[i].totalAmount ?? 0.0;
      }
      state = JournalState.success(
          journal: journalList ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = journalList?.where((journal) {
            return (journal.referenceNo?.contains(query) ?? false) ||
                (journal.entryMode
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].totalAmount ?? 0.0;
      }
      state =
          JournalState.success(journal: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
