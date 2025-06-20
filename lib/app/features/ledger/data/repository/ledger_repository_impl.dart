import 'package:dartz/dartz.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_account_model.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';

class LedgerRepositoryImpl extends LedgerRepository {
  LedgerRepositoryImpl();

  final client = DioService().dio;
  @override
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchCashLedger() async {
    try {
      final response = await client.get(UrlResources.getCAshAccount);
      if (response.statusCode == 200) {
        List<LedgerAccountModel> cashLedgerList = (response.data as List)
            .map((json) => LedgerAccountModel.fromJson(json))
            .toList();
        return Right(cashLedgerList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchSalesLedger() async {
    try {
      final response = await client.get(UrlResources.getSalesAccount);
      if (response.statusCode == 200) {
        List<LedgerAccountModel> salesLedgerList = (response.data as List)
            .map((json) => LedgerAccountModel.fromJson(json))
            .toList();
        return Right(salesLedgerList);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchBankLedger() async {
    try {
      final response = await client.get(UrlResources.getBankAccount);
      if (response.statusCode == 200) {
        List<LedgerAccountModel> bankLedger = (response.data as List)
            .map((json) => LedgerAccountModel.fromJson(json))
            .toList();
        return Right(bankLedger);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(
        ServerFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<LedgerAccountEntity>>>
      fetchExpenseLedger() async {
    try {
      final response = await client.get(UrlResources.getExpenseAccount);
      log('Response status: ${response.statusCode}', name: 'ExpenseLedger');
      log('Response body: ${response.data}', name: 'ExpenseLedger');
      if (response.statusCode == 200) {
        List<LedgerAccountModel> expenseLedger = (response.data as List)
            .map((json) => LedgerAccountModel.fromJson(json))
            .toList();
        return Right(expenseLedger);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchIncomeLedger() async {
    try {
      final response = await client.get(UrlResources.getLedgerAccount);
      if (response.statusCode == 200) {
        List<LedgerAccountModel> incomeLedger = (response.data as List)
            .map((json) => LedgerAccountModel.fromJson(json))
            .toList();
        return Right(incomeLedger);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LedgerAccountEntity>>> fetchLedger() async {
    try {
      final response = await client.get(UrlResources.getAllLedger);
      if (response.statusCode == 200) {
        List<LedgerAccountModel> allLedger = (response.data as List)
            .map((json) => LedgerAccountModel.fromJson(json))
            .toList();
        return Right(allLedger);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
