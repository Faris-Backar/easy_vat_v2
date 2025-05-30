import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:easy_vat_v2/app/features/payment_mode/domain/repository/payment_mode_repository.dart';

class PaymentModeRepositoryImpl extends PaymentModeRepository {
  PaymentModeRepositoryImpl();

  final client = DioService().dio;

  @override
  Future<Either<Failure, List<PaymentModeModel>>> getPaymentMode() async {
    try {
      final response = await client.get(UrlResources.paymentMode);
      if (response.statusCode == 200) {
        List<PaymentModeModel> employeeList = (response.data as List)
            .map((json) => PaymentModeModel.fromJson(json))
            .toList();
        return Right(employeeList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      log("here in dio exception => ${e.stackTrace}");
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }
}
