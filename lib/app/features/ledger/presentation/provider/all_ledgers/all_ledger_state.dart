import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_ledger_state.freezed.dart';

@freezed
class AllLedgerState with _$AllLedgerState {
  const factory AllLedgerState.initial() = _Initial;
  const factory AllLedgerState.loading() = _Loading;
  const factory AllLedgerState.loaded(
      {required List<LedgerAccountEntity> ledgers}) = _Loaded;
  const factory AllLedgerState.error(String message) = _Error;
}
