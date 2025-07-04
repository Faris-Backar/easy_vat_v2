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
}
