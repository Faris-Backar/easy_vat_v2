import 'dart:developer';

import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:easy_vat_v2/app/features/auth/domain/repository/auth_repository.dart';
import 'package:easy_vat_v2/app/features/auth/domain/usecase/params/login_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/auth/domain/usecase/login_usecase.dart';
import 'package:easy_vat_v2/app/features/auth/presentation/providers/user_login/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

final loginUsecaseProvider = Provider<LoginUsecase>((ref) {
  return LoginUsecase(authRepository: ref.read(authRepositoryProvider));
});

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(loginUsecase: ref.read(loginUsecaseProvider));
});

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUsecase loginUsecase;
  LoginNotifier({required this.loginUsecase}) : super(LoginState.initial());

  login({required LoginParams params}) async {
    state = LoginState.loading();
    final result = await loginUsecase.call(params: params);
    result.fold((l) => state = LoginState.failed(l.message), (r) async {
      log("company detials => $r");
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(PrefResources.token, r.accessTokens ?? "");
      baseUrl = r.companyDetails?.first.connectionInfo ?? "";
      List<String> companyPermissions = [];
      for (var i = 0;
          i < (r.companyDetails?.first.companyPermission?.length ?? 0);
          i++) {
        companyPermissions
            .add(r.companyDetails?.first.companyPermission?[i].formId ?? "");
      }
      // Ensure the URL starts with "https://"
      if (!baseUrl.startsWith("http://") && !baseUrl.startsWith("https://")) {
        baseUrl = "https://$baseUrl/";
      }
      prefs.setString(PrefResources.baseUrl, baseUrl);
      prefs.setStringList(PrefResources.comapnyPermissions, companyPermissions);
      state = LoginState.success(loginResponse: r);
    });
  }
}
