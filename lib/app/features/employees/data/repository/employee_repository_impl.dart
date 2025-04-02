import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/employees/data/models/employee_model.dart';
import 'package:easy_vat_v2/app/features/employees/domain/entities/employee_entity.dart';
import 'package:easy_vat_v2/app/features/employees/domain/repository/employee_repository.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  EmployeeRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, List<EmployeeEntity>>> getEmployees() async {
    try {
      final response = await client.get(UrlResources.getEmployees);
      if (response.statusCode == 200) {
        List<EmployeeModel> employeeList = (response.data as List)
            .map((json) => EmployeeModel.fromJson(json))
            .toList();
        return Right(employeeList);
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
