import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_contra_state.freezed.dart';

@freezed
class DeleteContraState with _$DeleteContraState {
  const factory DeleteContraState.initial() = _Initial;
  const factory DeleteContraState.loading() = _Loading;
  const factory DeleteContraState.success() = _Success;
  const factory DeleteContraState.failure(String error) = _Failure;
}
