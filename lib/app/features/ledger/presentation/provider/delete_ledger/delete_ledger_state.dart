import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_ledger_state.freezed.dart';

@freezed
class DeleteLedgerState with _$DeleteLedgerState {
  const factory DeleteLedgerState.initial() = _Initial;
  const factory DeleteLedgerState.loading() = _Loading;
  const factory DeleteLedgerState.success() = _Success;
  const factory DeleteLedgerState.failure(String error) = _Failure;
}
