import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/ledger/data/repository/ledger_repository_impl.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_bank_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_cash_ledger_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_state.dart';

final ledgerRepositoryProvider = Provider<LedgerRepository>((ref) {
  return LedgerRepositoryImpl();
});

final getCashLedgerUsercaseProvider = Provider<GetCashLedgerUsecase>((ref) {
  return GetCashLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final getbankLedgerUsecase = Provider<GetBankLedgerUsecase>((ref) {
  return GetBankLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final cashLedgerNotifierProvider =
    StateNotifierProvider<CashLedgerNotifier, CashLedgerState>((ref) {
  return CashLedgerNotifier(
      getCashLedgerUsecase: ref.read(getCashLedgerUsercaseProvider),
      getBankLedgerUsecase: ref.read(getbankLedgerUsecase));
});

class CashLedgerNotifier extends StateNotifier<CashLedgerState> {
  final GetCashLedgerUsecase getCashLedgerUsecase;
  final GetBankLedgerUsecase getBankLedgerUsecase;

  List<LedgerAccountEntity> cashLedgers = [];
  List<LedgerAccountEntity> bankLedgers = [];

  CashLedgerNotifier(
      {required this.getCashLedgerUsecase, required this.getBankLedgerUsecase})
      : super(CashLedgerState.initial());

  fetchCashLedgers({bool isRefresh = false}) async {
    if (cashLedgers.isNotEmpty && !isRefresh) {
      state = CashLedgerState.loaded(ledgers: cashLedgers);
    } else {
      state = const CashLedgerState.loading();
      try {
        final result = await getCashLedgerUsecase.call(params: NoParams());
        result.fold((l) => state = CashLedgerState.error(l.message), (r) {
          cashLedgers = r;
          return state = CashLedgerState.loaded(ledgers: r);
        });
      } catch (e) {
        state = CashLedgerState.error(e.toString());
      }
    }
  }

  fetchBankLedgers({bool isRefresh = false}) async {
    if (bankLedgers.isNotEmpty && !isRefresh) {
      state = CashLedgerState.loaded(ledgers: bankLedgers);
    } else {
      state = const CashLedgerState.loading();
      try {
        final result = await getBankLedgerUsecase.call(params: NoParams());
        result.fold((l) => state = CashLedgerState.error(l.message), (r) {
          bankLedgers = r;
          return state = CashLedgerState.loaded(ledgers: r);
        });
      } catch (e) {
        state = CashLedgerState.error(e.toString());
      }
    }
  }

  LedgerAccountEntity? getLedgerById(String ledgerIDPK) {
    try {
      final cashLedger = cashLedgers.firstWhere(
        (ledger) => ledger.ledgerIdpk == ledgerIDPK,
        orElse: () => throw Exception('Ledger not found'),
      );
      return cashLedger;
    } catch (_) {
      try {
        final bankLedger = bankLedgers.firstWhere(
          (ledger) => ledger.ledgerIdpk == ledgerIDPK,
          orElse: () => throw Exception('Ledger not found'),
        );
        return bankLedger;
      } catch (e) {
        return null;
      }
    }
  }
}
