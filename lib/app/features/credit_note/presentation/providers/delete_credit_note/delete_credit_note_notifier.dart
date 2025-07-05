import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/credit_note/delete_credit_note_usecase.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/params/credit_note_params.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note/credit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/delete_credit_note/delete_credit_note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteCreditNoteUsecase = Provider<DeleteCreditNoteUsecase>((ref) {
  return DeleteCreditNoteUsecase(
      creditNoteRepository: ref.read(creditNoteRepositoryProvider));
});

final deleteCreditNoteNotifierProvider =
    StateNotifierProvider<DeleteCreditNoteNotifier, DeleteCreditNoteState>(
        (ref) {
  return DeleteCreditNoteNotifier(
      deleteCreditNoteUsecase: ref.read(deleteCreditNoteUsecase));
});

class DeleteCreditNoteNotifier extends StateNotifier<DeleteCreditNoteState> {
  final DeleteCreditNoteUsecase deleteCreditNoteUsecase;

  DeleteCreditNoteNotifier({required this.deleteCreditNoteUsecase})
      : super(DeleteCreditNoteState.initial());

  deleteCreditNote({required CreditNoteParams request}) async {
    state = DeleteCreditNoteState.initial();
    state = DeleteCreditNoteState.loading();
    try {
      final result = await deleteCreditNoteUsecase.call(params: request);

      result.fold((l) => state = DeleteCreditNoteState.failure(l.message),
          (r) => state = DeleteCreditNoteState.success());
    } catch (e) {
      state = DeleteCreditNoteState.failure(e.toString());
    }
  }
}
