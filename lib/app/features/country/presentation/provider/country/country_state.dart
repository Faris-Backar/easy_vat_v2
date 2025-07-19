import 'package:easy_vat_v2/app/features/country/domain/entity/country_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_state.freezed.dart';

@freezed
class CountryState with _$CountryState {
  const factory CountryState.initial() = _Initial;
  const factory CountryState.loading() = _Loading;
  const factory CountryState.loaded({required List<CountryEntity> countries}) =
      _Loaded;
  const factory CountryState.error(String message) = _Error;
}
