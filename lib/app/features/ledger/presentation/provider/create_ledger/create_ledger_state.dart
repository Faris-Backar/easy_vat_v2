import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_ledger_state.freezed.dart';

@freezed
class CreateLedgerState with _$CreateLedgerState {
  const factory CreateLedgerState.initial() = _Initial;
  const factory CreateLedgerState.loading() = _Loading;
  const factory CreateLedgerState.success(String ledgerIDPK) = _Success;
  const factory CreateLedgerState.failure(String error) = _Error;
}
