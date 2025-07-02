import 'package:easy_vat_v2/app/features/income/domain/usecase/income/download_income_usecase.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/download_income/download_income_state.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income/income_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadIncomeUsecase = Provider((ref) => DownloadIncomeUsecase(
    incomeRepository: ref.read(incomeRepositoryProvider)));

final downloadIncomeNotifierProvider =
    StateNotifierProvider<DownloadIncomeNotifiers, DownloadIncomeState>((ref) {
  return DownloadIncomeNotifiers(
      incomeUsecase: ref.read(downloadIncomeUsecase));
});

class DownloadIncomeNotifiers extends StateNotifier<DownloadIncomeState> {
  final DownloadIncomeUsecase incomeUsecase;

  DownloadIncomeNotifiers({required this.incomeUsecase})
      : super(DownloadIncomeState.initial());

  downloadIncome({required String incomeIDPK}) async {
    state = DownloadIncomeState.initial();
    state = DownloadIncomeState.loading();
    try {
      final result = await incomeUsecase.call(params: incomeIDPK);
      result.fold((l) => state = DownloadIncomeState.failure(l.message), (r) {
        state = DownloadIncomeState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadIncomeState.failure(e.toString());
    }
  }
}
