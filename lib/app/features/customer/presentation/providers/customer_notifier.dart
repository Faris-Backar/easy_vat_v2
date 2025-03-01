import 'dart:developer';

import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/customer/data/repository/customer_repository_impl.dart';
import 'package:easy_vat_v2/app/features/customer/domain/repository/customer_repository.dart';
import 'package:easy_vat_v2/app/features/customer/domain/usecase/get_customer_usecase.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepositoryImpl(dio: ref.read(dioProvider));
});

final getCustomerUsecaseProvider = Provider<GetCustomerUsecase>((ref) {
  return GetCustomerUsecase(
      customerRepository: ref.read(customerRepositoryProvider));
});

final customerNotifierProvider =
    StateNotifierProvider<CustomerNotifier, CustomerState>((ref) {
  return CustomerNotifier(
      getCustomerUsecase: ref.read(getCustomerUsecaseProvider));
});

class CustomerNotifier extends StateNotifier<CustomerState> {
  final GetCustomerUsecase getCustomerUsecase;
  CustomerNotifier({required this.getCustomerUsecase})
      : super(CustomerState.initial());

  getCustomer() async {
    state =
        state.copyWith(customerList: null, status: CustomerStateStatus.loading);
    final result = await getCustomerUsecase.call(params: null);
    log("here in notifier");
    return result.fold(
        (l) => state = state.copyWith(
            customerList: null,
            errorMessage: l.message,
            status: CustomerStateStatus.failure), (r) {
      log("here in r");
      state = state.copyWith(
          customerList: r,
          errorMessage: null,
          status: CustomerStateStatus.success);
    });
  }

  Future<void> searchCustomer({required String searchQuery}) async {
    if (state.customerList?.isEmpty ?? true) {
      await getCustomer();
    }
    if (state.status == CustomerStateStatus.success) {
      final customerList = state.customerList;
      if (customerList?.isNotEmpty == true) {
        if (searchQuery.isEmpty) {
          state = state.copyWith(customerList: customerList);
          return;
        }

        final customerSearchList = customerList
            ?.where((customer) =>
                customer.ledgerName
                    ?.toLowerCase()
                    .contains(searchQuery.toLowerCase()) ??
                false)
            .toList();

        state = state.copyWith(customerList: customerSearchList);
      }
    }
  }
}
