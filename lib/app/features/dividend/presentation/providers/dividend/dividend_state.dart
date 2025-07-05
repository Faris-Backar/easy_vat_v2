import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dividend_state.freezed.dart';

@freezed
abstract class DividendState with _$DividendState {
  const factory DividendState.initial() = _Initial;
  const factory DividendState.loading() = _Loading;
  const factory DividendState.success(
      {required List<DividendListEntity> dividend,
      double? totalAmount}) = _Success;
  const factory DividendState.failure(String error) = _Failure;
}
