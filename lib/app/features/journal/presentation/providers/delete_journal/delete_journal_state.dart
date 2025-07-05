import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_journal_state.freezed.dart';

@freezed
class DeleteJournalState with _$DeleteJournalState {
  const factory DeleteJournalState.initial() = _Initial;
  const factory DeleteJournalState.loading() = _Loading;
  const factory DeleteJournalState.success() = _Success;
  const factory DeleteJournalState.failure(String error) = _Failure;
}
