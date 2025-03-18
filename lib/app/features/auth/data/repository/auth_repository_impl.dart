import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/features/auth/data/model/login_model.dart';
import 'package:easy_vat_v2/app/features/auth/domain/entities/login_entity.dart';
import 'package:easy_vat_v2/app/features/auth/domain/repository/auth_repository.dart';
import 'package:easy_vat_v2/app/features/auth/domain/usecase/params/login_params.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Dio client;

  AuthRepositoryImpl({required this.client});

  @override
  Future<Either<Failure, LoginEntity>> login(
      {required LoginParams params}) async {
    try {
      final body = params.toMap();
      final response = await client.post(UrlResources.login, data: body);
      if (response.statusCode == 200) {
        final loginData = LoginModel.fromJson(response.data);
        log("login response => $loginData");
        return right(loginData);
      }
      return left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return left(e.message ?? e.error ?? e.response?.data ?? e.type);
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> verifyPin() {
    throw UnimplementedError();
  }
}
