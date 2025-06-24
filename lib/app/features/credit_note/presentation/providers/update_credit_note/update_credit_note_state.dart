import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_credit_note_state.freezed.dart';

@freezed
class UpdateCreditNoteState with _$UpdateCreditNoteState {
  const factory UpdateCreditNoteState.initial() = _Initial;
  const factory UpdateCreditNoteState.loading() = _Loading;
  const factory UpdateCreditNoteState.success() = _Success;
  const factory UpdateCreditNoteState.failure(String error) = _Failure;
}
