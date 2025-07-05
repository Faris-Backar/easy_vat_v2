import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_journal_state.freezed.dart';

@freezed
class UpdateJournalState with _$UpdateJournalState {
  const factory UpdateJournalState.initial() = _Initial;
  const factory UpdateJournalState.loading() = _Loading;
  const factory UpdateJournalState.success() = _Success;
  const factory UpdateJournalState.failure(String error) = _Failure;
}
