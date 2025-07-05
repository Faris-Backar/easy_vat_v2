import 'package:easy_vat_v2/app/features/dividend/data/repository/dividend_repository_impl.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/repositories/dividend_repository.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/usecase/params/dividend_params.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend/dividend_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dividendRepositoryProvider = Provider<DividendRepository>((ref) {
  return DividendRepositoryImpl();
});

final dividendNotifierProvider =
    StateNotifierProvider<DividendNotifiers, DividendState>((ref) {
  return DividendNotifiers(
      dividendRepository: ref.read(dividendRepositoryProvider));
});

class DividendNotifiers extends StateNotifier<DividendState> {
  final DividendRepository dividendRepository;
  List<DividendListEntity>? dividendList;
  DateTime? fromDate;
  DateTime? toDate;

  DividendNotifiers({required this.dividendRepository})
      : super(DividendState.initial());

  fetchDividend({required DividendParams params}) async {
    state = const DividendState.loading();
    final result =
        await dividendRepository.getDividend(dividendRequestParams: params);
    result.fold(
      (failure) => state = DividendState.failure(failure.message),
      (dividend) {
        dividendList = dividend.dividend;
        double totalAmount = 0.0;
        for (var i = 0; i < (dividend.dividend?.length ?? 0.0); i++) {
          totalAmount += dividend.dividend?[i].netTotal ?? 0.0;
        }
        return state = DividendState.success(
            dividend: dividend.dividend ?? [], totalAmount: totalAmount);
      },
    );
  }

  searchDividend(String query) {
    double totalAmount = 0.0;
    if (query.isEmpty) {
      for (var i = 0; i < (dividendList?.length ?? 0.0); i++) {
        totalAmount += dividendList?[i].netTotal ?? 0.0;
      }
      state = DividendState.success(
          dividend: dividendList ?? [], totalAmount: totalAmount);
    } else {
      final filteredData = dividendList?.where((dividend) {
            return (dividend.referenceNo?.contains(query) ?? false) ||
                (dividend.dividendIDPK
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false);
          }).toList() ??
          [];
      for (var i = 0; i < (filteredData.length); i++) {
        totalAmount += filteredData[i].netTotal ?? 0.0;
      }
      state = DividendState.success(
          dividend: filteredData, totalAmount: totalAmount);
    }
  }

  clearDates() {
    fromDate = null;
    toDate = null;
  }
}
