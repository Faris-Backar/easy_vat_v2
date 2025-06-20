import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/ledger/data/repository/ledger_repository_impl.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/get_all_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/all_ledgers/all_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ledgerRepositoryProvider = Provider<LedgerRepository>((ref) {
  return LedgerRepositoryImpl();
});

final getAllLedgerUsecaseProvider = Provider<GetAllLedgerUsecase>((ref) {
  return GetAllLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final allLedgerNotifierProvider =
    StateNotifierProvider<AllLedgerNotifier, AllLedgerState>((ref) {
  return AllLedgerNotifier(
      getAllLedgerUsecase: ref.read(getAllLedgerUsecaseProvider));
});

class AllLedgerNotifier extends StateNotifier<AllLedgerState> {
  final GetAllLedgerUsecase getAllLedgerUsecase;
  List<LedgerAccountEntity> allLedgers = [];
  AllLedgerNotifier({required this.getAllLedgerUsecase})
      : super(AllLedgerState.initial());

  fetchAllLedgers({bool isRefresh = false}) async {
    if (allLedgers.isNotEmpty && isRefresh) {
      state = AllLedgerState.loaded(ledgers: allLedgers);
    } else {
      state = AllLedgerState.loading();
      try {
        final result = await getAllLedgerUsecase.call(params: NoParams());
        result.fold((l) => state = AllLedgerState.error(l.message), (r) {
          allLedgers = r;
          return state = AllLedgerState.loaded(ledgers: r);
        });
      } catch (e) {
        state = AllLedgerState.error(e.toString());
      }
    }
  }

  LedgerAccountEntity? getLedgerById(String ledgerIDPK) {
    try {
      return allLedgers.firstWhere(
        (ledger) => ledger.ledgerIdpk == ledgerIDPK,
        orElse: () => throw Exception("Ledger not found"),
      );
    } catch (_) {
      return null;
    }
  }
}
