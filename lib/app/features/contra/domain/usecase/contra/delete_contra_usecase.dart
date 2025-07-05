import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/contra/domain/entity/contra_entity.dart';
import 'package:easy_vat_v2/app/features/contra/domain/repositories/contra_repository.dart';
import 'package:easy_vat_v2/app/features/contra/domain/usecase/params/contra_params.dart';

class DeleteContraUsecase
    extends UseCase<Either<Failure, ContraEntity>, ContraParams> {
  final ContraRepository contraRepository;
  DeleteContraUsecase({required this.contraRepository});

  @override
  Future<Either<Failure, ContraEntity>> call(
      {required ContraParams params}) async {
    return await contraRepository.deleteContra(contraRequestParams: params);
  }
}
