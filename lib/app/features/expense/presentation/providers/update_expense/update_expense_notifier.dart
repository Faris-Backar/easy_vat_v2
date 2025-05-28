import 'package:easy_vat_v2/app/features/expense/data/model/expense_request_model.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/expense/update_expense_usecase.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_notifier.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/update_expense/update_expense_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateExpenseUsecaseProvider = Provider<UpdateExpenseUsecase>((ref) {
  return UpdateExpenseUsecase(
      expenseRepository: ref.read(expenseRepositoryProvider));
});

final updateExpenseNotifierProvider =
    StateNotifierProvider<UpdateExpenseNotifier, UpdateExpenseState>((ref) {
  return UpdateExpenseNotifier(
      updateExpenseUsecase: ref.read(updateExpenseUsecaseProvider));
});

class UpdateExpenseNotifier extends StateNotifier<UpdateExpenseState> {
  final UpdateExpenseUsecase updateExpenseUsecase;

  UpdateExpenseNotifier({
    required this.updateExpenseUsecase,
  }) : super(UpdateExpenseState.initial());

  updateExpense({required ExpenseRequestModel request}) async {
    state = UpdateExpenseState.initial();
    state = UpdateExpenseState.loading();
    try {
      final result = await updateExpenseUsecase.call(params: request);

      result.fold((l) => state = UpdateExpenseState.failure(l.message),
          (r) => state = UpdateExpenseState.success());
    } catch (e) {
      state = UpdateExpenseState.failure(e.toString());
    }
  }
}
