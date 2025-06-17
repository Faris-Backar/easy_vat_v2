import 'package:easy_vat_v2/app/features/income/domain/usecase/income/delete_income_usecase.dart';
import 'package:easy_vat_v2/app/features/income/domain/usecase/params/income_params.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/delete_income/delete_income_state.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income/income_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteIncomeUsecase = Provider<DeleteIncomeUsecase>((ref) {
  return DeleteIncomeUsecase(
      incomeRepository: ref.read(incomeRepositoryProvider));
});

final deleteIncomeNotifierProvider =
    StateNotifierProvider<DeleteIncomeNotifier, DeleteIncomeState>((ref) {
  return DeleteIncomeNotifier(
      deleteIncomeUsecase: ref.read(deleteIncomeUsecase));
});

class DeleteIncomeNotifier extends StateNotifier<DeleteIncomeState> {
  final DeleteIncomeUsecase deleteIncomeUsecase;

  DeleteIncomeNotifier({required this.deleteIncomeUsecase})
      : super(DeleteIncomeState.initial());

  deleteIncome({required IncomeParams request}) async {
    state = DeleteIncomeState.initial();
    state = DeleteIncomeState.loading();
    try {
      final result = await deleteIncomeUsecase.call(params: request);

      result.fold((l) => state = DeleteIncomeState.failure(l.message),
          (r) => state = DeleteIncomeState.success());
    } catch (e) {
      state = DeleteIncomeState.failure(e.toString());
    }
  }
}
