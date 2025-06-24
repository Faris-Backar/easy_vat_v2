import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_credit_note_state.freezed.dart';

@freezed
class DeleteCreditNoteState with _$DeleteCreditNoteState {
  const factory DeleteCreditNoteState.initial() = _Initial;
  const factory DeleteCreditNoteState.loading() = _Loading;
  const factory DeleteCreditNoteState.success() = _Success;
  const factory DeleteCreditNoteState.failure(String error) = _Failure;
}
