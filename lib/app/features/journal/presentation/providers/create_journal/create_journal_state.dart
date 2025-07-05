import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_journal_state.freezed.dart';

@freezed
class CreateJournalState with _$CreateJournalState {
  const factory CreateJournalState.initial() = _Initial;
  const factory CreateJournalState.loading() = _Loading;
  const factory CreateJournalState.success(String journalIDPK) = _Success;
  const factory CreateJournalState.failure(String error) = _Failure;
}
