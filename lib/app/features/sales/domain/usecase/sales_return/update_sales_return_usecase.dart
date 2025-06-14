import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_return_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class UpdateSalesReturnUsecase
    extends UseCase<Either<Failure, SalesReturnEntity>, SalesReturnModel> {
  final SalesRepository salesReturnRepository;

  UpdateSalesReturnUsecase({required this.salesReturnRepository});

  @override
  Future<Either<Failure, SalesReturnEntity>> call(
      {required SalesReturnModel params}) async {
    return await salesReturnRepository.updateSalesreturn(
        salesReturnRequestParams: params);
  }
}
