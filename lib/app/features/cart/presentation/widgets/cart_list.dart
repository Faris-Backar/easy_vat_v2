import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_item_add_dialog.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/cart_item_card_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartList extends StatelessWidget {
  final List<CartEntity> itemList;
  const CartList({super.key, required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: _buildSlidableItem(context, index),
      ),
    );
  }

  Widget _buildSlidableItem(BuildContext context, int index) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.15,
        children: [
          InkWell(
            onTap: () => _showDeleteDialog(context, index),
            child: Container(
              height: 88.h,
              width: 43.w,
              color: AppUtils.isDarkMode(context)
                  ? CustomColors.getTransactionCardRedColor(context)
                  : CustomColors.getTransactionCardRedColor(context)
                      .withValues(alpha: 0.15),
              padding: const EdgeInsets.all(12.0),
              child: SvgIcon(
                  icon: Assets.icons.delete,
                  color: AppUtils.isDarkMode(context)
                      ? context.onPrimaryColor
                      : null),
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (context) => CartItemAddDialog(
            item: itemList[index].item,
            cartItem: itemList[index],
          ),
        ),
        child: CartItemCardWidget(
          items: itemList[index],
          index: index,
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.surfaceColor,
        title: Text(AppStrings.delete),
        titleTextStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        content: Text(AppStrings.deleteConfirmationInCart),
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
                    label: AppStrings.delete,
                    bgColor: CustomColors.getTransactionCardRedColor(context),
                    onPressed: () {
                      ref
                          .read(cartProvider.notifier)
                          .removeItemFromCart(index: index);
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
}
