import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/country/domain/entity/country_entity.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountryEntity>>> fetchCountry();
}
