import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

class DividendCartEntity {
  final int ledgerId;
  final double currentBalance;
  final String currentBalanceType;
  final LedgerAccountEntity ledger;
  final double netTotal;
  final String description;
  DividendCartEntity(
      {required this.ledgerId,
      required this.currentBalance,
      required this.ledger,
      required this.netTotal,
      required this.description,
      required this.currentBalanceType});

  DividendCartEntity copyWith({
    int? ledgerId,
    double? currentBalance,
    String? currentBalanceType,
    LedgerAccountEntity? ledger,
    double? netTotal,
    String? description,
  }) {
    return DividendCartEntity(
        ledgerId: ledgerId ?? this.ledgerId,
        currentBalance: currentBalance ?? this.currentBalance,
        ledger: ledger ?? this.ledger,
        netTotal: netTotal ?? this.netTotal,
        description: description ?? this.description,
        currentBalanceType: currentBalanceType ?? this.currentBalanceType);
  }

  @override
  String toString() {
    return "DividendCartEntity(ledgerId: $ledgerId, currentBalance: $currentBalance, ledger: $ledger, netTotal: $netTotal, description: $description, currentBalanceType: $currentBalanceType)";
  }
}
