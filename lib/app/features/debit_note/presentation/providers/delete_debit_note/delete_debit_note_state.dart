import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_debit_note_state.freezed.dart';

@freezed
class DeleteDebitNoteState with _$DeleteDebitNoteState {
  const factory DeleteDebitNoteState.initial() = _Initial;
  const factory DeleteDebitNoteState.loading() = _Loading;
  const factory DeleteDebitNoteState.success() = _Success;
  const factory DeleteDebitNoteState.failure(String error) = _Failure;
}
