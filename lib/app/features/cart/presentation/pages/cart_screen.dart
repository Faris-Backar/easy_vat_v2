import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_footer_widget.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: context.surfaceColor,
      appBar: CartAppBar(),
      bottomNavigationBar: CartFooterWidget(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: state.itemList?.isEmpty ?? true
              ? _buildEmptyState(context)
              : CartList(itemList: state.itemList ?? [])),
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
