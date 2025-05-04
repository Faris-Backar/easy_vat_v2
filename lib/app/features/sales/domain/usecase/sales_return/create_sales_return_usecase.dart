import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_return_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class CreateSalesReturnUsecase
    extends UseCase<Either<Failure, SalesInvoiceEntity>, SalesReturnModel> {
  final SalesRepository salesRepository;

  CreateSalesReturnUsecase({required this.salesRepository});

  @override
  Future<Either<Failure, SalesInvoiceEntity>> call(
      {required SalesReturnModel params}) async {
    return await salesRepository.createSalesreturn(
        salesReturnRequestParams: params);
  }
}
