import 'package:easy_vat_v2/app/features/income/data/model/income_request_model.dart';
import 'package:easy_vat_v2/app/features/income/domain/usecase/income/update_income_usecase.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income/income_notifier.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/update_income/update_income_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateIncomeUsecaseProvider = Provider<UpdateIncomeUsecase>((ref) {
  return UpdateIncomeUsecase(
      incomeRepository: ref.read(incomeRepositoryProvider));
});

final updateIncomeNotifierProvider =
    StateNotifierProvider<UpdateIncomeNotifier, UpdateIncomeState>((ref) {
  return UpdateIncomeNotifier(
      updateIncomeUsecase: ref.read(updateIncomeUsecaseProvider));
});

class UpdateIncomeNotifier extends StateNotifier<UpdateIncomeState> {
  final UpdateIncomeUsecase updateIncomeUsecase;

  UpdateIncomeNotifier({required this.updateIncomeUsecase})
      : super(UpdateIncomeState.initial());

  updateIncome({required IncomeRequestModel request}) async {
    state = UpdateIncomeState.initial();
    state = UpdateIncomeState.loading();
    try {
      final result = await updateIncomeUsecase.call(params: request);

      result.fold((l) => state = UpdateIncomeState.failure(l.message),
          (r) => state = UpdateIncomeState.success());
    } catch (e) {
      state = UpdateIncomeState.failure(e.toString());
    }
  }
}
