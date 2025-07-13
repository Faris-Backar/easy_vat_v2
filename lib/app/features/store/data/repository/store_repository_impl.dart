import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/store/data/model/store_model.dart';
import 'package:easy_vat_v2/app/features/store/domain/entities/store_entity.dart';
import 'package:easy_vat_v2/app/features/store/domain/repositories/store_repository.dart';

class StoreRepositoryImpl extends StoreRepository {
  StoreRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, List<StoreEntity>>> getStore() async {
    try {
      final response = await client.get(UrlResources.getStore);
      log("store: $response");
      if (response.statusCode == 200) {
        List<StoreModel> storeList = (response.data as List)
            .map((json) => StoreModel.fromJson(json))
            .toList();
        return Right(storeList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
