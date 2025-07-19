import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_request_model.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/create_ledger_usecase.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_bank_ledgers/cash_bank_ledger_notfier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/create_ledger/create_ledger_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createLedgerUsecaseProvider = Provider<CreateLedgerUsecase>((ref) {
  return CreateLedgerUsecase(
      ledgerRepository: ref.read(ledgerRepositoryProvider));
});

final createLedgerNotifierProvider =
    StateNotifierProvider<CreateLedgerNotifier, CreateLedgerState>((ref) {
  return CreateLedgerNotifier(
      createLedgerUsecase: ref.read(createLedgerUsecaseProvider));
});

class CreateLedgerNotifier extends StateNotifier<CreateLedgerState> {
  final CreateLedgerUsecase createLedgerUsecase;
  CreateLedgerNotifier({required this.createLedgerUsecase})
      : super(CreateLedgerState.initial());

  createLedger({required LedgerRequestModel request}) async {
    state = CreateLedgerState.initial();
    state = CreateLedgerState.loading();
    try {
      final result = await createLedgerUsecase.call(params: request);
      result.fold((l) => state = CreateLedgerState.failure(l.message),
          (r) => state = CreateLedgerState.success(r.ledgerIdpk ?? ""));
    } catch (e) {
      state = CreateLedgerState.failure(e.toString());
    }
  }
}
