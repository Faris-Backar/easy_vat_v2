import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/country/data/model/country_state_model.dart';
import 'package:easy_vat_v2/app/features/country/domain/entity/country_state_entity.dart';
import 'package:easy_vat_v2/app/features/country/domain/repositories/country_state_repository.dart';

class CountryStateRepositoryImpl extends CountryStateRepository {
  CountryStateRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, List<CountryStateEntity>>> fetchCountryState() async {
    try {
      final response = await client.get(UrlResources.getState);
      if (response.statusCode == 200) {
        List<CountryStateModel> stateList = (response.data as List)
            .map((json) => CountryStateModel.fromJson(json))
            .toList();
        return Right(stateList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
