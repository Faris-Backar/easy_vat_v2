import 'package:easy_vat_v2/app/features/contra/data/model/contra_request_model.dart';
import 'package:easy_vat_v2/app/features/contra/domain/usecase/contra/create_contra_usecase.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra/contra_notifier.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/create_contra/create_contra_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createContraUsecaseProvider = Provider<CreateContraUsecase>(
  (ref) {
    return CreateContraUsecase(
        contraRepository: ref.read(contraRepositoryProvider));
  },
);

final createContraNotifierProvider =
    StateNotifierProvider<CreateContraNotifier, CreateContraState>((ref) {
  return CreateContraNotifier(
      createContraUsecase: ref.read(createContraUsecaseProvider));
});

class CreateContraNotifier extends StateNotifier<CreateContraState> {
  final CreateContraUsecase createContraUsecase;
  CreateContraNotifier({required this.createContraUsecase})
      : super(CreateContraState.initial());

  createContra({required ContraRequestModel request}) async {
    state = CreateContraState.initial();
    state = CreateContraState.loading();
    try {
      final result = await createContraUsecase.call(params: request);
      result.fold(
          (l) => state = CreateContraState.failure(l.message),
          (r) => state =
              CreateContraState.success(r.contraEntry?.first.contraIDPK ?? ""));
    } catch (e) {
      state = CreateContraState.failure(e.toString());
    }
  }
}
