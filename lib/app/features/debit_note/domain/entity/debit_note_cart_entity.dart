import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

class DebitNoteCartEntity {
  final int ledgerId;
  final double ledgerBalance;
  final LedgerAccountEntity ledger;
  final double netTotal;
  final double crAmount;
  final double taxAmount;
  final double taxPercentage;
  final String description;
  final double tax;
  DebitNoteCartEntity(
      {required this.ledgerId,
      required this.ledgerBalance,
      required this.ledger,
      required this.netTotal,
      required this.crAmount,
      required this.taxAmount,
      required this.taxPercentage,
      required this.description,
      required this.tax});

  DebitNoteCartEntity copyWith(
      {int? ledgerId,
      double? ledgerBalance,
      LedgerAccountEntity? ledger,
      double? netTotal,
      double? crAmount,
      double? taxAmount,
      double? taxPercentage,
      String? description,
      double? tax}) {
    return DebitNoteCartEntity(
        ledgerId: ledgerId ?? this.ledgerId,
        ledgerBalance: ledgerBalance ?? this.ledgerBalance,
        ledger: ledger ?? this.ledger,
        netTotal: netTotal ?? this.netTotal,
        crAmount: crAmount ?? this.crAmount,
        taxAmount: taxAmount ?? this.taxAmount,
        taxPercentage: taxPercentage ?? this.taxPercentage,
        description: description ?? this.description,
        tax: tax ?? this.tax);
  }

  @override
  String toString() {
    return "DebitNoteCartEntity(ledgerId: $ledgerId,ledgerBalance: $ledgerBalance,ledger: $ledger, netTotal: $netTotal, crAmount: $crAmount, taxAmount: $taxAmount, taxPercentage: $taxPercentage, description: $description, tax: $tax)";
  }
}
