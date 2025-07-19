import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/usecase/usecase.dart';
import 'package:easy_vat_v2/app/features/country/domain/entity/country_entity.dart';
import 'package:easy_vat_v2/app/features/country/domain/repositories/country_repository.dart';

class GetCountryUsecase
    extends UseCase<Either<Failure, List<CountryEntity>>, NoParams> {
  final CountryRepository countryRepository;

  GetCountryUsecase({required this.countryRepository});
  @override
  Future<Either<Failure, List<CountryEntity>>> call(
      {required NoParams params}) async {
    return await countryRepository.fetchCountry();
  }
}
