import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/ledger/data/repository/ledger_repository_impl.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/fetch_ledger/fetch_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ledgerRepositoryProvider = Provider<LedgerRepository>((ref) {
  return LedgerRepositoryImpl();
});

final fetchLedgerNotifierProvider =
    StateNotifierProvider<FetchLedgerNotifier, FetchLedgerState>((ref) {
  return FetchLedgerNotifier(
      fetchLedgerRepository: ref.read(ledgerRepositoryProvider));
});

class FetchLedgerNotifier extends StateNotifier<FetchLedgerState> {
  final LedgerRepository fetchLedgerRepository;
  List<LedgerAccountEntity>? ledger;

  FetchLedgerNotifier({required this.fetchLedgerRepository})
      : super(FetchLedgerState.initial());

  fetchLedger({required NoParams params}) async {
    state = const FetchLedgerState.loading();
    final result = await fetchLedgerRepository.fetchLedger();
    result.fold(
        (failure) => state = FetchLedgerState.error(message: failure.message),
        (result) {
      state = FetchLedgerState.success(ledger: result);
      for (var i = 0; i < (result.length);) {
        return state = FetchLedgerState.success(ledger: result);
      }
    });
  }
}
