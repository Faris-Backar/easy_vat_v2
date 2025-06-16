import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_ledger_state.freezed.dart';

@freezed
class IncomeLedgerState with _$IncomeLedgerState {
  const factory IncomeLedgerState.initial() = _Initial;
  const factory IncomeLedgerState.loading() = _Loading;
  const factory IncomeLedgerState.loaded(
      {required List<LedgerAccountEntity> ledgers}) = _Loaded;
  const factory IncomeLedgerState.error(String message) = _Error;
}
