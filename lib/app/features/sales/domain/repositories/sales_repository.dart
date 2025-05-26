import "package:dartz/dartz.dart";
import "package:easy_vat_v2/app/core/error/failure.dart";
import "package:easy_vat_v2/app/features/sales/data/model/sales_order_model.dart";
import "package:easy_vat_v2/app/features/sales/data/model/sales_request_model.dart";
import "package:easy_vat_v2/app/features/sales/data/model/sales_return_model.dart";
import "package:easy_vat_v2/app/features/sales/domain/entities/sales_invoice_entity.dart";
import "package:easy_vat_v2/app/features/sales/domain/entities/sales_return_entity.dart";
import "package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart";

abstract class SalesRepository {
  //salesInvoice
  Future<Either<Failure, SalesInvoiceEntity>> getSalesInvoices(
      {required SalesParams salesInvoiceRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> createSalesInvoices(
      {required SalesRequestModel salesInvoiceRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> updateSalesInvoices(
      {required SalesRequestModel salesInvoiceRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> deleteSalesInvoices(
      {required SalesParams salesParams});
  Future<Either<Failure, String>> downloadSalesInvoices(
      {required String salesIdpk});

  //salesOrder
  Future<Either<Failure, SalesInvoiceEntity>> getSalesOrders(
      {required SalesParams salesOrderRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> createSalesOrders(
      {required SalesOrderModel salesOrderRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> updateSalesOrders(
      {required SalesOrderModel salesOrderRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> deleteSalesOrders(
      {required SalesOrderModel salesOrderRequestParams});

//salesReturn
  Future<Either<Failure, List<SalesReturnEntity>>> getSalesreturn(
      {required SalesParams salesReturnRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> createSalesreturn(
      {required SalesReturnModel salesReturnRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> updateSalesreturn(
      {required SalesReturnModel salesReturnRequestParams});
  Future<Either<Failure, SalesInvoiceEntity>> deleteSalesreturn(
      {required SalesReturnModel salesReturnRequestParams});
}
