import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

class CreditNoteCartEntity {
  final int ledgerId;
  final double ledgerBalance;
  final LedgerAccountEntity ledger;
  final double netTotal;
  final double drAmount;
  final double taxAmount;
  final double taxPercentage;
  final String description;
  final double tax;

  CreditNoteCartEntity(
      {required this.ledgerId,
      required this.ledgerBalance,
      required this.ledger,
      required this.netTotal,
      required this.drAmount,
      required this.taxAmount,
      required this.taxPercentage,
      required this.description,
      required this.tax});

  CreditNoteCartEntity copyWith(
      {int? ledgerId,
      double? ledgerBalance,
      LedgerAccountEntity? ledger,
      double? netTotal,
      double? drAmount,
      double? taxAmount,
      double? taxPercentage,
      String? description,
      double? tax}) {
    return CreditNoteCartEntity(
        ledgerId: ledgerId ?? this.ledgerId,
        ledgerBalance: ledgerBalance ?? this.ledgerBalance,
        ledger: ledger ?? this.ledger,
        netTotal: netTotal ?? this.netTotal,
        drAmount: drAmount ?? this.drAmount,
        taxAmount: taxAmount ?? this.taxAmount,
        taxPercentage: taxPercentage ?? this.taxPercentage,
        description: description ?? this.description,
        tax: tax ?? this.tax);
  }

  @override
  String toString() {
    return "CreditNoteCartEntity(ledgerId: $ledgerId,ledgerBalance: $ledgerBalance,ledger: $ledger, netTotal: $netTotal, drAmount: $drAmount, taxAmount: $taxAmount, taxPercentage: $taxPercentage, description: $description, tax: $tax)";
  }
}
