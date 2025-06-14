import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/expense/data/model/expense_model.dart';
import 'package:easy_vat_v2/app/features/expense/data/model/expense_request_model.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_entity.dart';
import 'package:easy_vat_v2/app/features/expense/domain/repositories/expense_repository.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_params.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';

class ExpenseRepositoryImpl extends ExpenseRepository {
  ExpenseRepositoryImpl();

  final client = DioService().dio;
  final dio = Dio();

  @override
  Future<Either<Failure, ExpenseEntity>> getExpense(
      {required ExpenseParams expenseRequestParams}) async {
    try {
      final data = expenseRequestParams.toJson();
      log("Error: $data");
      final response = await client.post(UrlResources.getExpense, data: data);
      log("Error: $response");
      if (response.statusCode == 200) {
        final expenseList = ExpenseModel.fromJson(response.data);
        log("Error: $response");
        return Right(expenseList);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ExpenseEntity>> createExpense(
      {required ExpenseRequestModel expenseRequestParams}) async {
    try {
      final data = expenseRequestParams.toJson();

      final response =
          await client.post(UrlResources.createExpense, data: data);
      if (response.statusCode == 200) {
        final expense = ExpenseModel.fromJson(response.data);
        return Right(expense);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ExpenseEntity>> updateExpense(
      {required ExpenseRequestModel expenseRequestParams}) async {
    try {
      final data = expenseRequestParams.toJson();

      final response =
          await client.post(UrlResources.updateExpense, data: data);
      if (response.statusCode == 200) {
        final expense = ExpenseModel.fromJson(response.data);
        return Right(expense);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ExpenseEntity>> deleteExpense(
      {required ExpenseParams expenseParams}) async {
    try {
      final data = expenseParams.toJson();

      final response =
          await client.post(UrlResources.deleteExpense, data: data);
      if (response.statusCode == 200) {
        final expense = ExpenseModel.fromJson(response.data);
        return Right(expense);
      }
      return Left(ServerFailure(message: ""));
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage?.toString() ??
              e.error?.toString() ??
              ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
