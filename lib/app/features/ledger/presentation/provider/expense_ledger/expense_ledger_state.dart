import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_ledger_state.freezed.dart';

@freezed
class ExpenseLedgerState with _$ExpenseLedgerState {
  const factory ExpenseLedgerState.initial() = _Initial;
  const factory ExpenseLedgerState.loading() = _Loading;
  const factory ExpenseLedgerState.loaded(List<LedgerAccountEntity> ledgers) =
      _Loaded;
  const factory ExpenseLedgerState.error(String message) = _Error;
}
