import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_cart_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dividend_cart_state.freezed.dart';

@freezed
class DividendCartState with _$DividendCartState {
  const factory DividendCartState(
      {List<DividendCartEntity>? ledgerList,
      required double totalAmount,
      String? dividendNo,
      String? refNo,
      String? paymentMode,
      String? issuedBy,
      String? notes,
      String? description,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? capitalAccount,
      LedgerAccountEntity? selectedLedger,
      bool? isForUpdate,
      DateTime? dividendDate}) = _DividendCartState;

  factory DividendCartState.initial() => DividendCartState(
        totalAmount: 0.0,
        ledgerList: null,
        refNo: null,
        dividendDate: DateTime.now(),
        dividendNo: null,
        paymentMode: null,
        selectedLedger: null,
        notes: null,
        description: null,
        isForUpdate: false,
        issuedBy: null,
        capitalAccount: null,
        cashAccount: null,
      );
}
