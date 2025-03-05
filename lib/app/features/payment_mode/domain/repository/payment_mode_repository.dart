import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';

abstract class PaymentModeRepository {
  Future<Either<Failure, List<PaymentModeModel>>> getPaymentMode();
}
