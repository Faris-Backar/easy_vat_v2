import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/country/data/repository/country_state_repository_impl.dart';
import 'package:easy_vat_v2/app/features/country/domain/repositories/country_state_repository.dart';
import 'package:easy_vat_v2/app/features/country/domain/usecase/get_country_state_usecase.dart';
import 'package:easy_vat_v2/app/features/country/presentation/provider/country_state/country_states_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryStateRepositoryProvider = Provider<CountryStateRepository>((ref) {
  return CountryStateRepositoryImpl();
});

final getCountryStatesUsecaseProvider = Provider<GetCountryStateUsecase>((ref) {
  return GetCountryStateUsecase(
      countryStateRepository: ref.read(countryStateRepositoryProvider));
});

final countryStateProvider =
    StateNotifierProvider<CountryStateNotifier, CountryStatesState>((ref) {
  return CountryStateNotifier(
      getCountryStateUsecase: ref.read(getCountryStatesUsecaseProvider));
});

class CountryStateNotifier extends StateNotifier<CountryStatesState> {
  final GetCountryStateUsecase getCountryStateUsecase;
  CountryStateNotifier({required this.getCountryStateUsecase})
      : super(CountryStatesState.initial());

  getCountryState() async {
    state = CountryStatesState.loading();
    try {
      final result = await getCountryStateUsecase.call(params: NoParams());
      result.fold((l) => state = CountryStatesState.error(l.message),
          (r) => state = CountryStatesState.loaded(countryStates: r));
    } catch (e) {
      state = CountryStatesState.error(e.toString());
    }
  }
}
