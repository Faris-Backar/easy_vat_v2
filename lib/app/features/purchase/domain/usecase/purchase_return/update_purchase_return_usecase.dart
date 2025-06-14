import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/data/model/purchase_return_model.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/entities/purchase_return_entity.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';

class UpdatePurchaseReturnUsecase extends UseCase<
    Either<Failure, PurchaseReturnEntity>, PurchaseReturnModel> {
  final PurchaseRepository purchaseRepository;

  UpdatePurchaseReturnUsecase({required this.purchaseRepository});
  @override
  Future<Either<Failure, PurchaseReturnEntity>> call(
      {required PurchaseReturnModel params}) {
    return purchaseRepository.updatePurchaseReturns(params: params);
  }
}
