import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(AppStrings.cart),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'print') {
              // Handle print
            } else if (value == 'clear') {
              ref.read(cartProvider.notifier).clearCart();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(value: 'print', child: Text('Print')),
            PopupMenuItem(value: 'clear', child: Text('Clear Cart')),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
