import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/auth/domain/entities/server_login_entity.dart';
import 'package:easy_vat_v2/app/features/auth/domain/repository/auth_repository.dart';
import 'package:easy_vat_v2/app/features/auth/domain/usecase/params/login_params.dart';

class LoginUsecase
    extends UseCase<Either<Failure, ServerLoginEntity>, LoginParams> {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});
  @override
  Future<Either<Failure, ServerLoginEntity>> call(
      {required LoginParams params}) async {
    return await authRepository.login(params: params);
  }
}
