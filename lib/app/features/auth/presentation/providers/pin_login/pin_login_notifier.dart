import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/auth/data/model/pin_login_model.dart';
import 'package:easy_vat_v2/app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:easy_vat_v2/app/features/auth/domain/repository/auth_repository.dart';
import 'package:easy_vat_v2/app/features/auth/domain/usecase/pin_login_usecase.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/functions/app_credential_preference_helper.dart';
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
      if (r.userDetails?.companyInfo != null) {
        final companyInfo = CompanyInfo.fromEntity(r.userDetails!.companyInfo!);
        AppCredentialPreferenceHelper().saveCompanyInfo(companyInfo);
      }
      if (r.userDetails?.appSettings != null) {
        final appSettings =
            AppSettingsModel.fromEntity(r.userDetails!.appSettings!);
        AppCredentialPreferenceHelper().saveAppSettings(appSettings);
      }
      if (r.userDetails?.cashAccountDetails != null) {
        final cashAccountDetails = CashAccountDetailsModel.fromEntity(
            r.userDetails!.cashAccountDetails!);
        AppCredentialPreferenceHelper()
            .saveCashAccountDetails(cashAccountDetails);
      }
      if (r.userDetails?.storeDetails != null) {
        final storeDetails =
            StoreDetailsModel.fromEntity(r.userDetails!.storeDetails!);
        AppCredentialPreferenceHelper().saveStoreDetails(storeDetails);
      }

      prefs.setString(
          PrefResources.companyId, r.userDetails?.companyInfo?.companyId ?? "");
      prefs.setString(PrefResources.companyId,
          r.userDetails?.companyInfo?.companyIdpk ?? "");

      state = PinLoginState.success(loginResponse: r);
    });
  }
}
