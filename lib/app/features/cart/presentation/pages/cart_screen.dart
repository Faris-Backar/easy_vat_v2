import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_footer_widget.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_list.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_cart_footer_widget.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CartScreenType { cart, stockTransfer }

@RoutePage()
class CartScreen extends ConsumerWidget {
  final CartScreenType screenType;
  const CartScreen({super.key, required this.screenType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late PreferredSizeWidget appBar;
    Widget footerWidget;
    late List<dynamic> cartItems;
    late Widget listWidget;
    switch (screenType) {
      case CartScreenType.cart:
        final state = ref.watch(cartProvider);
        cartItems = state.itemList ?? [];
        appBar = const CartAppBar();
        footerWidget = const CartFooterWidget();
        listWidget = CartList(itemList: state.itemList ?? []);

        break;

      case CartScreenType.stockTransfer:
        final state = ref.watch(stockTransferProvider);
        cartItems = state.itemList ?? [];
        appBar = AppBar(title: const Text('Stock Transfer'));
        footerWidget = const StockTransferCartFooterWidget();
        listWidget = StockTransferCartList(itemList: state.itemList ?? []);
        break;
    }

    return Scaffold(
      backgroundColor: context.surfaceColor,
      appBar: appBar,
      bottomNavigationBar: SafeArea(child: footerWidget),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: cartItems.isEmpty ? _buildEmptyState(context) : listWidget,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Text(
        context.translate(AppStrings.addNewItems),
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.outline,
        ),
      ),
    );
  }
}
