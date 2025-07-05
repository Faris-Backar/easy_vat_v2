import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_credit_note_state.freezed.dart';

@freezed
class CreateCreditNoteState with _$CreateCreditNoteState {
  const factory CreateCreditNoteState.initial() = _Initial;
  const factory CreateCreditNoteState.loading() = _Loading;
  const factory CreateCreditNoteState.success(String creditNoteIDPK) = _Success;
  const factory CreateCreditNoteState.failure(String error) = _Failure;
}
