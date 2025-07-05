import 'package:easy_vat_v2/app/features/credit_note/data/repository/credit_note_repository_impl.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_entry_entity.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/repositories/credit_note_repository.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/params/credit_note_params.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note/credit_note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final creditNoteRepositoryProvider = Provider<CreditNoteRepository>((ref) {
  return CreditNoteRepositoryImpl();
});

final creditNoteNotifierProvider =
    StateNotifierProvider<CreditNoteNotifiers, CreditNoteState>((ref) {
  return CreditNoteNotifiers(
      creditNoteRepository: ref.read(creditNoteRepositoryProvider));
});

class CreditNoteNotifiers extends StateNotifier<CreditNoteState> {
  final CreditNoteRepository creditNoteRepository;
  List<CreditNoteEntryEntity>? creditNoteEntry;
  DateTime? fromDate;
  DateTime? toDate;

  CreditNoteNotifiers({required this.creditNoteRepository})
      : super(CreditNoteState.initial());

  fetchCreditNote({required CreditNoteParams params}) async {
    state = const CreditNoteState.loading();
    final result = await creditNoteRepository.getCreditNoteEntry(
        creditNoteRequestParams: params);
    result.fold((failure) => state = CreditNoteState.failure(failure.message),
        (creditNote) {
      creditNoteEntry = creditNote.creditNoteEntry;
      double totalAmount = 0.0;
      for (var i = 0; i < (creditNote.creditNoteEntry?.length ?? 0); i++) {
        totalAmount += creditNote.creditNoteEntry?[i].totalAmount ?? 0.0;
      }
      return state = CreditNoteState.success(
          creditNote: creditNote.creditNoteEntry ?? [],
          totalAmount: totalAmount);
    });
  }

  searchCreditNote(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (creditNoteEntry?.length ?? 0.0); i++) {
        totalAmount += creditNoteEntry?[i].totalAmount ?? 0.0;
      }
      state = CreditNoteState.success(
          creditNote: creditNoteEntry ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = creditNoteEntry?.where((creditNote) {
            return (creditNote.referenceNo?.contains(query) ?? false) ||
                (creditNote.customerName
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].totalAmount ?? 0.0;
      }
      state = CreditNoteState.success(
          creditNote: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
