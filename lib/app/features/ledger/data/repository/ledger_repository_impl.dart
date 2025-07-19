import 'package:dartz/dartz.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_account_model.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/ledger_request_model.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/usecase/params/ledger_params.dart';

class LedgerRepositoryImpl extends LedgerRepository {
  LedgerRepositoryImpl();

  final client = DioService().dio;
  final dio = Dio();
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

  @override
  Future<Either<Failure, List<LedgerAccountEntity>>>
      fetchCapitalLedger() async {
    try {
      final response = await client.get(UrlResources.getCapitalLedgerAccount);
      if (response.statusCode == 200) {
        List<LedgerAccountModel> capitalLedger = (response.data as List)
            .map((json) => LedgerAccountModel.fromJson(json))
            .toList();
        return Right(capitalLedger);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LedgerAccountEntity>>>
      fetchCashBankLedger() async {
    try {
      final response = await client.get(UrlResources.getCashBankLedgerAccount);
      if (response.statusCode == 200) {
        List<LedgerAccountModel> cashBankLedger = (response.data as List)
            .map((json) => LedgerAccountModel.fromJson(json))
            .toList();
        return Right(cashBankLedger);
      }
      return Left(ServerFailure(message: "Something went wrong."));
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data ?? e.error ?? ""));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LedgerAccountEntity>> createLedger(
      {required LedgerRequestModel ledgerRequestParams}) async {
    try {
      final data = ledgerRequestParams.toJson();
      final response = await client.get(UrlResources.createLedger, data: data);
      if (response.statusCode == 200) {
        // final ledgerList = LedgerAccountModel.fromJson(response.data);
        return Right(response.data);
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
  Future<Either<Failure, LedgerAccountEntity>> updateLedger(
      {required LedgerRequestModel ledgerRequestParams}) async {
    try {
      final data = ledgerRequestParams.toJson();
      final response = await client.post(UrlResources.updateLedger, data: data);
      if (response.statusCode == 200) {
        return Right(response.data);
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
  Future<Either<Failure, LedgerAccountEntity>> deleteLedger(
      {required LedgerParams ledgerParams}) async {
    try {
      final data = ledgerParams.toJson();
      final response = await client.post(UrlResources.deleteLedger, data: data);
      if (response.statusCode == 200) {
        return Right(response.data);
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
