import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/dividend/data/model/dividend_request_model.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_entity.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/usecase/params/dividend_params.dart';

abstract class DividendRepository {
  Future<Either<Failure, DividendEntity>> getDividend(
      {required DividendParams dividendRequestParams});
  Future<Either<Failure, DividendEntity>> createDividend(
      {required DividendRequestModel dividendRequestParams});
  Future<Either<Failure, DividendEntity>> updateDividend(
      {required DividendRequestModel dividendRequestParams});
  Future<Either<Failure, DividendEntity>> deleteDividend(
      {required DividendParams dividendParams});
  Future<Either<Failure, String>> downloadDividend(
      {required String dividendIDPK});
}
