import 'package:easy_vat_v2/app/features/credit_note/data/model/credit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/credit_note/update_credit_note_usecase.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note/credit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/update_credit_note/update_credit_note_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateCreditNoteUsecaseProvider =
    Provider<UpdateCreditNoteUsecase>((ref) {
  return UpdateCreditNoteUsecase(
      creditNoteRepository: ref.read(creditNoteRepositoryProvider));
});

final updateCreditNoteNotifierProvider =
    StateNotifierProvider<UpdateCreditNoteNotifier, UpdateCreditNoteState>(
        (ref) {
  return UpdateCreditNoteNotifier(
      updateCreditNoteUsecase: ref.read(updateCreditNoteUsecaseProvider));
});

class UpdateCreditNoteNotifier extends StateNotifier<UpdateCreditNoteState> {
  final UpdateCreditNoteUsecase updateCreditNoteUsecase;

  UpdateCreditNoteNotifier({required this.updateCreditNoteUsecase})
      : super(UpdateCreditNoteState.initial());

  updateCreditNote({required CreditNoteRequestModel request}) async {
    state = UpdateCreditNoteState.initial();
    state = UpdateCreditNoteState.loading();
    try {
      final result = await updateCreditNoteUsecase.call(params: request);
      result.fold((l) => state = UpdateCreditNoteState.failure(l.message),
          (r) => state = UpdateCreditNoteState.success());
    } catch (e) {
      state = UpdateCreditNoteState.failure(e.toString());
    }
  }
}
