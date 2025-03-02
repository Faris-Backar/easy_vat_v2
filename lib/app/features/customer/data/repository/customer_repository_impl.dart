import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/features/customer/data/model/customer_model.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/customer/domain/repository/customer_repository.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final Dio dio;

  CustomerRepositoryImpl({
    required this.dio,
  });
  @override
  Future<Either<Failure, List<CustomerEntity>>> getCustomers() async {
    try {
      final response = await dio.get(UrlResources.getCustomers);
      if (response.statusCode == 200) {
        List<CustomerModel> customersList = (response.data as List)
            .map((json) => CustomerModel.fromJson(json))
            .toList();
        return Right(customersList);
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
