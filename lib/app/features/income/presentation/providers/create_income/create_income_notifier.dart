import 'package:easy_vat_v2/app/features/income/data/model/income_request_model.dart';
import 'package:easy_vat_v2/app/features/income/domain/usecase/income/create_income_usecase.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/create_income/create_income_state.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income/income_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createIncomeUsecaseProvider = Provider<CreateIncomeUsecase>((ref) {
  return CreateIncomeUsecase(
      incomeRepository: ref.read(incomeRepositoryProvider));
});

final createIncomeNotifierProvider =
    StateNotifierProvider<CreateIncomeNotifier, CreateIncomeState>((ref) {
  return CreateIncomeNotifier(
      createIncomeUsecase: ref.read(createIncomeUsecaseProvider));
});

class CreateIncomeNotifier extends StateNotifier<CreateIncomeState> {
  final CreateIncomeUsecase createIncomeUsecase;
  CreateIncomeNotifier({required this.createIncomeUsecase})
      : super(CreateIncomeState.initial());

  createIncome({required IncomeRequestModel request}) async {
    state = CreateIncomeState.initial();
    state = CreateIncomeState.loading();
    try {
      final result = await createIncomeUsecase.call(params: request);
      result.fold(
          (l) => state = CreateIncomeState.failure(l.message),
          (r) => state =
              CreateIncomeState.success(r.incomeList?.first.incomeIDPK ?? ""));
    } catch (e) {
      state = CreateIncomeState.failure(e.toString());
    }
  }
}
