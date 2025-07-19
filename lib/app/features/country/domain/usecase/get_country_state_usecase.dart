import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/country/domain/entity/country_state_entity.dart';
import 'package:easy_vat_v2/app/features/country/domain/repositories/country_state_repository.dart';

class GetCountryStateUsecase
    extends UseCase<Either<Failure, List<CountryStateEntity>>, NoParams> {
  final CountryStateRepository countryStateRepository;

  GetCountryStateUsecase({required this.countryStateRepository});
  @override
  Future<Either<Failure, List<CountryStateEntity>>> call(
      {required NoParams params}) async {
    return await countryStateRepository.fetchCountryState();
  }
}
