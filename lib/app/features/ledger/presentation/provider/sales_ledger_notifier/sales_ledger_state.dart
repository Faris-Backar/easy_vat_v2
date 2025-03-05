import 'package:easy_vat_v2/app/features/ledger/domain/entities/sales_ledger_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_ledger_state.freezed.dart';

@freezed
class SalesLedgerState with _$SalesLedgerState {
  const factory SalesLedgerState.initial() = _Initial;
  const factory SalesLedgerState.loading() = _Loading;
  const factory SalesLedgerState.loaded(List<SalesLedgerEntity> ledgers) =
      _Loaded;
  const factory SalesLedgerState.error(String message) = _Error;
}
