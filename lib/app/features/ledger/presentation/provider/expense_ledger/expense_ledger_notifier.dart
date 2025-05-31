import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_expense_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/expense_ledger/expense_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getExpenseLedgerUsecase = Provider<GetExpenseLedgerUsecase>((ref) {
  return GetExpenseLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final expenseLedgerNotifierProvider =
    StateNotifierProvider<ExpenseLedgerNotifier, ExpenseLedgerState>((ref) {
  return ExpenseLedgerNotifier(
      getExpenseLedgerUsecase: ref.read(getExpenseLedgerUsecase));
});

class ExpenseLedgerNotifier extends StateNotifier<ExpenseLedgerState> {
  final GetExpenseLedgerUsecase getExpenseLedgerUsecase;
  List<LedgerAccountEntity> expenseLedgers = [];
  ExpenseLedgerNotifier({required this.getExpenseLedgerUsecase})
      : super(ExpenseLedgerState.initial());

  fetchExpenseLedgers({bool isRefresh = false}) async {
    if (expenseLedgers.isNotEmpty && !isRefresh) {
      state = ExpenseLedgerState.loaded(expenseLedgers);
    } else {
      state = const ExpenseLedgerState.loading();
      try {
        final result = await getExpenseLedgerUsecase.call(params: NoParams());
        result.fold((l) => state = ExpenseLedgerState.error(l.message), (r) {
          expenseLedgers = r;
          state = ExpenseLedgerState.loaded(r);
        });
      } catch (e) {
        state = ExpenseLedgerState.error(e.toString());
      }
    }
  }

  LedgerAccountEntity? getLedgetById(String ledgerIDPK) {
    try {
      return expenseLedgers.firstWhere(
        (ledger) => ledger.ledgerIdpk == ledgerIDPK,
        orElse: () => throw Exception("Ledger not found"),
      );
    } catch (_) {
      return null;
    }
  }
}
