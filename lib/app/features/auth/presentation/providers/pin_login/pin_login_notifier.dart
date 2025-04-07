import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:easy_vat_v2/app/features/auth/domain/repository/auth_repository.dart';
import 'package:easy_vat_v2/app/features/auth/domain/usecase/pin_login_usecase.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/providers/pin_login/pin_login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

final pinLoginUsecaseProvider = Provider<PinLoginUsecase>((ref) {
  return PinLoginUsecase(authRepository: ref.read(authRepositoryProvider));
});

final pinLoginProvider =
    StateNotifierProvider<PinLoginNotifier, PinLoginState>((ref) {
  return PinLoginNotifier(loginUsecase: ref.read(pinLoginUsecaseProvider));
});

class PinLoginNotifier extends StateNotifier<PinLoginState> {
  final PinLoginUsecase loginUsecase;
  PinLoginNotifier({required this.loginUsecase})
      : super(PinLoginState.initial());

  pinLogin({required String params}) async {
    state = PinLoginState.loading();
    final result = await loginUsecase.call(params: params);
    result.fold((l) => state = PinLoginState.failed(l.message), (r) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(PrefResources.isAuthenticated, true);
      await prefs.setBool(PrefResources.isTaxEnabled,
          r.userDetails?.appSettings?.enableTaxCalculation ?? false);
      state = PinLoginState.success(loginResponse: r);
    });
  }
}
