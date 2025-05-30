import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';

class FetchSalesInvoiceUsecase
    extends UseCase<Either<Failure, SalesInvoiceEntity>, SalesParams> {
  final SalesRepository salesInoviceRepository;
  FetchSalesInvoiceUsecase({required this.salesInoviceRepository});

  @override
  Future<Either<Failure, SalesInvoiceEntity>> call(
      {required SalesParams params}) async {
    return await salesInoviceRepository.getSalesInvoices(
        salesInvoiceRequestParams: params);
  }
}
