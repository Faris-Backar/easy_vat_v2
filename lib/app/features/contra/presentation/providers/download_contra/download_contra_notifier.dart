import 'package:easy_vat_v2/app/features/contra/domain/usecase/contra/download_contra_usecase.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra/contra_notifier.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/download_contra/download_contra_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadContraUsecase = Provider(
  (ref) => DownloadContraUsecase(
      contraRepository: ref.read(contraRepositoryProvider)),
);

final downloadContraNotifierProvider =
    StateNotifierProvider<DownloadContraNotifiers, DownloadContraState>((ref) {
  return DownloadContraNotifiers(
      contraUsecase: ref.read(downloadContraUsecase));
});

class DownloadContraNotifiers extends StateNotifier<DownloadContraState> {
  final DownloadContraUsecase contraUsecase;

  DownloadContraNotifiers({required this.contraUsecase})
      : super(DownloadContraState.initial());

  downloadContra({required String contraIDPK}) async {
    state = DownloadContraState.initial();
    state = DownloadContraState.loading();
    try {
      final result = await contraUsecase.call(params: contraIDPK);
      result.fold((l) => state = DownloadContraState.failure(l.message), (r) {
        state = DownloadContraState.downloadCompleted(r);
      });
    } catch (e) {
      state = DownloadContraState.failure(e.toString());
    }
  }
}
