import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_ledger_state.freezed.dart';

@freezed
abstract class FetchLedgerState with _$FetchLedgerState {
  const factory FetchLedgerState.initial() = _Initial;
  const factory FetchLedgerState.loading() = _Loading;
  const factory FetchLedgerState.success(
      {required List<LedgerAccountEntity> ledger}) = _Successl;
  const factory FetchLedgerState.error({required String message}) = _Error;
}
