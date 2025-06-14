import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/repository/purchase_repository.dart';
import 'package:easy_vat_v2/app/features/purchase/domain/usecase/params/purchase_params.dart';

class DeletePurchaseReturnUsecase
    extends UseCase<Either<Failure, bool>, PurchaseParams> {
  final PurchaseRepository purchaseRepository;

  DeletePurchaseReturnUsecase({required this.purchaseRepository});
  @override
  Future<Either<Failure, bool>> call({required PurchaseParams params}) {
    return purchaseRepository.deletePurchaseReturns(params: params);
  }
}
