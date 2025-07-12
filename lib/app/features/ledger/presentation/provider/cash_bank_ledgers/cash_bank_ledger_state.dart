import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_bank_ledger_state.freezed.dart';

@freezed
class CashBankLedgerState with _$CashBankLedgerState {
  const factory CashBankLedgerState.initial() = _Initial;
  const factory CashBankLedgerState.loading() = _Loading;
  const factory CashBankLedgerState.loaded(
      {required List<LedgerAccountEntity> ledgers}) = _Loaded;
  const factory CashBankLedgerState.error(String message) = _Error;
}
