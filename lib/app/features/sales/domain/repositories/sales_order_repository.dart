import "package:dartz/dartz.dart";
import "package:easy_vat_v2/app/core/error/failure.dart";
import "package:easy_vat_v2/app/features/sales/data/model/sales_invoice_request_model.dart";
import "package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart";
import "package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart";

abstract class SalesRepository {
  //salesInvoice
  Future<Either<Failure, SalesEntity>> getSalesInvoices(
      {required SalesParams salesInvoiceRequestParams});
  Future<Either<Failure, SalesEntity>> createSalesInvoices(
      {required SalesRequestModel salesInvoiceRequestParams});

  //salesOrder
  Future<Either<Failure, SalesEntity>> getSalesOrders(
      {required SalesParams salesOrderRequestParams});
  Future<Either<Failure, SalesEntity>> createSalesOrders(
      {required SalesRequestModel salesOrderRequestParams});

//salesReturn
  Future<Either<Failure, SalesEntity>> getSalesreturn(
      {required SalesParams salesReturnRequestParams});
  Future<Either<Failure, SalesEntity>> createSalesreturn(
      {required SalesRequestModel salesReturnRequestParams});
}
