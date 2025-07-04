import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/ledger/data/repository/ledger_repository_impl.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_captial_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/capital_ledger/capital_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ledgerRepositoryProvider = Provider<LedgerRepository>((ref) {
  return LedgerRepositoryImpl();
});

final getCapitalLEdgerUsecaseProvider =
    Provider<GetCaptialLedgerUsecase>((ref) {
  return GetCaptialLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final capitalLedgerNotifierProvider =
    StateNotifierProvider<CapitalLedgerNotifier, CapitalLedgerState>((ref) {
  return CapitalLedgerNotifier(
      getCapitalLedgerUsecase: ref.read(getCapitalLEdgerUsecaseProvider));
});

class CapitalLedgerNotifier extends StateNotifier<CapitalLedgerState> {
  final GetCaptialLedgerUsecase getCapitalLedgerUsecase;
  List<LedgerAccountEntity> capitalLedgers = [];
  CapitalLedgerNotifier({required this.getCapitalLedgerUsecase})
      : super(CapitalLedgerState.initial());

  fetchCapitalLedgers({bool isRefresh = false}) async {
    if (capitalLedgers.isNotEmpty && !isRefresh) {
      state = CapitalLedgerState.loaded(ledgers: capitalLedgers);
    } else {
      state = const CapitalLedgerState.loading();
      try {
        final result = await getCapitalLedgerUsecase.call(params: NoParams());
        result.fold((l) => state = CapitalLedgerState.error(l.message), (r) {
          capitalLedgers = r;
          return state = CapitalLedgerState.loaded(ledgers: r);
        });
      } catch (e) {
        state = CapitalLedgerState.error(e.toString());
      }
    }
  }

  LedgerAccountEntity? getLedgetById(String ledgerIDPK) {
    try {
      return capitalLedgers.firstWhere(
        (ledger) => ledger.ledgerIdpk == ledgerIDPK,
        orElse: () => throw Exception("Ledger not found"),
      );
    } catch (_) {
      return null;
    }
  }
}
