import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/ledger/data/repository/ledger_repository_impl.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_income_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/income_ledger/income_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ledgerRepositoryProvider = Provider<LedgerRepository>((ref) {
  return LedgerRepositoryImpl();
});

final getIncomeLedgerUsecaseProvider = Provider<GetIncomeLedgerUsecase>((ref) {
  return GetIncomeLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final incomeLedgerNotifierProvider =
    StateNotifierProvider<IncomeLedgerNotifier, IncomeLedgerState>(
  (ref) {
    return IncomeLedgerNotifier(
        getIncomeLedgerUsecase: ref.read(getIncomeLedgerUsecaseProvider));
  },
);

class IncomeLedgerNotifier extends StateNotifier<IncomeLedgerState> {
  final GetIncomeLedgerUsecase getIncomeLedgerUsecase;
  List<LedgerAccountEntity> incomeLedgers = [];
  IncomeLedgerNotifier({required this.getIncomeLedgerUsecase})
      : super(IncomeLedgerState.initial());

  fetchIncomeLedgers({bool isRefresh = false}) async {
    if (incomeLedgers.isNotEmpty && isRefresh) {
      state = IncomeLedgerState.loaded(ledgers: incomeLedgers);
    } else {
      state = const IncomeLedgerState.loading();
      try {
        final result = await getIncomeLedgerUsecase.call(params: NoParams());
        result.fold((l) => state = IncomeLedgerState.error(l.message), (r) {
          incomeLedgers = r;
          return state = IncomeLedgerState.loaded(ledgers: r);
        });
      } catch (e) {
        state = IncomeLedgerState.error(e.toString());
      }
    }
  }

  LedgerAccountEntity? getLedgerById(String ledgerIDPK) {
    try {
      return incomeLedgers.firstWhere(
          (ledger) => ledger.ledgerIdpk == ledgerIDPK,
          orElse: () => throw Exception("Ledger not found"));
    } catch (_) {
      return null;
    }
  }
}
