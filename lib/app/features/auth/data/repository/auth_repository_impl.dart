import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/auth/data/model/pin_login_model.dart';
import 'package:easy_vat_v2/app/features/auth/data/model/server_login_model.dart';
import 'package:easy_vat_v2/app/features/auth/domain/entities/pin_login_entity.dart';
import 'package:easy_vat_v2/app/features/auth/domain/entities/server_login_entity.dart';
import 'package:easy_vat_v2/app/features/auth/domain/repository/auth_repository.dart';
import 'package:easy_vat_v2/app/features/auth/domain/usecase/params/login_params.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<Either<Failure, ServerLoginEntity>> login(
      {required LoginParams params}) async {
    try {
      final dio = DioService().dio;
      final body = params.toMap();
      final response = await dio.post(
          UrlResources.serverBaseUrl + UrlResources.serverLogin,
          data: body);
      if (response.statusCode == 200) {
        final loginData = ServerLoginModel.fromJson(response.data);
        return right(loginData);
      }
      return left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      return left(ServerFailure(
          message: e.message ?? e.error ?? e.response?.data ?? e.type));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PinLoginEntity>> verifyPin(
      {required String pin}) async {
    try {
      final client = DioService().dio;
      final body = {"userPin": pin};
      final response = await client.post(UrlResources.pinLogin, data: body);
      if (response.statusCode == 200) {
        final loginData = PinLoginModel.fromJson(response.data);
        return right(loginData);
      }
      return left(ServerFailure(message: AppStrings.somethingWentWrong));
    } on DioException catch (e) {
      log("pin login error => ${e.requestOptions.headers}\n ${e.requestOptions.baseUrl}${e.requestOptions.path}");
      return left(ServerFailure(
          message:
              e.message ?? e.response?.data ?? AppStrings.somethingWentWrong));
    } catch (e) {
      return left(ServerFailure(message: AppStrings.somethingWentWrong));
    }
  }
}
