import 'package:easy_vat_v2/app/features/ledger/domain/usecase/delete_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/params/ledger_params.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_bank_ledgers/cash_bank_ledger_notfier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/delete_ledger/delete_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteLedgerUsecase = Provider<DeleteLedgerUsecase>((ref) {
  return DeleteLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final deleteLedgerNotifierProvider =
    StateNotifierProvider<DeleteLedgerNotifier, DeleteLedgerState>((ref) {
  return DeleteLedgerNotifier(
      deleteLedgerUsecase: ref.read(deleteLedgerUsecase));
});

class DeleteLedgerNotifier extends StateNotifier<DeleteLedgerState> {
  final DeleteLedgerUsecase deleteLedgerUsecase;
  DeleteLedgerNotifier({required this.deleteLedgerUsecase})
      : super(DeleteLedgerState.initial());

  deleteLedger({required LedgerParams request}) async {
    state = DeleteLedgerState.initial();
    state = DeleteLedgerState.loading();
    try {
      final result = await deleteLedgerUsecase.call(params: request);
      result.fold((l) => state = DeleteLedgerState.failure(l.message),
          (r) => state = DeleteLedgerState.success());
    } catch (e) {
      state = DeleteLedgerState.failure(e.toString());
    }
  }
}
