import 'package:easy_vat_v2/app/features/expense/domain/usecase/expense/download_expense_usecase.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/download_expense/download_expense_state.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadExpenseUsecase = Provider((ref) => DownloadExpenseUsecase(
    expenseRepository: ref.read(expenseRepositoryProvider)));

final downloadExpenseNotifierProvider =
    StateNotifierProvider<DownloadExpenseNotifiers, DownloadExpenseState>(
        (ref) {
  return DownloadExpenseNotifiers(
      expenseUseCase: ref.read(downloadExpenseUsecase));
});

class DownloadExpenseNotifiers extends StateNotifier<DownloadExpenseState> {
  final DownloadExpenseUsecase expenseUseCase;

  DownloadExpenseNotifiers({required this.expenseUseCase})
      : super(DownloadExpenseState.initial());

  downloadExpense({required String expenseIDPK}) async {
    state = DownloadExpenseState.initial();
    state = DownloadExpenseState.loading();
    try {
      final result = await expenseUseCase.call(params: expenseIDPK);
      result.fold((l) => state = DownloadExpenseState.failure(l.message), (r) {
        state = DownloadExpenseState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadExpenseState.failure(e.toString());
    }
  }
}
