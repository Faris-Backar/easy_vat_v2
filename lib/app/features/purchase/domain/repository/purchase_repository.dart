import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_invoice_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_return_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_return_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';

abstract class PurchaseRepository {
  //purchase invoice
  Future<Either<Failure, List<PurchaseInvoiceEntity>>> fetchPurchaseInvoices(
      {required PurchaseParams params});
  Future<Either<Failure, PurchaseInvoiceEntity>> createPurchaseInvoices(
      {required PurchaseInvoiceModel params});
  Future<Either<Failure, PurchaseInvoiceEntity>> updatePurchaseInvoices(
      {required PurchaseInvoiceModel params});
  Future<Either<Failure, PurchaseInvoiceEntity>> deletePurchaseInvoices(
      {required PurchaseParams params});
  Future<Either<Failure, String>> downloadPurchaseInvoices(
      {required String purchaseIDPK});

  //purchase order
  Future<Either<Failure, List<PurchaseInvoiceEntity>>> fetchPurchaseOrders();
  Future<Either<Failure, PurchaseInvoiceEntity>> createPurchaseOrders(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseInvoiceEntity>> updatePurchaseOrders(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseInvoiceEntity>> deletePurchaseOrders(
      {required PurchaseRequestModel params});

  //purchase return
  Future<Either<Failure, List<PurchaseReturnEntity>>> fetchPurchaseReturns(
      {required PurchaseParams params});
  Future<Either<Failure, PurchaseReturnEntity>> createPurchaseReturns(
      {required PurchaseReturnModel params});
  Future<Either<Failure, PurchaseReturnEntity>> updatePurchaseReturns(
      {required PurchaseReturnModel params});
  Future<Either<Failure, bool>> deletePurchaseReturns(
      {required PurchaseParams params});
}
