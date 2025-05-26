import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_state.freezed.dart';

@freezed
class SupplierState with _$SupplierState {
  const factory SupplierState({
    List<SupplierEntity>? supplierList,
    required SupplierStateStatus status,
    String? errorMessage,
  }) = _SupplierState;

  factory SupplierState.initial() =>
      const SupplierState(status: SupplierStateStatus.initial);
}

enum SupplierStateStatus { initial, loading, success, failure }
