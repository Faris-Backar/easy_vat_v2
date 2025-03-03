import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_footer_widget.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: AppUtils.isDarkMode(context)
          ? context.colorScheme.surfaceContainerLowest
          : null,
      appBar: CartAppBar(),
      bottomNavigationBar: CartFooterWidget(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: state.itemList?.isEmpty ?? true
              ? _buildEmptyState()
              : CartList(itemList: state.itemList ?? [])),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        AppStrings.addNewItems,
        style: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.outline,
        ),
      ),
    );
  }
}
