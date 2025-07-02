import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ledgerModeProvider =
    StateNotifierProvider.family<LedgerModeNotifier, LedgerModeState, dynamic>(
        (ref, id) {
  return LedgerModeNotifier();
});

class LedgerModeNotifier extends StateNotifier<LedgerModeState> {
  LedgerModeNotifier() : super(const LedgerModeState.debitLedger());

  void setLedgerMode(LedgerModeState ledgerState) {
    state = ledgerState;
  }
}
