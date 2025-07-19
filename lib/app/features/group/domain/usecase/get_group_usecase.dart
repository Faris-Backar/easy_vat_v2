import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/group/domain/entity/group_entity.dart';
import 'package:easy_vat_v2/app/features/group/domain/repositories/group_repository.dart';

class GetGroupUsecase
    extends UseCase<Either<Failure, List<GroupEntity>>, NoParams> {
  final GroupRepository groupRepository;

  GetGroupUsecase({required this.groupRepository});
  @override
  Future<Either<Failure, List<GroupEntity>>> call(
      {required NoParams params}) async {
    return await groupRepository.fetchGroup();
  }
}
