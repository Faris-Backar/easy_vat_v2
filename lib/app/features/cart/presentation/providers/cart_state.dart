import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/salesman/domain/entity/sales_man_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    List<CartEntity>? itemList,
    required double totalAmount,
    required double discount,
    required double roundOf,
    required double totalTax,
    required double subtotal,
    String? salesNo,
    String? refNo,
    DateTime? saleDate,
    CustomerEntity? selectedCustomer,
    String? salesMode,
    SalesManEntity? soldBy,
    LedgerAccountEntity? cashAccount,
    LedgerAccountEntity? salesAccount,
    bool? isViewOnly,
  }) = _CartState;

  factory CartState.initial() => CartState(
      itemList: null,
      totalAmount: 0.00,
      discount: 0.0,
      roundOf: 0.0,
      totalTax: 0.0,
      subtotal: 0.0,
      salesNo: null,
      cashAccount: null,
      refNo: null,
      salesAccount: null,
      salesMode: null,
      soldBy: null,
      saleDate: DateTime.now(),
      isViewOnly: false,
      selectedCustomer: null);
}
