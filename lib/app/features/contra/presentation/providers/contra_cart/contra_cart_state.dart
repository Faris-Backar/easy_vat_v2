import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_cart_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contra_cart_state.freezed.dart';

@freezed
class ContraCartState with _$ContraCartState {
  const factory ContraCartState(
      {List<ContraCartEntity>? ledgerList,
      required double totalAmount,
      required double drAmount,
      required double crAmount,
      String? contraNo,
      String? refNo,
      String? entryMode,
      LedgerAccountEntity? allAccount,
      bool? isForUpdate,
      DateTime? contraDate}) = _ContraCartState;

  factory ContraCartState.initial() => ContraCartState(
      totalAmount: 0.0,
      drAmount: 0.0,
      crAmount: 0.0,
      ledgerList: null,
      contraDate: DateTime.now(),
      contraNo: null,
      refNo: null,
      entryMode: null,
      isForUpdate: false,
      allAccount: null);
}
