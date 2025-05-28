import 'package:easy_vat_v2/app/features/expense/data/model/expense_request_model.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/expense/create_expense_usecase.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/create_expense/create_expense_state.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createExpenseUsecaseProvider = Provider<CreateExpenseUsecase>((ref) {
  return CreateExpenseUsecase(
      expenseRepository: ref.read(expenseRepositoryProvider));
});

final createExpenseNotifierProvider =
    StateNotifierProvider<CreateExpenseNotifier, CreateExpenseState>((ref) {
  return CreateExpenseNotifier(
      createExpenseUsecase: ref.read(createExpenseUsecaseProvider));
});

class CreateExpenseNotifier extends StateNotifier<CreateExpenseState> {
  final CreateExpenseUsecase createExpenseUsecase;
  CreateExpenseNotifier({
    required this.createExpenseUsecase,
  }) : super(CreateExpenseState.initial());

  createExpense({required ExpenseRequestModel request}) async {
    state = CreateExpenseState.initial();
    state = CreateExpenseState.loading();
    try {
      final result = await createExpenseUsecase.call(params: request);

      result.fold(
        (l) => state = CreateExpenseState.failure(l.message),
        (r) => state = CreateExpenseState.success(),
      );
    } catch (e) {
      state = CreateExpenseState.failure(e.toString());
    }
  }
}
