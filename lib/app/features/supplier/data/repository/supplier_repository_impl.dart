import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/supplier/data/model/supplier_model.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/repository/supplier_repository.dart';

class SupplierRepositoryImpl extends SupplierRepository {
  SupplierRepositoryImpl();

  final dio = DioService().dio;

  @override
  Future<Either<Failure, List<SupplierEntity>>> getSuppliers() async {
    try {
      final response = await dio.get(UrlResources.getSuppliers);
      if (response.statusCode == 200) {
        List<SupplierModel> suppliersList = (response.data as List)
            .map((json) => SupplierModel.fromJson(json))
            .toList();
        return Right(suppliersList);
      }
      return Left(ServerFailure(message: "Something Went Wrong"));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<SupplierEntity>>> searchSupplier(
      {required String query}) async {
    try {
      final response = await dio.get(UrlResources.searchSupplier,
          queryParameters: {"KeyWord": query});
      if (response.statusCode == 200) {
        List<SupplierModel> suppliersList = (response.data as List)
            .map((json) => SupplierModel.fromJson(json))
            .toList();
        return Right(suppliersList);
      }
      return Left(ServerFailure(message: "Something Went Wrong"));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
