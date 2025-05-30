import 'package:easy_vat_v2/app/features/supplier/data/repository/supplier_repository_impl.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/repository/supplier_repository.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/usecase/get_supplier_usecase.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/usecase/search_supplier_usecase.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/providers/supplier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supplierRepositoryProvider = Provider<SupplierRepository>((ref) {
  return SupplierRepositoryImpl();
});

final getSupplierUsecaseProvider = Provider<GetSupplierUsecase>((ref) {
  return GetSupplierUsecase(
      supplierRepository: ref.read(supplierRepositoryProvider));
});

final searchSupplierUsecaseProvider = Provider<SearchSupplierUsecase>((ref) {
  return SearchSupplierUsecase(
      supplierRepository: ref.read(supplierRepositoryProvider));
});

final supplierNotfierProvider =
    StateNotifierProvider<SupplierNotifier, SupplierState>((ref) {
  return SupplierNotifier(
      getSupplierUsecase: ref.read(getSupplierUsecaseProvider),
      searchSupplierUsecase: ref.read(searchSupplierUsecaseProvider));
});

class SupplierNotifier extends StateNotifier<SupplierState> {
  final GetSupplierUsecase getSupplierUsecase;
  final SearchSupplierUsecase searchSupplierUsecase;
  SupplierNotifier(
      {required this.getSupplierUsecase, required this.searchSupplierUsecase})
      : super(SupplierState.initial());
  getSupplier() async {
    state =
        state.copyWith(supplierList: null, status: SupplierStateStatus.loading);
    final result = await getSupplierUsecase.call(params: null);
    return result.fold(
        (l) => state = state.copyWith(
            supplierList: null,
            errorMessage: l.message,
            status: SupplierStateStatus.failure), (r) {
      state = state.copyWith(
          supplierList: r,
          errorMessage: null,
          status: SupplierStateStatus.success);
    });
  }

  searchSupplier({required String searchQuery}) async {
    state =
        state.copyWith(supplierList: null, status: SupplierStateStatus.loading);
    final result = await searchSupplierUsecase.call(params: searchQuery);
    return result.fold(
        (l) => state = state.copyWith(
            supplierList: null,
            errorMessage: l.message,
            status: SupplierStateStatus.failure), (r) {
      state = state.copyWith(
          supplierList: r,
          errorMessage: null,
          status: SupplierStateStatus.success);
    });
  }
}
