import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/auth/domain/entities/pin_login_entity.dart';
import 'package:easy_vat_v2/app/features/auth/domain/repository/auth_repository.dart';

class PinLoginUsecase extends UseCase<Either<Failure, PinLoginEntity>, String> {
  final AuthRepository authRepository;

  PinLoginUsecase({required this.authRepository});
  @override
  Future<Either<Failure, PinLoginEntity>> call({required String params}) async {
    return await authRepository.verifyPin(pin: params);
  }
}
