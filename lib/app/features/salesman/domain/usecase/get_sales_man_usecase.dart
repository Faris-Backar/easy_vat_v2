import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/repository/sales_man_repository.dart';

class GetSalesManUsecase
    extends UseCase<Either<Failure, List<SalesManEntity>>, NoParams> {
  final SalesManRepository salesManRepository;

  GetSalesManUsecase({required this.salesManRepository});

  @override
  Future<Either<Failure, List<SalesManEntity>>> call(
      {required NoParams params}) async {
    return await salesManRepository.getSalesMan();
  }
}
