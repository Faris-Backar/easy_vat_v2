import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

class ExpenseCartEntity {
  final int ledgerId;
  final String ledgerName;
  final String ledgerCode;
  final String groupName;
  final String nature;
  final double openingBalance;
  final double currentBalance;
  final String currentBalanceType;
  final LedgerAccountEntity ledger;
  final double netTotal;
  final double grossTotal;
  final double taxAmount;
  final double taxPercentage;
  final double discount;
  final String description;
  final double tax;

  ExpenseCartEntity(
      {required this.ledgerId,
      required this.ledgerName,
      required this.ledgerCode,
      required this.groupName,
      required this.nature,
      required this.openingBalance,
      required this.currentBalance,
      required this.currentBalanceType,
      required this.ledger,
      required this.netTotal,
      required this.grossTotal,
      required this.taxAmount,
      required this.taxPercentage,
      required this.discount,
      required this.description,
      required this.tax});

  ExpenseCartEntity copyWith(
      {int? ledgerId,
      String? ledgerName,
      String? ledgerCode,
      String? groupName,
      String? nature,
      double? openingBalance,
      double? currentBalance,
      String? currentBalanceType,
      LedgerAccountEntity? ledger,
      double? netTotal,
      double? grossTotal,
      double? taxAmount,
      double? taxPercentage,
      double? discount,
      String? description,
      double? tax}) {
    return ExpenseCartEntity(
        ledgerId: ledgerId ?? this.ledgerId,
        ledgerName: ledgerName ?? this.ledgerName,
        ledgerCode: ledgerCode ?? this.ledgerCode,
        groupName: groupName ?? this.groupName,
        nature: nature ?? this.nature,
        openingBalance: openingBalance ?? this.openingBalance,
        currentBalance: currentBalance ?? this.currentBalance,
        currentBalanceType: currentBalanceType ?? this.currentBalanceType,
        ledger: ledger ?? this.ledger,
        netTotal: netTotal ?? this.netTotal,
        grossTotal: grossTotal ?? this.grossTotal,
        taxAmount: taxAmount ?? this.taxAmount,
        taxPercentage: taxPercentage ?? this.taxPercentage,
        discount: discount ?? this.discount,
        description: description ?? this.description,
        tax: tax ?? this.tax);
  }

  @override
  String toString() {
    return "ExpenseCartEntity(ledgerId: $ledgerId,ledgerName: $ledgerName,ledgerCode: $ledgerCode,groupName: $groupName,nature: $nature,openingBalance: $openingBalance,currentBalance: $currentBalance,currentBalanceType: $currentBalanceType, ledger: $ledger, netTotal: $netTotal, grossTotal: $grossTotal, taxAmount: $taxAmount, taxPercentage: $taxPercentage, discount: $discount, description: $description, tax: $tax)";
  }
}
