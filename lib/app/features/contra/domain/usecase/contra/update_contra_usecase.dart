import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/contra/data/model/contra_request_model.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';
import 'package:easy_vat_v2/app/features/contra/domain/repositories/contra_repository.dart';

class UpdateContraUsecase
    extends UseCase<Either<Failure, ContraEntity>, ContraRequestModel> {
  final ContraRepository contraRepository;
  UpdateContraUsecase({required this.contraRepository});

  @override
  Future<Either<Failure, ContraEntity>> call(
      {required ContraRequestModel params}) async {
    return await contraRepository.updateContra(contraRequestParams: params);
  }
}
