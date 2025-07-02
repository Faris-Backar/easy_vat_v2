import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger_mode_state.freezed.dart';

@freezed
class LedgerModeState with _$LedgerModeState {
  const factory LedgerModeState.debitLedger() = _DebitLedger;
  const factory LedgerModeState.creditLedger() = _CreditLedger;
}
