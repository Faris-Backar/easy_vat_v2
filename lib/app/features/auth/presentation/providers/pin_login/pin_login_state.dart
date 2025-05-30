import 'package:easy_vat_v2/app/features/auth/domain/entities/pin_login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_login_state.freezed.dart';

@freezed
class PinLoginState with _$PinLoginState {
  const factory PinLoginState.initial() = _Initial;
  const factory PinLoginState.loading() = _Loading;
  const factory PinLoginState.success({required PinLoginEntity loginResponse}) =
      _Success;
  const factory PinLoginState.failed(String error) = _Failed;
}
