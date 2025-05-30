import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:easy_vat_v2/app/features/payment_mode/domain/repository/payment_mode_repository.dart';

class GetPaymentMethodsUsecase
    extends UseCase<Either<Failure, List<PaymentModeModel>>, NoParams> {
  final PaymentModeRepository paymentModeRepository;

  GetPaymentMethodsUsecase({required this.paymentModeRepository});
  @override
  Future<Either<Failure, List<PaymentModeModel>>> call(
      {required NoParams params}) async {
    return await paymentModeRepository.getPaymentMode();
  }
}
