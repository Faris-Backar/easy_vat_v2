import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

class IncomeCartEntity {
  final int ledgerId;
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

  IncomeCartEntity(
      {required this.ledgerId,
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

  IncomeCartEntity copyWith(
      {int? ledgerId,
      String? groupName,
      String? nature,
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
    return IncomeCartEntity(
        ledgerId: ledgerId ?? this.ledgerId,
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
    return "IncomeCartEntity(ledgerId: $ledgerId,currentBalance: $currentBalance,currentBalanceType: $currentBalanceType, ledger: $ledger, netTotal: $netTotal, grossTotal: $grossTotal, taxAmount: $taxAmount, taxPercentage: $taxPercentage, discount: $discount, description: $description, tax: $tax)";
  }
}
