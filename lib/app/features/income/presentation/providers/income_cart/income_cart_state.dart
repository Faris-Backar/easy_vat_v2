import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/income/domain/entities/income_cart_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_cart_state.freezed.dart';

@freezed
class IncomeCartState with _$IncomeCartState {
  const factory IncomeCartState(
      {List<IncomeCartEntity>? ledgerList,
      required double totalAmount,
      required double discount,
      required double roundOf,
      required double grossTotal,
      required double taxAmount,
      String? incomeNo,
      String? refNo,
      CustomerEntity? selectedCustomer,
      String? paymentMode,
      String? soldBy,
      LedgerAccountEntity? cashAccount,
      LedgerAccountEntity? incomeAccount,
      LedgerAccountEntity? drledger,
      LedgerAccountEntity? crledger,
      bool? isForUpdate,
      DateTime? incomeDate,
      required bool isTaxEnabled}) = _IncomeCartState;

  factory IncomeCartState.initial() => IncomeCartState(
      totalAmount: 0.0,
      discount: 0.0,
      roundOf: 0.0,
      grossTotal: 0.0,
      taxAmount: 0.0,
      isTaxEnabled: false,
      ledgerList: null,
      incomeNo: null,
      refNo: null,
      selectedCustomer: null,
      paymentMode: null,
      soldBy: null,
      cashAccount: null,
      incomeAccount: null,
      drledger: null,
      crledger: null,
      isForUpdate: false,
      incomeDate: DateTime.now());
}
