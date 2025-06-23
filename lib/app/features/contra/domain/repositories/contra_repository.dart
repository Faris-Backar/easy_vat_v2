import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/contra/data/model/contra_request_model.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';
import 'package:easy_vat_v2/app/features/contra/domain/usecase/params/contra_params.dart';

abstract class ContraRepository {
  Future<Either<Failure, ContraEntity>> getContra(
      {required ContraParams contraRequestParams});
  Future<Either<Failure, ContraEntity>> createContra(
      {required ContraRequestModel contraRequestParams});
  Future<Either<Failure, ContraEntity>> updateContra(
      {required ContraRequestModel contraRequestParams});
  Future<Either<Failure, ContraEntity>> deleteContra(
      {required ContraParams contraRequestParams});
  Future<Either<Failure, String>> downloadContra({required String contraIDPK});
}
