import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/employees/domain/entities/employee_entity.dart';
import 'package:easy_vat_v2/app/features/employees/domain/repository/employee_repository.dart';

class GetEmployeesUsecase
    extends UseCase<Either<Failure, List<EmployeeEntity>>, NoParams> {
  final EmployeeRepository employeeRepository;

  GetEmployeesUsecase({required this.employeeRepository});
  @override
  Future<Either<Failure, List<EmployeeEntity>>> call(
      {required NoParams params}) async {
    return await employeeRepository.getEmployees();
  }
}
