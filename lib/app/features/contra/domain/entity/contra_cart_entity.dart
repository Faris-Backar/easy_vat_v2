import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

class ContraCartEntity {
  final int ledgerId;
  final double currentBalance;
  final LedgerAccountEntity ledger;
  final double netTotal;
  final double drAmount;
  final double crAmount;
  final String description;

  ContraCartEntity(
      {required this.ledgerId,
      required this.ledger,
      required this.currentBalance,
      required this.netTotal,
      required this.drAmount,
      required this.crAmount,
      required this.description});

  ContraCartEntity copyWith(
      {int? ledgerId,
      double? currentBalance,
      LedgerAccountEntity? ledger,
      double? netTotal,
      double? drAmount,
      double? crAmount,
      String? description}) {
    return ContraCartEntity(
        ledgerId: ledgerId ?? this.ledgerId,
        ledger: ledger ?? this.ledger,
        currentBalance: currentBalance ?? this.currentBalance,
        netTotal: netTotal ?? this.netTotal,
        drAmount: drAmount ?? this.drAmount,
        crAmount: crAmount ?? this.crAmount,
        description: description ?? this.description);
  }

  @override
  String toString() {
    return "ContraCartEntity(ledgerId: $ledgerId, currentBalance: $currentBalance, ledger: $ledger, netTotal: $netTotal, drAmount = $drAmount, crAmount = $crAmount, description: $description)";
  }
}
