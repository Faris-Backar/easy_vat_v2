import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';

class FetchSalesReturnUsecase
    extends UseCase<Either<Failure, List<SalesReturnEntity>>, SalesParams> {
  final SalesRepository salesReturnRepository;
  FetchSalesReturnUsecase({required this.salesReturnRepository});

  @override
  Future<Either<Failure, List<SalesReturnEntity>>> call(
      {required SalesParams params}) async {
    return await salesReturnRepository.getSalesreturn(
        salesReturnRequestParams: params);
  }
}
