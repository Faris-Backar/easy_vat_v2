import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_vat_v2/app/features/expense/data/repository/expense_repository_impl.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';
import 'package:easy_vat_v2/app/features/expense/domain/repositories/expense_repository.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_params.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_filter_param.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_state.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepositoryImpl();
});

final expenseNotifierProvider =
    StateNotifierProvider<ExpenseNotifiers, ExpenseState>((ref) {
  return ExpenseNotifiers(
    expenseRepository: ref.read(expenseRepositoryProvider),
  );
});

class ExpenseNotifiers extends StateNotifier<ExpenseState> {
  final ExpenseRepository expenseRepository;
  List<ExpenseListEntity>? expenseList;
  DateTime? fromDate;
  DateTime? toDate;

  ExpenseNotifiers({required this.expenseRepository})
      : super(const ExpenseState.initial());

  fetchExpenses({required ExpenseParams params}) async {
    state = const ExpenseState.loading();
    final result =
        await expenseRepository.getExpense(expenseRequestParams: params);
    result.fold(
      (failure) => state = ExpenseState.failure(failure.message),
      (expense) {
        expenseList = expense.expenseList;
        return state = ExpenseState.success(expense.expenseList ?? []);
      },
    );
  }

  void filterExpenses({required ExpenseFilterParam params}) {
    if (params.clearAllFilter) {
      state = ExpenseState.success(expenseList ?? []);
      return;
    } else {
      if (expenseList == null) return;

      final filtered = expenseList!.where((expense) {
        final matchesPaymentMode = params.paymentMode == null ||
            (expense.paymentMode != null &&
                expense.paymentMode!.toLowerCase() ==
                    params.paymentMode!.toLowerCase());

        final matchesSupplier = params.supplier == null ||
            (expense.supplierName!.toLowerCase() ==
                params.supplier?.toLowerCase());

        return matchesPaymentMode && matchesSupplier;
      }).toList();

      state = ExpenseState.success(filtered);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
