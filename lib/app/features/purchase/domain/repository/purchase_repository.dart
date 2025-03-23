import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';

abstract class PurchaseRepository {
  Future<Either<Failure, List<PurchaseInvoiceEntity>>> fetchPurchaseInvoices();
  Future<Either<Failure, PurchaseResponseModel>> createPurchaseInvoices(
      {required PurchaseRequestModel params});
  Future<Either<Failure, PurchaseResponseModel>> updatePurchaseInvoices(
      {required PurchaseRequestModel params});
}
