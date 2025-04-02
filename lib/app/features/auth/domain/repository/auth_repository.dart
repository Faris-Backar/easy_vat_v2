import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/auth/domain/entities/pin_login_entity.dart';
import 'package:easy_vat_v2/app/features/auth/domain/entities/server_login_entity.dart';
import 'package:easy_vat_v2/app/features/auth/domain/usecase/params/login_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, ServerLoginEntity>> login(
      {required LoginParams params});
  Future<Either<Failure, PinLoginEntity>> verifyPin({required String pin});
}
