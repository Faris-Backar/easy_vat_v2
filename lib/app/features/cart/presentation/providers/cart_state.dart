import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState(
      {List<CartEntity>? itemList, required double totalAmount}) = _CartState;

  factory CartState.initial() =>
      const CartState(itemList: null, totalAmount: 0.00);
}
