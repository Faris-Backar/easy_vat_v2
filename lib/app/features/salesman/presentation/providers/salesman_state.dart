import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salesman_state.freezed.dart';

@freezed
class SalesManState with _$SalesManState {
  const factory SalesManState.initial() = _Initial;
  const factory SalesManState.loading() = _Loading;
  const factory SalesManState.loaded(
      {required List<SalesManEntity> salesManList}) = _Loaded;
  const factory SalesManState.error(String message) = _Error;
}
