import 'package:easy_vat_v2/app/features/credit_note/data/model/credit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/credit_note/create_credit_note_usecase.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/create_credit_note/create_credit_note_state.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note/credit_note_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createCreditNoteUsecaseProvider =
    Provider<CreateCreditNoteUsecase>((ref) {
  return CreateCreditNoteUsecase(
      creditNoteRepository: ref.read(creditNoteRepositoryProvider));
});

final createCreditNoteNotifierProvider =
    StateNotifierProvider<CreateCreditNoteNotifier, CreateCreditNoteState>(
        (ref) {
  return CreateCreditNoteNotifier(
      createCreditNoteUsecase: ref.read(createCreditNoteUsecaseProvider));
});

class CreateCreditNoteNotifier extends StateNotifier<CreateCreditNoteState> {
  final CreateCreditNoteUsecase createCreditNoteUsecase;
  CreateCreditNoteNotifier({required this.createCreditNoteUsecase})
      : super(CreateCreditNoteState.initial());

  createCreditNote({required CreditNoteRequestModel request}) async {
    state = CreateCreditNoteState.initial();
    state = CreateCreditNoteState.loading();
    try {
      final result = await createCreditNoteUsecase.call(params: request);
      result.fold(
          (l) => state = CreateCreditNoteState.failure(l.message),
          (r) => state = CreateCreditNoteState.success(
              r.creditNoteEntry?.first.creditNoteIDPK ?? ""));
    } catch (e) {
      state = CreateCreditNoteState.failure(e.toString());
    }
  }
}
