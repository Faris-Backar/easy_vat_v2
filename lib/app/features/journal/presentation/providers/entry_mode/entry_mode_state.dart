import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_mode_state.freezed.dart';

@freezed
class EntryModeState with _$EntryModeState {
  const factory EntryModeState.singleEntry() = _SingleEntry;
  const factory EntryModeState.doubleEntry() = _DoubleEntry;
}
