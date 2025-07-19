import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/country/data/model/country_model.dart';
import 'package:easy_vat_v2/app/features/country/domain/entity/country_entity.dart';
import 'package:easy_vat_v2/app/features/country/domain/repositories/country_repository.dart';

class CountryRepositoryImpl extends CountryRepository {
  CountryRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, List<CountryEntity>>> fetchCountry() async {
    try {
      final response = await client.get(UrlResources.getCountry);
      log("Response: $response");
      if (response.statusCode == 200) {
        List<CountryModel> countryList = (response.data as List)
            .map((json) => CountryModel.fromJson(json))
            .toList();
        return Right(countryList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
