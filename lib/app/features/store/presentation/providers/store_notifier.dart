import 'package:easy_vat_v2/app/core/error/failure.dart';
import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/features/store/data/repository/store_repository_impl.dart';
import 'package:easy_vat_v2/app/features/store/domain/repositories/store_repository.dart';
import 'package:easy_vat_v2/app/features/store/domain/usecase/get_store_usecase.dart';
import 'package:easy_vat_v2/app/features/store/presentation/providers/store_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storeRepositoryProvider = Provider<StoreRepository>((ref) {
  return StoreRepositoryImpl();
});

final getStoreUsecaseProvider = Provider<GetStoreUsecase>((ref) {
  return GetStoreUsecase(storeRepository: ref.read(storeRepositoryProvider));
});

final storeProvider = StateNotifierProvider<StoreNotifier, StoreState>((ref) {
  return StoreNotifier(getStoreUsecase: ref.read(getStoreUsecaseProvider));
});

class StoreNotifier extends StateNotifier<StoreState> {
  final GetStoreUsecase getStoreUsecase;
  StoreNotifier({required this.getStoreUsecase}) : super(StoreState.initial());

  getStore() async {
    state = StoreState.loading();
    try {
      final result = await getStoreUsecase.call(params: NoParams());
      result.fold((l) => state = StoreState.error(l.message), (r) {
        state = StoreState.loaded(storeList: r);
      });
    } on Failure catch (e) {
      state = StoreState.error(e.toString());
    }
  }
}
