import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_cart_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_cart_state.freezed.dart';

@freezed
class ExpenseCartState with _$ExpenseCartState {
  const factory ExpenseCartState(
      {List<ExpenseCartEntity>? ledgerList,
      required double totalAmount,
      required double discount,
      required double roundOf,
      required double grossTotal,
      required double taxAmount,
      String? expenseNo,
      String? refNo,
      SupplierEntity? selectedSupplier,
      String? paymentMode,
      String? purchasedBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? expenseAccount,
      String? supplierInvoiceNo,
      LedgerAccountEntity? drledger,
      LedgerAccountEntity? crledger,
      bool? isForUpdate,
      DateTime? expenseDate,
      required bool isTaxEnabled}) = _ExpenseCartState;

  factory ExpenseCartState.initial() => ExpenseCartState(
        ledgerList: null,
        totalAmount: 0.0,
        discount: 0.0,
        roundOf: 0.0,
        grossTotal: 0.0,
        taxAmount: 0.0,
        isTaxEnabled: false,
        expenseNo: null,
        refNo: null,
        selectedSupplier: null,
        paymentMode: null,
        purchasedBy: null,
        cashAccount: null,
        expenseAccount: null,
        supplierInvoiceNo: null,
        drledger: null,
        isForUpdate: false,
        crledger: null,
        expenseDate: DateTime.now(),
      );
}
