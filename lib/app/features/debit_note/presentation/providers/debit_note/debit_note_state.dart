import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_entry_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debit_note_state.freezed.dart';

@freezed
abstract class DebitNoteState with _$DebitNoteState {
  const factory DebitNoteState.initial() = _Initial;
  const factory DebitNoteState.loading() = _Loading;
  const factory DebitNoteState.success(
      {required List<DebitNoteEntryEntity> debitNote,
      double? totalAmount}) = _Success;
  const factory DebitNoteState.failure(String error) = _Failure;
}
