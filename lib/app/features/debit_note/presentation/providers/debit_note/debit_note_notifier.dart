import 'package:easy_vat_v2/app/features/debit_note/data/repository/debit_note_repository_impl.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/repositories/debit_note_repository.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/params/debit_note_params.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note/debit_note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final debitNoteRepositoryProvider = Provider<DebitNoteRepository>((ref) {
  return DebitNoteRepositoryImpl();
});

final debitNoteNotifierProvider =
    StateNotifierProvider<DebitNoteNotifiers, DebitNoteState>((ref) {
  return DebitNoteNotifiers(
      debitNoteRepository: ref.read(debitNoteRepositoryProvider));
});

class DebitNoteNotifiers extends StateNotifier<DebitNoteState> {
  final DebitNoteRepository debitNoteRepository;
  List<DebitNoteEntryEntity>? debitNoteEntry;
  DateTime? fromDate;
  DateTime? toDate;

  DebitNoteNotifiers({required this.debitNoteRepository})
      : super(DebitNoteState.initial());

  fetchDebitNote({required DebitNoteParams params}) async {
    state = const DebitNoteState.loading();
    final result = await debitNoteRepository.getDebitNoteEntry(
        debitNoteRequestParams: params);
    result.fold((failure) => state = DebitNoteState.failure(failure.message),
        (debitNote) {
      debitNoteEntry = debitNote.debitNoteEntry;
      double totalAmount = 0.0;
      for (var i = 0; i < (debitNote.debitNoteEntry?.length ?? 0); i++) {
        totalAmount += debitNote.debitNoteEntry?[i].totalAmount ?? 0.0;
      }
      return state = DebitNoteState.success(
          debitNote: debitNote.debitNoteEntry ?? [], totalAmount: totalAmount);
    });
  }

  searchDebitNote(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (debitNoteEntry?.length ?? 0.0); i++) {
        totalAmount += debitNoteEntry?[i].totalAmount ?? 0.0;
      }
      state = DebitNoteState.success(
          debitNote: debitNoteEntry ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = debitNoteEntry?.where((debitNote) {
            return (debitNote.referenceNo?.contains(query) ?? false) ||
                (debitNote.supplierName
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].totalAmount ?? 0.0;
      }
      state = DebitNoteState.success(
          debitNote: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
