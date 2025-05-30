import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/salesman/data/model/sales_man_model.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/repository/sales_man_repository.dart';

class SalesmanRepositoryImpl extends SalesManRepository {
  SalesmanRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, List<SalesManEntity>>> getSalesMan() async {
    try {
      final response = await client.get(UrlResources.getSalesMan);
      if (response.statusCode == 200) {
        List<SalesManModel> salesManList = (response.data as List)
            .map((json) => SalesManModel.fromJson(json))
            .toList();
        return right(salesManList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}
