import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';

abstract class PurchaseRepository {
  //purchase invoice
  Future<Either<Failure, List<PurchaseEntity>>> fetchPurchaseInvoices();
  Future<Either<Failure, PurchaseEntityModel>> createPurchaseInvoices(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseEntityModel>> updatePurchaseInvoices(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseEntityModel>> deletePurchaseInvoices(
      {required PurchaseRequestModel params});

  //purchase order
  Future<Either<Failure, List<PurchaseEntity>>> fetchPurchaseOrders();
  Future<Either<Failure, PurchaseEntityModel>> createPurchaseOrders(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseEntityModel>> updatePurchaseOrders(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseEntityModel>> deletePurchaseOrders(
      {required PurchaseRequestModel params});

  //purchase return
  Future<Either<Failure, List<PurchaseEntity>>> fetchPurchaseReturns();
  Future<Either<Failure, PurchaseEntityModel>> createPurchaseReturns(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseEntityModel>> updatePurchaseReturns(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseEntityModel>> deletePurchaseReturns(
      {required PurchaseRequestModel params});
}
