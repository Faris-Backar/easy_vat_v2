import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/customer/domain/repository/customer_repository.dart';

class GetCustomerUsecase
    extends UseCase<Either<Failure, List<CustomerEntity>>, String?> {
  final CustomerRepository customerRepository;

  GetCustomerUsecase({required this.customerRepository});
  @override
  Future<Either<Failure, List<CustomerEntity>>> call(
      {required String? params}) async {
    return await customerRepository.getCustomers();
  }
}
