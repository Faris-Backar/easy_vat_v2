import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_state.freezed.dart';

@freezed
class StoreState with _$StoreState {
  const factory StoreState.initial() = _Initial;
  const factory StoreState.loading() = _Loading;
  const factory StoreState.loaded({required List<StoreEntity> storeList}) =
      _Loaded;
  const factory StoreState.error(String message) = _Error;
}
