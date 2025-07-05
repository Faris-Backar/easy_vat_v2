import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_contra_state.freezed.dart';

@freezed
class UpdateContraState with _$UpdateContraState {
  const factory UpdateContraState.initial() = _Initial;
  const factory UpdateContraState.loading() = _Loading;
  const factory UpdateContraState.success() = _Success;
  const factory UpdateContraState.failure(String error) = _Failure;
}
