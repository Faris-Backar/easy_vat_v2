import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/country/data/repository/country_repository_impl.dart';
import 'package:easy_vat_v2/app/features/country/domain/repositories/country_repository.dart';
import 'package:easy_vat_v2/app/features/country/domain/usecase/get_country_usecase.dart';
import 'package:easy_vat_v2/app/features/country/presentation/provider/country/country_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryRepositoryProvider = Provider<CountryRepository>((ref) {
  return CountryRepositoryImpl();
});

final getCountryUsecaseProvider = Provider<GetCountryUsecase>((ref) {
  return GetCountryUsecase(
      countryRepository: ref.read(countryRepositoryProvider));
});

final countryProvider =
    StateNotifierProvider<CountryNotifier, CountryState>((ref) {
  return CountryNotifier(
      getCountryUsecase: ref.read(getCountryUsecaseProvider));
});

class CountryNotifier extends StateNotifier<CountryState> {
  final GetCountryUsecase getCountryUsecase;
  CountryNotifier({required this.getCountryUsecase})
      : super(CountryState.initial());

  getCountry() async {
    state = CountryState.loading();
    try {
      final result = await getCountryUsecase.call(params: NoParams());
      result.fold((l) => state = CountryState.error(l.message),
          (r) => state = CountryState.loaded(countries: r));
    } catch (e) {
      state = CountryState.error(e.toString());
    }
  }
}
