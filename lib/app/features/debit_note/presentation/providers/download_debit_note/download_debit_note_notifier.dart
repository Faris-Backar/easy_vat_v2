import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/debit_note/download_debit_note_usecase.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note/debit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/download_debit_note/download_debit_note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadDebitNoteUsecase = Provider((ref) => DownloadDebitNoteUsecase(
    debitNoteRepository: ref.read(debitNoteRepositoryProvider)));

final downloadDebitNoteNotifierProvider =
    StateNotifierProvider<DownloadDebitNoteNotifiers, DownloadDebitNoteState>(
        (ref) {
  return DownloadDebitNoteNotifiers(
      debitNoteUsecase: ref.read(downloadDebitNoteUsecase));
});

class DownloadDebitNoteNotifiers extends StateNotifier<DownloadDebitNoteState> {
  final DownloadDebitNoteUsecase debitNoteUsecase;

  DownloadDebitNoteNotifiers({required this.debitNoteUsecase})
      : super(DownloadDebitNoteState.initial());

  downloadDebitNote({required String debitNoteIDPK}) async {
    state = DownloadDebitNoteState.initial();
    state = DownloadDebitNoteState.loading();
    try {
      final result = await debitNoteUsecase.call(params: debitNoteIDPK);
      result.fold((l) => state = DownloadDebitNoteState.failure(l.message),
          (r) {
        state = DownloadDebitNoteState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadDebitNoteState.failure(e.toString());
    }
  }
}
