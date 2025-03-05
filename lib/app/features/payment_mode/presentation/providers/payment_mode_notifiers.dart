import 'package:easy_vat_v2/app/core/usecase/no_params.dart';
import 'package:easy_vat_v2/app/core/utils/dio_service.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/repository/payment_mode_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_vat_v2/app/features/payment_mode/domain/usecase/get_payment_methods.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_state.dart';

final paymentModeRepository =
    Provider((ref) => PaymentModeRepositoryImpl(client: ref.read(dioProvider)));

final getPaymentMethodsUsecase = Provider((ref) => GetPaymentMethodsUsecase(
    paymentModeRepository: ref.read(paymentModeRepository)));

final paymentModeNotifierProvider =
    StateNotifierProvider<PaymentModeNotifier, PaymentModeState>((ref) {
  return PaymentModeNotifier(
      getPaymentMethodsUsecase: ref.read(getPaymentMethodsUsecase));
});

class PaymentModeNotifier extends StateNotifier<PaymentModeState> {
  final GetPaymentMethodsUsecase getPaymentMethodsUsecase;
  PaymentModeNotifier({required this.getPaymentMethodsUsecase})
      : super(PaymentModeState.initial());

  Future<void> fetchPaymentModes() async {
    state = const PaymentModeState.loading();
    try {
      final result = await getPaymentMethodsUsecase.call(params: NoParams());
      result.fold(
        (l) => state = PaymentModeState.error(
          message: l.toString(),
        ),
        (r) => state = PaymentModeState.loaded(
          paymentModes: r,
        ),
      );
    } catch (e) {
      state = PaymentModeState.error(
        message: e.toString(),
      );
    }
  }
}
