import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/contra/domain/repositories/contra_repository.dart';

class DownloadContraUsecase extends UseCase<Either<Failure, String>, String> {
  final ContraRepository contraRepository;
  DownloadContraUsecase({required this.contraRepository});

  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return await contraRepository.downloadContra(contraIDPK: params);
  }
}
