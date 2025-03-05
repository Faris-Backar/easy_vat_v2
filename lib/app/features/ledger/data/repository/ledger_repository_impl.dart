import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/cash_ledger_model.dart';
import 'package:easy_vat_v2/app/features/ledger/data/model/sales_ledger_model.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/cash_ledger_enitiy.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/sales_ledger_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/repositories/ledger_repository.dart';

class LedgerRepositoryImpl extends LedgerRepository {
  final Dio client;

  LedgerRepositoryImpl({required this.client});
  @override
  Future<Either<Failure, List<CashLedgerEntity>>> fetchCashLedger() async {
    try {
      final response = await client.get(UrlResources.getCAshAccount);
      if (response.statusCode == 200) {
        List<CashLedgerModel> cashLedgerList = (response.data as List)
            .map((json) => CashLedgerModel.fromJson(json))
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
  Future<Either<Failure, List<SalesLedgerEntity>>> fetchSalesLedger() async {
    try {
      final response = await client.get(UrlResources.getCAshAccount);
      if (response.statusCode == 200) {
        List<SalesLedgerModel> salesLedgerList = (response.data as List)
            .map((json) => SalesLedgerModel.fromJson(json))
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
}
