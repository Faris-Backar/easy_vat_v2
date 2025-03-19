import "package:dartz/dartz.dart";
import "package:easy_vat_v2/app/core/error/failure.dart";
import "package:easy_vat_v2/app/features/sales/data/model/sales_invoice_request_model.dart";
import "package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart";
import "package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart";

abstract class SalesInvoiceRepository {
  Future<Either<Failure, SalesInvoiceEntity>> getSalesInvoices(
      {required SalesInvoiceParams salesInvoiceRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> createSalesInvoices(
      {required SalesInvoiceRequestModel salesInvoiceRequestParams});
}
