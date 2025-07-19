import 'package:dartz/dartz.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/features/country/domain/entity/country_state_entity.dart';

abstract class CountryStateRepository {
  Future<Either<Failure, List<CountryStateEntity>>> fetchCountryState();
}
