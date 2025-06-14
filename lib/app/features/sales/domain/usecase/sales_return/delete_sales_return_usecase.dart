import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';

class DeleteSalesReturnUsecase
    extends UseCase<Either<Failure, bool>, SalesParams> {
  final SalesRepository salesReturnRepository;

  DeleteSalesReturnUsecase({required this.salesReturnRepository});

  @override
  Future<Either<Failure, bool>> call({required SalesParams params}) async {
    return await salesReturnRepository.deleteSalesreturn(
        salesReturnRequestParams: params);
  }
}
