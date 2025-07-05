import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_debit_note_state.freezed.dart';

@freezed
class CreateDebitNoteState with _$CreateDebitNoteState {
  const factory CreateDebitNoteState.initial() = _Initial;
  const factory CreateDebitNoteState.loading() = _Loading;
  const factory CreateDebitNoteState.success(String debitNoteIDPK) = _Success;
  const factory CreateDebitNoteState.failure(String error) = _Failure;
}
