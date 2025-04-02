import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(context.translate(AppStrings.cart)),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'print') {
              // Handle print
            } else if (value == 'clear') {
              _showDeleteDialog(context);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
                value: 'print',
                child: Text(context.translate(AppStrings.print))),
            PopupMenuItem(
              value: 'clear',
              child: Text(context.translate(AppStrings.clearCart)),
            ),
          ],
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.surfaceColor,
        title: Text(context.translate(AppStrings.delete)),
        titleTextStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        content: Text(context.translate(AppStrings.clearCartMessage)),
        contentTextStyle:
            context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        actions: [
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  width: double.infinity,
                  onPressed: () => context.router.popForced(),
                  label: AppStrings.cancel,
                  labelColor: context.defaultTextColor,
                  backgroundColor: AppUtils.isDarkMode(context)
                      ? context.colorScheme.tertiaryContainer
                      : null,
                  border: BorderSide(
                    color: context.colorScheme.primary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Consumer(builder: (context, WidgetRef ref, child) {
                  return PrimaryButton(
                    width: double.infinity,
                    label: context.translate(AppStrings.clearAll),
                    bgColor: CustomColors.getTransactionCardRedColor(context),
                    onPressed: () {
                      ref.read(cartProvider.notifier).clearCart();
                      final cashCustomer =
                          CustomerEntity(ledgerName: "Cash", isActive: true);
                      ref.read(cartProvider.notifier).setCustomer(cashCustomer);
                      context.router.popForced();
                    },
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
