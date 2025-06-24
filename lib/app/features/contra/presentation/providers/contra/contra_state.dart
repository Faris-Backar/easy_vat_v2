import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contra_state.freezed.dart';

@freezed
abstract class ContraState with _$ContraState {
  const factory ContraState.initial() = _Initial;
  const factory ContraState.loading() = _Loading;
  const factory ContraState.success(
      {required List<ContraEntryEntity> contra,
      double? totalAmount}) = _Success;
  const factory ContraState.failure(String error) = _Failure;
}
