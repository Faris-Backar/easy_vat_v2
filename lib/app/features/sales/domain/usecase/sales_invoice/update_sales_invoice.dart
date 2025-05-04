import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart';
import 'package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales/domain/repositories/sales_repository.dart';

class UpdateSalesInvoiceUsecase
    extends UseCase<Either<Failure, SalesInvoiceEntity>, SalesRequestModel> {
  final SalesRepository salesInvoiceRepository;

  UpdateSalesInvoiceUsecase({required this.salesInvoiceRepository});

  @override
  Future<Either<Failure, SalesInvoiceEntity>> call(
      {required SalesRequestModel params}) async {
    return await salesInvoiceRepository.updateSalesInvoices(
        salesInvoiceRequestParams: params);
  }
}
