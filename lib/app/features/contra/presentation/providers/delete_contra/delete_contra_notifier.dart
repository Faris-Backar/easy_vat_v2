import 'package:easy_vat_v2/app/features/contra/domain/usecase/contra/delete_contra_usecase.dart';
import 'package:easy_vat_v2/app/features/contra/domain/usecase/params/contra_params.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra/contra_notifier.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/delete_contra/delete_contra_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteContraUsecase = Provider<DeleteContraUsecase>((ref) {
  return DeleteContraUsecase(
      contraRepository: ref.read(contraRepositoryProvider));
});

final deleteContraNotifierProvider =
    StateNotifierProvider<DeleteContraNotifier, DeleteContraState>((ref) {
  return DeleteContraNotifier(
      deleteContraUsecase: ref.read(deleteContraUsecase));
});

class DeleteContraNotifier extends StateNotifier<DeleteContraState> {
  final DeleteContraUsecase deleteContraUsecase;

  DeleteContraNotifier({required this.deleteContraUsecase})
      : super(DeleteContraState.initial());

  deleteContra({required ContraParams request}) async {
    state = DeleteContraState.initial();
    state = DeleteContraState.loading();
    try {
      final result = await deleteContraUsecase.call(params: request);

      result.fold((l) => state = DeleteContraState.failure(l.message),
          (r) => state = DeleteContraState.success());
    } catch (e) {
      state = DeleteContraState.failure(e.toString());
    }
  }
}
