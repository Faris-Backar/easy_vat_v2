import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_state.freezed.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState({
    List<CustomerEntity>? customerList,
    required CustomerStateStatus status,
    String? errorMessage,
  }) = _CustomerState;

  factory CustomerState.initial() => const CustomerState(
        customerList: null,
        status: CustomerStateStatus.initial,
      );
}

enum CustomerStateStatus { initial, loading, success, failure }
