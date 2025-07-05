import 'package:easy_vat_v2/app/features/dividend/data/model/dividend_request_model.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/usecase/dividend/update_dividend_usecase.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend/dividend_notifier.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/update_dividend/update_dividend_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateDividendUsecaseProvider = Provider<UpdateDividendUsecase>((ref) {
  return UpdateDividendUsecase(
      dividendRepository: ref.read(dividendRepositoryProvider));
});

final updateDividendNotifierProvider =
    StateNotifierProvider<UpdateDividendNotifier, UpdateDividendState>((ref) {
  return UpdateDividendNotifier(
      updateDividendUsecase: ref.read(updateDividendUsecaseProvider));
});

class UpdateDividendNotifier extends StateNotifier<UpdateDividendState> {
  final UpdateDividendUsecase updateDividendUsecase;

  UpdateDividendNotifier({required this.updateDividendUsecase})
      : super(UpdateDividendState.initial());

  updateDividend({required DividendRequestModel request}) async {
    state = UpdateDividendState.initial();
    state = UpdateDividendState.loading();
    try {
      final result = await updateDividendUsecase.call(params: request);

      result.fold((l) => state = UpdateDividendState.failure(l.message),
          (r) => state = UpdateDividendState.success());
    } catch (e) {
      state = UpdateDividendState.failure(e.toString());
    }
  }
}
