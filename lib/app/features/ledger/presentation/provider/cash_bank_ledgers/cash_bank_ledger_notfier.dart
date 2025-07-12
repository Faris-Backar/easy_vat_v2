import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/ledger/data/repository/ledger_repository_impl.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_cash_bank_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_bank_ledgers/cash_bank_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ledgerRepositoryProvider = Provider<LedgerRepository>((ref) {
  return LedgerRepositoryImpl();
});

final getCashBankLedgerUsecaseProvider =
    Provider<GetCashBankLedgerUsecase>((ref) {
  return GetCashBankLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final cashBankLedgerNotifierProvider =
    StateNotifierProvider<CashBankLedgerNotifier, CashBankLedgerState>((ref) {
  return CashBankLedgerNotifier(
      getCashBankLedgerUsecase: ref.read(getCashBankLedgerUsecaseProvider));
});

class CashBankLedgerNotifier extends StateNotifier<CashBankLedgerState> {
  final GetCashBankLedgerUsecase getCashBankLedgerUsecase;
  List<LedgerAccountEntity> cashBankLedgers = [];
  CashBankLedgerNotifier({required this.getCashBankLedgerUsecase})
      : super(CashBankLedgerState.initial());

  fetchCashBankLedgers({bool isRefresh = false}) async {
    if (cashBankLedgers.isNotEmpty && !isRefresh) {
      state = CashBankLedgerState.loaded(ledgers: cashBankLedgers);
    } else {
      state = const CashBankLedgerState.loading();
      try {
        final result = await getCashBankLedgerUsecase.call(params: NoParams());
        result.fold((l) => state = CashBankLedgerState.error(l.message), (r) {
          cashBankLedgers = r;
          return state = CashBankLedgerState.loaded(ledgers: r);
        });
      } catch (e) {
        state = CashBankLedgerState.error(e.toString());
      }
    }
  }

  LedgerAccountEntity? getLedgerById(String ledgerIDPK) {
    try {
      return cashBankLedgers.firstWhere(
        (ledger) => ledger.ledgerIdpk == ledgerIDPK,
        orElse: () => throw Exception("Ledger not found"),
      );
    } catch (_) {
      return null;
    }
  }
}
