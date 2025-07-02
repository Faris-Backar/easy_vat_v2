import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final entryModeProvider =
    StateNotifierProvider<EntryModeNotifier, EntryModeState>((ref) {
  return EntryModeNotifier();
});

class EntryModeNotifier extends StateNotifier<EntryModeState> {
  EntryModeNotifier() : super(const EntryModeState.singleEntry());

  void setEntryMode(EntryModeState entryMode) {
    state = entryMode;
  }
}
