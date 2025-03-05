import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/ledger/data/repository/ledger_repository_impl.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_cash_ledger_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_state.dart';

final ledgerRepositoryProvider = Provider<LedgerRepository>((ref) {
  return LedgerRepositoryImpl(client: ref.read(dioProvider));
});

final getCashLedgerUsercaseProvider = Provider<GetCashLedgerUsecase>((ref) {
  return GetCashLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final cashLedgerNotifierProvider =
    StateNotifierProvider<CashLedgerNotifier, CashLedgerState>((ref) {
  return CashLedgerNotifier(
      getCashLedgerUsecase: ref.read(getCashLedgerUsercaseProvider));
});

class CashLedgerNotifier extends StateNotifier<CashLedgerState> {
  final GetCashLedgerUsecase getCashLedgerUsecase;
  CashLedgerNotifier({required this.getCashLedgerUsecase})
      : super(CashLedgerState.initial());

  fetchCashLedgers() async {
    state = const CashLedgerState.loading();
    try {
      final result = await getCashLedgerUsecase.call(params: NoParams());
      result.fold(
        (l) => state = CashLedgerState.error(l.message),
        (r) => state = CashLedgerState.loaded(r),
      );
    } catch (e) {
      state = CashLedgerState.error(e.toString());
    }
  }
}
