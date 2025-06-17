import 'package:easy_vat_v2/app/features/income/data/repository/income_repository_impl.dart';
import 'package:easy_vat_v2/app/features/income/domain/entities/income_entity.dart';
import 'package:easy_vat_v2/app/features/income/domain/repositories/income_repository.dart';
import 'package:easy_vat_v2/app/features/income/domain/usecase/params/income_params.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income/income_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final incomeRepositoryProvider = Provider<IncomeRepository>((ref) {
  return IncomeRepositoryImpl();
});

final incomeNotifierProvider =
    StateNotifierProvider<IncomeNotifiers, IncomeState>((ref) {
  return IncomeNotifiers(incomeRepository: ref.read(incomeRepositoryProvider));
});

class IncomeNotifiers extends StateNotifier<IncomeState> {
  final IncomeRepository incomeRepository;
  List<IncomeListEntity>? incomeList;
  DateTime? fromDate;
  DateTime? toDate;

  IncomeNotifiers({required this.incomeRepository})
      : super(IncomeState.initial());

  fetchIncome({required IncomeParams params}) async {
    state = const IncomeState.initial();
    final result =
        await incomeRepository.getIncome(incomeRequestParams: params);
    result.fold((failure) => state = IncomeState.failure(failure.message),
        (income) {
      incomeList = income.incomeList;
      double totalAmount = 0.0;
      for (var i = 0; i < (income.incomeList?.length ?? 0); i++) {
        totalAmount += income.incomeList?[i].netTotal ?? 0.0;
      }
      return state = IncomeState.success(
          income: income.incomeList ?? [], totalAmount: totalAmount);
    });
  }

  searchIncome(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (incomeList?.length ?? 0.0); i++) {
        totalAmount += incomeList?[i].netTotal ?? 0.0;
      }
      state = IncomeState.success(
          income: incomeList ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = incomeList?.where((income) {
            return (income.referenceNo?.contains(query) ?? false) ||
                (income.customerName
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].netTotal ?? 0.0;
      }
      state =
          IncomeState.success(income: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
