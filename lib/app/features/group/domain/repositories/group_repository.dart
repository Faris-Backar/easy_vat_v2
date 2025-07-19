import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/group/domain/entity/group_entity.dart';

abstract class GroupRepository {
  Future<Either<Failure, List<GroupEntity>>> fetchGroup();
}
