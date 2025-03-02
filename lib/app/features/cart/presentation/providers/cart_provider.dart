import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState.initial());

  List<CartEntity> itemsList = [];
  double totalAmount = 0.0;

  addItemsIntoCart({required CartEntity item}) {
    itemsList.add(item);
    state = state.copyWith(itemList: itemsList);
  }

  removeItemFromCart({required int index}) {
    itemsList.removeAt(index);
    state = state.copyWith(itemList: itemsList);
  }

  clearCart() {
    itemsList.clear();
    state = state.copyWith(itemList: itemsList);
  }

  calculateTotalAmount({required double amount}) {
    totalAmount += amount;
  }
}
