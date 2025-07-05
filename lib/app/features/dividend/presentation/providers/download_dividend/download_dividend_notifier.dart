import 'package:easy_vat_v2/app/features/dividend/domain/usecase/dividend/download_dividend_usecase.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend/dividend_notifier.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/download_dividend/download_dividend_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadDividendUsecase = Provider((ref) => DownloadDividendUsecase(
    dividendRepository: ref.read(dividendRepositoryProvider)));

final downloadDividendNotifierProvider =
    StateNotifierProvider<DownloadDividendNotifiers, DownloadDividendState>(
        (ref) {
  return DownloadDividendNotifiers(
      dividendUsecase: ref.read(downloadDividendUsecase));
});

class DownloadDividendNotifiers extends StateNotifier<DownloadDividendState> {
  final DownloadDividendUsecase dividendUsecase;

  DownloadDividendNotifiers({required this.dividendUsecase})
      : super(DownloadDividendState.initial());

  downloadDividend({required String dividendIDPK}) async {
    state = DownloadDividendState.initial();
    state = DownloadDividendState.loading();
    try {
      final result = await dividendUsecase.call(params: dividendIDPK);
      result.fold((l) => state = DownloadDividendState.failure(l.message), (r) {
        state = DownloadDividendState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadDividendState.failure(e.toString());
    }
  }
}
