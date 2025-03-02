import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_state.freezed.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState.initial() = _Initial;
  const factory ItemState.loading() = _Loading;
  const factory ItemState.loaded({required List<ItemEntity> itemsList}) =
      _Loaded;
  const factory ItemState.failure({required String error}) = _Failure;
}
