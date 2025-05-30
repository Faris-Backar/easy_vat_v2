import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_mode_state.freezed.dart';

@freezed
class PaymentModeState with _$PaymentModeState {
  // Initial state factory
  const factory PaymentModeState.initial() = _Initial;

  // Loaded state factory
  const factory PaymentModeState.loaded({
    @Default([]) List<PaymentModeModel> paymentModes,
    PaymentModeModel? selectedPaymentMode,
  }) = _Loaded;

  // Loading state factory
  const factory PaymentModeState.loading() = _Loading;

  // Error state factory
  const factory PaymentModeState.error({
    required String message,
  }) = _Error;
}
