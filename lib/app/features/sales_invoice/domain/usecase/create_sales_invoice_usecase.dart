import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/data/model/sales_invoice_request_model.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/entities/sales_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/repositories/sales_order_repository.dart';

class CreateSalesInvoiceUsecase extends UseCase<
    Either<Failure, SalesInvoiceEntity>, SalesInvoiceRequestModel> {
  final SalesInvoiceRepository salesInvoiceRepository;

  CreateSalesInvoiceUsecase({required this.salesInvoiceRepository});

  @override
  Future<Either<Failure, SalesInvoiceEntity>> call(
      {required SalesInvoiceRequestModel params}) async {
    return await salesInvoiceRepository.createSalesInvoices(
        salesInvoiceRequestParams: params);
  }
}
