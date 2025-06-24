import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/credit_note/download_credit_note_usecase.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note/credit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/download_credit_note/download_credit_note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadCreditNoteUsecase = Provider((ref) => DownloadCreditNoteUsecase(
    creditNoteRepository: ref.read(creditNoteRepositoryProvider)));

final downloadCreditNoteNotifierProvider =
    StateNotifierProvider<DownloadCreditNoteNotifiers, DownloadCreditNoteState>(
        (ref) {
  return DownloadCreditNoteNotifiers(
      creditNoteUsecase: ref.read(downloadCreditNoteUsecase));
});

class DownloadCreditNoteNotifiers
    extends StateNotifier<DownloadCreditNoteState> {
  final DownloadCreditNoteUsecase creditNoteUsecase;

  DownloadCreditNoteNotifiers({required this.creditNoteUsecase})
      : super(DownloadCreditNoteState.initial());

  downloadCreditNote({required String creditNoteIDPK}) async {
    state = DownloadCreditNoteState.initial();
    state = DownloadCreditNoteState.loading();
    try {
      final result = await creditNoteUsecase.call(params: creditNoteIDPK);
      result.fold((l) => state = DownloadCreditNoteState.failure(l.message),
          (r) {
        state = DownloadCreditNoteState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadCreditNoteState.failure(e.toString());
    }
  }
}
