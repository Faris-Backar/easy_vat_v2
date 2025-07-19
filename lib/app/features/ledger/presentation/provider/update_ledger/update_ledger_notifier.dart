import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_request_model.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/update_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/expense_ledger/expense_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/update_ledger/update_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateLedgerUsecaseProvider = Provider<UpdateLedgerUsecase>((ref) {
  return UpdateLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final updateLedgerNotifierProvider =
    StateNotifierProvider<UpdateLedgerNotifier, UpdateLedgerState>((ref) {
  return UpdateLedgerNotifier(
      updateLedgerUsecase: ref.read(updateLedgerUsecaseProvider));
});

class UpdateLedgerNotifier extends StateNotifier<UpdateLedgerState> {
  final UpdateLedgerUsecase updateLedgerUsecase;
  UpdateLedgerNotifier({required this.updateLedgerUsecase})
      : super(UpdateLedgerState.initial());

  updateLedger({required LedgerRequestModel request}) async {
    state = UpdateLedgerState.initial();
    state = UpdateLedgerState.loading();
    try {
      final result = await updateLedgerUsecase.call(params: request);
      result.fold((l) => state = UpdateLedgerState.failure(l.message),
          (r) => state = UpdateLedgerState.success());
    } catch (e) {
      state = UpdateLedgerState.failure(e.toString());
    }
  }
}
