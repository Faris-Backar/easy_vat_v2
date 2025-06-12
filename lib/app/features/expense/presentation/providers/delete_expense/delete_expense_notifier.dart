import 'package:easy_vat_v2/app/features/expense/domain/usecase/expense/delete_expense_usecase.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_params.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/delete_expense/delete_expense_state.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteExpenseUsecase = Provider<DeleteExpenseUsecase>(
  (ref) {
    return DeleteExpenseUsecase(
        expenseRepository: ref.read(expenseRepositoryProvider));
  },
);

final deleteExpenseNotifierProvider =
    StateNotifierProvider<DeleteExpenseNotifier, DeleteExpenseState>((ref) {
  return DeleteExpenseNotifier(
      deleteExpenseUsecase: ref.read(deleteExpenseUsecase));
});

class DeleteExpenseNotifier extends StateNotifier<DeleteExpenseState> {
  final DeleteExpenseUsecase deleteExpenseUsecase;

  DeleteExpenseNotifier({required this.deleteExpenseUsecase})
      : super(DeleteExpenseState.initial());

  deleteExpense({required ExpenseParams request}) async {
    state = DeleteExpenseState.initial();
    state = DeleteExpenseState.loading();
    try {
      final result = await deleteExpenseUsecase.call(params: request);

      result.fold((l) => state = DeleteExpenseState.failure(l.message),
          (r) => state = DeleteExpenseState.success());
    } catch (e) {
      state = DeleteExpenseState.failure(e.toString());
    }
  }
}
