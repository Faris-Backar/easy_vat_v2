import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_state.freezed.dart';

@freezed
abstract class JournalState with _$JournalState {
  const factory JournalState.initial() = _Initial;
  const factory JournalState.loading() = _Loading;
  const factory JournalState.success(
      {required List<JournalEntryEntity> journal,
      double? totalAmount}) = _Success;
  const factory JournalState.failure(String error) = _Failure;
}
