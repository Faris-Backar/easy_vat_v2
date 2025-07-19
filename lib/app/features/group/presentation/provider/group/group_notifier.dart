import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/group/data/repository/group_repository_impl.dart';
import 'package:easy_vat_v2/app/features/group/domain/repositories/group_repository.dart';
import 'package:easy_vat_v2/app/features/group/domain/usecase/get_group_usecase.dart';
import 'package:easy_vat_v2/app/features/group/presentation/provider/group/group_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupRepositoryProvider = Provider<GroupRepository>((ref) {
  return GroupRepositoryImpl();
});

final getGroupUsecaseProvider = Provider<GetGroupUsecase>((ref) {
  return GetGroupUsecase(groupRepository: ref.read(groupRepositoryProvider));
});

final groupProvider = StateNotifierProvider<GroupNotifier, GroupState>((ref) {
  return GroupNotifier(getGroupUsecase: ref.read(getGroupUsecaseProvider));
});

class GroupNotifier extends StateNotifier<GroupState> {
  final GetGroupUsecase getGroupUsecase;
  GroupNotifier({required this.getGroupUsecase}) : super(GroupState.initial());

  getGroup() async {
    state = GroupState.loading();
    try {
      final result = await getGroupUsecase.call(params: NoParams());
      result.fold((l) => state = GroupState.error(l.message),
          (r) => state = GroupState.loaded(group: r));
    } catch (e) {
      state = GroupState.error(e.toString());
    }
  }
}
