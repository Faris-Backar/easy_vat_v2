import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_request_model.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_success_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class UpdatePurchaseUsecase extends UseCase<
    Either<Failure, PurchaseResponseModel>, PurchaseRequestModel> {
  final PurchaseRepository purchaseRepository;

  UpdatePurchaseUsecase({required this.purchaseRepository});
  @override
  Future<Either<Failure, PurchaseResponseModel>> call(
      {required PurchaseRequestModel params}) {
    return purchaseRepository.updatePurchaseInvoices(params: params);
  }
}
