import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_sales_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getSalesLedgerUsecase = Provider<GetSalesLedgerUsecase>((ref) {
  return GetSalesLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final salesLedgerNotifierProvider =
    StateNotifierProvider<SalesLedgerNotifier, SalesLedgerState>((ref) {
  return SalesLedgerNotifier(
      getSalesLedgerUsecase: ref.read(getSalesLedgerUsecase));
});

class SalesLedgerNotifier extends StateNotifier<SalesLedgerState> {
  final GetSalesLedgerUsecase getSalesLedgerUsecase;
  List<LedgerAccountEntity> salesLedgers = [];
  SalesLedgerNotifier({required this.getSalesLedgerUsecase})
      : super(SalesLedgerState.initial());

  fetchSalesLedgers({bool isRefresh = false}) async {
    if (salesLedgers.isNotEmpty && !isRefresh) {
      state = SalesLedgerState.loaded(salesLedgers);
    } else {
      state = const SalesLedgerState.loading();
      try {
        final result = await getSalesLedgerUsecase.call(params: NoParams());
        result.fold(
          (l) => state = SalesLedgerState.error(l.message),
          (r) {
            salesLedgers = r;
            state = SalesLedgerState.loaded(r);
          },
        );
      } catch (e) {
        state = SalesLedgerState.error(e.toString());
      }
    }
  }

  LedgerAccountEntity? getLedgerById(String ledgerIDPK) {
    try {
      return salesLedgers.firstWhere(
        (ledger) => ledger.ledgerIdpk == ledgerIDPK,
        orElse: () => throw Exception('Ledger not found'),
      );
    } catch (_) {
      return null;
    }
  }
}
