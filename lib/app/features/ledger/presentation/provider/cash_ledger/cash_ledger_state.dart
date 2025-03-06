import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_ledger_state.freezed.dart';

@freezed
class CashLedgerState with _$CashLedgerState {
  const factory CashLedgerState.initial() = _Initial;
  const factory CashLedgerState.loading() = _Loading;
  const factory CashLedgerState.loaded({
    required List<LedgerAccountEntity> ledgers,
  }) = _Loaded;
  const factory CashLedgerState.error(String message) = _Error;
}
