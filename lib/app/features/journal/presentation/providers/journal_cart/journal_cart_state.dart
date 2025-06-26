import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_cart_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_cart_state.freezed.dart';

@freezed
class JournalCartState with _$JournalCartState {
  const factory JournalCartState(
      {List<JournalCartEntity>? ledgerList,
      required double totalAmount,
      required double drAmount,
      required double crAmount,
      String? journalNo,
      String? refNo,
      String? entryMode,
      LedgerAccountEntity? allAccount,
      bool? isForUpdate,
      DateTime? journalDate}) = _JournalCartState;

  factory JournalCartState.initial() => JournalCartState(
        totalAmount: 0.0,
        drAmount: 0.0,
        crAmount: 0.0,
        ledgerList: null,
        journalNo: null,
        journalDate: DateTime.now(),
        refNo: null,
        entryMode: null,
        allAccount: null,
        isForUpdate: false,
      );
}
