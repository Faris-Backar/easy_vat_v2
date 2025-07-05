import 'package:easy_vat_v2/app/features/contra/data/model/contra_request_model.dart';
import 'package:easy_vat_v2/app/features/contra/domain/usecase/contra/update_contra_usecase.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra/contra_notifier.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/update_contra/update_contra_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateContraUsecaseProvider = Provider<UpdateContraUsecase>((ref) {
  return UpdateContraUsecase(
      contraRepository: ref.read(contraRepositoryProvider));
});

final updateContraNotifierProvider =
    StateNotifierProvider<UpdateContraNotifier, UpdateContraState>((ref) {
  return UpdateContraNotifier(
      updateContraUsecase: ref.read(updateContraUsecaseProvider));
});

class UpdateContraNotifier extends StateNotifier<UpdateContraState> {
  final UpdateContraUsecase updateContraUsecase;

  UpdateContraNotifier({required this.updateContraUsecase})
      : super(UpdateContraState.initial());

  updateContra({required ContraRequestModel request}) async {
    state = UpdateContraState.initial();
    state = UpdateContraState.loading();
    try {
      final result = await updateContraUsecase.call(params: request);

      result.fold((l) => state = UpdateContraState.failure(l.message),
          (r) => state = UpdateContraState.success());
    } catch (e) {
      state = UpdateContraState.failure(e.toString());
    }
  }
}
