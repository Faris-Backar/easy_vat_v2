import 'package:easy_vat_v2/app/features/debit_note/data/model/debit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/debit_note/update_debit_note_usecase.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note/debit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/update_debit_note/update_debit_note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateDebitNoteUsecaseProvider = Provider<UpdateDebitNoteUsecase>((ref) {
  return UpdateDebitNoteUsecase(
      debitNoteRepository: ref.read(debitNoteRepositoryProvider));
});

final updateDebitNoteNotifierProvider =
    StateNotifierProvider<UpdateDebitNoteNotifier, UpdateDebitNoteState>((ref) {
  return UpdateDebitNoteNotifier(
      updateDebitNoteUsecase: ref.read(updateDebitNoteUsecaseProvider));
});

class UpdateDebitNoteNotifier extends StateNotifier<UpdateDebitNoteState> {
  final UpdateDebitNoteUsecase updateDebitNoteUsecase;

  UpdateDebitNoteNotifier({required this.updateDebitNoteUsecase})
      : super(UpdateDebitNoteState.initial());

  updateDebitNote({required DebitNoteRequestModel request}) async {
    state = UpdateDebitNoteState.initial();
    state = UpdateDebitNoteState.loading();
    try {
      final result = await updateDebitNoteUsecase.call(params: request);
      result.fold((l) => state = UpdateDebitNoteState.failure(l.message),
          (r) => state = UpdateDebitNoteState.success());
    } catch (e) {
      state = UpdateDebitNoteState.failure(e.toString());
    }
  }
}
