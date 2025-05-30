import 'package:easy_vat_v2/app/features/auth/domain/entities/server_login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success({required ServerLoginEntity loginResponse}) =
      _Success;
  const factory LoginState.failed(String error) = _Failed;
}
