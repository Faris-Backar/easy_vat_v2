import 'package:easy_vat_v2/app/features/country/domain/entity/country_state_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_states_state.freezed.dart';

@freezed
class CountryStatesState with _$CountryStatesState {
  const factory CountryStatesState.initial() = _Initial;
  const factory CountryStatesState.loading() = _Loading;
  const factory CountryStatesState.loaded({
    required List<CountryStateEntity> countryStates,
  }) = _Loaded;
  const factory CountryStatesState.error(String message) = _Error;
}
