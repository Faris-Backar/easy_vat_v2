import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

class JournalCartEntity {
  final int ledgerId;
  final double currentBalance;
  final LedgerAccountEntity ledger;
  final double netTotal;
  final double drAmount;
  final double crAmount;
  final String description;
  final LedgerModeState ledgerMode;

  JournalCartEntity(
      {required this.ledgerId,
      required this.ledger,
      required this.currentBalance,
      required this.netTotal,
      required this.drAmount,
      required this.crAmount,
      required this.description,
      required this.ledgerMode});

  JournalCartEntity copyWith(
      {int? ledgerId,
      double? currentBalance,
      LedgerAccountEntity? ledger,
      double? netTotal,
      double? drAmount,
      double? crAmount,
      String? description,
      LedgerModeState? ledgerMode}) {
    return JournalCartEntity(
        ledgerId: ledgerId ?? this.ledgerId,
        ledger: ledger ?? this.ledger,
        currentBalance: currentBalance ?? this.currentBalance,
        netTotal: netTotal ?? this.netTotal,
        drAmount: drAmount ?? this.drAmount,
        crAmount: crAmount ?? this.crAmount,
        ledgerMode: ledgerMode ?? this.ledgerMode,
        description: description ?? this.description);
  }

  @override
  String toString() {
    return "JournalCartEntity(ledgerId: $ledgerId, currentBalance: $currentBalance, ledger: $ledger, netTotal: $netTotal, drAmount = $drAmount, crAmount = $crAmount, description: $description, ledgerMode: $ledgerMode)";
  }
}
