import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_cart_entity.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_note_cart_state.freezed.dart';

@freezed
class CreditNoteCartState with _$CreditNoteCartState {
  const factory CreditNoteCartState(
      {List<CreditNoteCartEntity>? ledgerList,
      required double totalAmount,
      required double drAmount,
      required double taxAmount,
      String? creditNoteNo,
      String? refNo,
      CustomerEntity? selectedCustomer,
      String? notes,
      String? paymentMode,
      String? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? allAccount,
      bool? isForUpdate,
      DateTime? creditNoteDate,
      required bool isTaxEnabled}) = _CreditNoteCartState;

  factory CreditNoteCartState.initial() => CreditNoteCartState(
      totalAmount: 0.0,
      drAmount: 0.0,
      taxAmount: 0.0,
      creditNoteNo: null,
      ledgerList: null,
      refNo: null,
      notes: null,
      selectedCustomer: null,
      paymentMode: null,
      soldBy: null,
      cashAccount: null,
      allAccount: null,
      isForUpdate: false,
      isTaxEnabled: false,
      creditNoteDate: DateTime.now());
}
