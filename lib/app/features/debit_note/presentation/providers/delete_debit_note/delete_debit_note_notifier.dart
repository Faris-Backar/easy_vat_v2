import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/debit_note/delete_debit_note_usecase.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/params/debit_note_params.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note/debit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/delete_debit_note/delete_debit_note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteDebitNoteUsecase = Provider<DeleteDebitNoteUsecase>((ref) {
  return DeleteDebitNoteUsecase(
      debitNoteRepository: ref.read(debitNoteRepositoryProvider));
});

final deleteDebitNoteNotifierProvider =
    StateNotifierProvider<DeleteDebitNoteNotifier, DeleteDebitNoteState>((ref) {
  return DeleteDebitNoteNotifier(
      deleteDebitNoteUsecase: ref.read(deleteDebitNoteUsecase));
});

class DeleteDebitNoteNotifier extends StateNotifier<DeleteDebitNoteState> {
  final DeleteDebitNoteUsecase deleteDebitNoteUsecase;

  DeleteDebitNoteNotifier({required this.deleteDebitNoteUsecase})
      : super(DeleteDebitNoteState.initial());

  deleteDebitNote({required DebitNoteParams request}) async {
    state = DeleteDebitNoteState.initial();
    state = DeleteDebitNoteState.loading();
    try {
      final result = await deleteDebitNoteUsecase.call(params: request);
      result.fold((l) => state = DeleteDebitNoteState.failure(l.message),
          (r) => state = DeleteDebitNoteState.success());
    } catch (e) {
      state = DeleteDebitNoteState.failure(e.toString());
    }
  }
}
