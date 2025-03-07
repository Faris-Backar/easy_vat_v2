import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/customer/data/repository/customer_repository_impl.dart';
import 'package:easy_vat_v2/app/features/customer/domain/repository/customer_repository.dart';
import 'package:easy_vat_v2/app/features/customer/domain/usecase/get_customer_usecase.dart';
import 'package:easy_vat_v2/app/features/customer/domain/usecase/search_customer_usecase.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepositoryImpl(dio: ref.read(dioProvider));
});

final getCustomerUsecaseProvider = Provider<GetCustomerUsecase>((ref) {
  return GetCustomerUsecase(
      customerRepository: ref.read(customerRepositoryProvider));
});

final searchCustomerUsecaseProvider = Provider<SearchCustomerUsecase>((ref) {
  return SearchCustomerUsecase(
      customerRepository: ref.read(customerRepositoryProvider));
});

final customerNotifierProvider =
    StateNotifierProvider<CustomerNotifier, CustomerState>((ref) {
  return CustomerNotifier(
      getCustomerUsecase: ref.read(getCustomerUsecaseProvider),
      searchCustomerUsecase: ref.read(searchCustomerUsecaseProvider));
});

class CustomerNotifier extends StateNotifier<CustomerState> {
  final GetCustomerUsecase getCustomerUsecase;
  final SearchCustomerUsecase searchCustomerUsecase;
  CustomerNotifier(
      {required this.getCustomerUsecase, required this.searchCustomerUsecase})
      : super(CustomerState.initial());

  getCustomer() async {
    state =
        state.copyWith(customerList: null, status: CustomerStateStatus.loading);
    final result = await getCustomerUsecase.call(params: null);
    return result.fold(
        (l) => state = state.copyWith(
            customerList: null,
            errorMessage: l.message,
            status: CustomerStateStatus.failure), (r) {
      state = state.copyWith(
          customerList: r,
          errorMessage: null,
          status: CustomerStateStatus.success);
    });
  }

  searchCustomer({required String searchQuery}) async {
    state =
        state.copyWith(customerList: null, status: CustomerStateStatus.loading);
    final result = await searchCustomerUsecase.call(params: searchQuery);
    return result.fold(
        (l) => state = state.copyWith(
            customerList: null,
            errorMessage: l.message,
            status: CustomerStateStatus.failure), (r) {
      state = state.copyWith(
          customerList: r,
          errorMessage: null,
          status: CustomerStateStatus.success);
    });
  }
}
