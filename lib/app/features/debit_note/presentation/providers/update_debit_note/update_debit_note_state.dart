import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_debit_note_state.freezed.dart';

@freezed
class UpdateDebitNoteState with _$UpdateDebitNoteState {
  const factory UpdateDebitNoteState.initial() = _Initial;
  const factory UpdateDebitNoteState.loading() = _Loading;
  const factory UpdateDebitNoteState.success() = _Success;
  const factory UpdateDebitNoteState.failure(String error) = _Failure;
}
