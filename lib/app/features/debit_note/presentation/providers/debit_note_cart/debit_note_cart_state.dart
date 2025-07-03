import 'package:easy_vat_v2/app/features/debit_note/domain/entity/debit_note_cart_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debit_note_cart_state.freezed.dart';

@freezed
class DebitNoteCartState with _$DebitNoteCartState {
  const factory DebitNoteCartState(
      {List<DebitNoteCartEntity>? ledgerList,
      required double totalAmount,
      required double crAmount,
      required double taxAmount,
      String? debitNoteNo,
      String? refNo,
      SupplierEntity? selectedSupplier,
      String? paymentMode,
      String? purchasedBy,
      String? notes,
      String? supplierReferenceNo,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? allAccount,
      LedgerAccountEntity? drLedger,
      LedgerAccountEntity? crLedger,
      bool? isForUpdate,
      DateTime? debitNoteDate,
      required bool isTaxEnabled}) = _DebitNoteCartState;

  factory DebitNoteCartState.initial() => DebitNoteCartState(
      totalAmount: 0.0,
      crAmount: 0.0,
      taxAmount: 0.0,
      debitNoteNo: null,
      ledgerList: null,
      refNo: null,
      selectedSupplier: null,
      supplierReferenceNo: null,
      drLedger: null,
      crLedger: null,
      notes: null,
      paymentMode: null,
      purchasedBy: null,
      cashAccount: null,
      allAccount: null,
      isForUpdate: null,
      isTaxEnabled: false,
      debitNoteDate: DateTime.now());
}
