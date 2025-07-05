import 'package:easy_vat_v2/app/features/dividend/domain/usecase/dividend/delete_dividend_usecase.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/usecase/params/dividend_params.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/delete_dividend/delete_dividend_state.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend/dividend_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteDividendUsecase = Provider<DeleteDividendUsecase>((ref) {
  return DeleteDividendUsecase(
      dividendRepository: ref.read(dividendRepositoryProvider));
});

final deleteDividendNotifierProvider =
    StateNotifierProvider<DeleteDividendNotifier, DeleteDividendState>((ref) {
  return DeleteDividendNotifier(
      deleteDividendUsecase: ref.read(deleteDividendUsecase));
});

class DeleteDividendNotifier extends StateNotifier<DeleteDividendState> {
  final DeleteDividendUsecase deleteDividendUsecase;
  DeleteDividendNotifier({required this.deleteDividendUsecase})
      : super(DeleteDividendState.initial());

  deleteDividend({required DividendParams request}) async {
    state = DeleteDividendState.initial();
    state = DeleteDividendState.loading();
    try {
      final result = await deleteDividendUsecase.call(params: request);

      result.fold((l) => state = DeleteDividendState.failure(l.message),
          (r) => state = DeleteDividendState.success());
    } catch (e) {
      state = DeleteDividendState.failure(e.toString());
    }
  }
}
