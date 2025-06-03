import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_vat_v2/app/features/expense/data/repository/expense_repository_impl.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';
import 'package:easy_vat_v2/app/features/expense/domain/repositories/expense_repository.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_params.dart';
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
      : super(ExpenseState.initial());

  fetchExpenses({required ExpenseParams params}) async {
    state = const ExpenseState.loading();
    final result =
        await expenseRepository.getExpense(expenseRequestParams: params);
    result.fold(
      (failure) => state = ExpenseState.failure(failure.message),
      (expense) {
        expenseList = expense.expenseList;
        double totalAmount = 0.0;
        for (var i = 0; i < (expense.expenseList?.length ?? 0.0); i++) {
          totalAmount += expense.expenseList?[i].netTotal ?? 0.0;
        }
        return state = ExpenseState.success(
            expenses: expense.expenseList ?? [], totalAmount: totalAmount);
      },
    );
  }

  searchExpense(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (expenseList?.length ?? 0.0); i++) {
        totalAmount += expenseList?[i].netTotal ?? 0.0;
      }
      state = ExpenseState.success(
          expenses: expenseList ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = expenseList?.where((expense) {
            return (expense.referenceNo?.contains(query) ?? false) ||
                (expense.supplierName
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].netTotal ?? 0.0;
      }
      state = ExpenseState.success(
          expenses: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
//   void filterExpenses({required ExpenseFilterParam params}) {
//     if (params.clearAllFilter) {
//       state = ExpenseState.success(expenseList ?? []);
//       return;
//     } else {
//       if (expenseList == null) return;

//       final filtered = expenseList!.where((expense) {
//         final matchesPaymentMode = params.paymentMode == null ||
//             (expense.paymentMode != null &&
//                 expense.paymentMode!.toLowerCase() ==
//                     params.paymentMode!.toLowerCase());

//         final matchesSupplier = params.supplier == null ||
//             (expense.supplierName!.toLowerCase() ==
//                 params.supplier?.toLowerCase());

//         return matchesPaymentMode && matchesSupplier;
//       }).toList();

//       state = ExpenseState.success(filtered);
//     }
//   }

//   clearDates() {
//     fromDate = null;
//     toDate = null;
//   }
// }
