import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_entry_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_note_state.freezed.dart';

@freezed
abstract class CreditNoteState with _$CreditNoteState {
  const factory CreditNoteState.initial() = _Initial;
  const factory CreditNoteState.loading() = _Loading;
  const factory CreditNoteState.success(
      {required List<CreditNoteEntryEntity> creditNote,
      double? totalAmount}) = _Success;
  const factory CreditNoteState.failure(String error) = _Failure;
}
