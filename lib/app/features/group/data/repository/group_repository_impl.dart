import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/group/data/model/group_model.dart';
import 'package:easy_vat_v2/app/features/group/domain/entity/group_entity.dart';
import 'package:easy_vat_v2/app/features/group/domain/repositories/group_repository.dart';

class GroupRepositoryImpl extends GroupRepository {
  GroupRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, List<GroupEntity>>> fetchGroup() async {
    try {
      final response = await client.get(UrlResources.getGroup);
      if (response.statusCode == 200) {
        List<GroupModel> groupList = (response.data as List)
            .map((json) => GroupModel.fromJson(json))
            .toList();
        return Right(groupList);
      }
      return Left(ServerFailure(message: "Something went wrong"));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
