import 'package:easy_vat_v2/app/features/debit_note/data/model/debit_note_request_model.dart';
import 'package:easy_vat_v2/app/features/debit_note/domain/usecase/debit_note/create_debit_note_usecase.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/create_debit_note/create_debit_note_state.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note/debit_note_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createDebitNoteUsecaseProvider = Provider<CreateDebitNoteUsecase>((ref) {
  return CreateDebitNoteUsecase(
      debitNoteRepository: ref.read(debitNoteRepositoryProvider));
});

final createDebitNoteNotifierProvider =
    StateNotifierProvider<CreateDebitNoteNotifier, CreateDebitNoteState>((ref) {
  return CreateDebitNoteNotifier(
      createDebitNoteUsecase: ref.read(createDebitNoteUsecaseProvider));
});

class CreateDebitNoteNotifier extends StateNotifier<CreateDebitNoteState> {
  final CreateDebitNoteUsecase createDebitNoteUsecase;
  CreateDebitNoteNotifier({required this.createDebitNoteUsecase})
      : super(CreateDebitNoteState.initial());

  createDebitNote({required DebitNoteRequestModel request}) async {
    state = CreateDebitNoteState.initial();
    state = CreateDebitNoteState.loading();
    try {
      final result = await createDebitNoteUsecase.call(params: request);
      result.fold(
          (l) => state = CreateDebitNoteState.failure(l.message),
          (r) => state = CreateDebitNoteState.success(
              r.debitNoteEntry?.first.debitNoteIDPK ?? ""));
    } catch (e) {
      state = CreateDebitNoteState.failure(e.toString());
    }
  }
}
