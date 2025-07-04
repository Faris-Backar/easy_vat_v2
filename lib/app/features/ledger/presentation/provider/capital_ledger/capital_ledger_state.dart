import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'capital_ledger_state.freezed.dart';

@freezed
class CapitalLedgerState with _$CapitalLedgerState {
  const factory CapitalLedgerState.initial() = _Initial;
  const factory CapitalLedgerState.loading() = _Loading;
  const factory CapitalLedgerState.loaded(
      {required List<LedgerAccountEntity> ledgers}) = _Loaded;
  const factory CapitalLedgerState.error(String message) = _Error;
}
