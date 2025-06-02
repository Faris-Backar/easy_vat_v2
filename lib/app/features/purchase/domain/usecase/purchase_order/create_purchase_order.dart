import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_invoice_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class CreatePurchaseOrderUsecase extends UseCase<
    Either<Failure, PurchaseInvoiceEntity>, PurchaseRequestModel> {
  final PurchaseRepository purchaseRepository;

  CreatePurchaseOrderUsecase({required this.purchaseRepository});
  @override
  Future<Either<Failure, PurchaseInvoiceEntity>> call(
      {required PurchaseRequestModel params}) {
    return purchaseRepository.createPurchaseOrders(params: params);
  }
}
