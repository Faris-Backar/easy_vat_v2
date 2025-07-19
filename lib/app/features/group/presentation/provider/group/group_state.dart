import 'package:easy_vat_v2/app/features/group/domain/entity/group_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_state.freezed.dart';

@freezed
class GroupState with _$GroupState {
  const factory GroupState.initial() = _Initial;
  const factory GroupState.loading() = _Loading;
  const factory GroupState.loaded({required List<GroupEntity> group}) = _Loaded;
  const factory GroupState.error(String message) = _Error;
}
