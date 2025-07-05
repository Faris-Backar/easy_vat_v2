import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_contra_state.freezed.dart';

@freezed
class CreateContraState with _$CreateContraState {
  const factory CreateContraState.initial() = _Initial;
  const factory CreateContraState.loading() = _Loading;
  const factory CreateContraState.success(String contraIDPK) = _Success;
  const factory CreateContraState.failure(String error) = _Failure;
}
