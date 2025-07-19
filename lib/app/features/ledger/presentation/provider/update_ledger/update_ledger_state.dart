import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_ledger_state.freezed.dart';

@freezed
class UpdateLedgerState with _$UpdateLedgerState {
  const factory UpdateLedgerState.initial() = _Initial;
  const factory UpdateLedgerState.loading() = _Loading;
  const factory UpdateLedgerState.success() = _Success;
  const factory UpdateLedgerState.failure(String error) = _Failure;
}
