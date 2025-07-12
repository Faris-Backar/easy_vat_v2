import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_cart_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_add_dialog.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_details_card.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StockTransferCartList extends StatelessWidget {
  final List<StockTransferCartEntity> itemList;
  const StockTransferCartList({super.key, required this.itemList});

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
      startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            InkWell(
              child: Container(
                child: _buildSlidingAction(
                    width: 80.w,
                    onTap: () => _showDeleteDialog(context, index),
                    color: AppUtils.isDarkMode(context)
                        ? CustomColors.getTransactionCardRedColor(context)
                        : CustomColors.getTransactionCardRedColor(context)
                            .withValues(alpha: 0.15),
                    icon: Assets.icons.delete,
                    borderRadiusTopLeft: 10.0,
                    borderRadiusBottomLeft: 10.0,
                    borderRadiusBottomRight: 10.0,
                    borderRadiusTopRight: 10.0,
                    iconColor: AppUtils.isDarkMode(context)
                        ? context.onPrimaryColor
                        : null,
                    iconHeight: 24.0,
                    iconWidth: 24.0),
              ),
            )
          ]),
      endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.50,
          children: [
            InkWell(
              child: Container(
                child: _buildSlidingAction(
                    width: 80.w,
                    onTap: () => _showEditDialog(context, index),
                    color: AppUtils.isDarkMode(context)
                        ? CustomColors.getTransactionCardBlueColor(context)
                        : CustomColors.getTransactionCardBlueColor(context)
                            .withValues(alpha: 0.15),
                    icon: Assets.icons.edit,
                    borderRadiusTopLeft: 10.0,
                    borderRadiusBottomLeft: 10.0,
                    borderRadiusBottomRight: 0.0,
                    borderRadiusTopRight: 0.0,
                    iconColor: AppUtils.isDarkMode(context)
                        ? context.onPrimaryColor
                        : null,
                    iconHeight: 24.0,
                    iconWidth: 24.0),
              ),
            ),
            InkWell(
              child: Container(
                child: _buildSlidingAction(
                    width: 80.w,
                    onTap: () {},
                    color: AppUtils.isDarkMode(context)
                        ? CustomColors.getTransactionCardGreenColor(context)
                        : CustomColors.getTransactionCardGreenColor(context)
                            .withValues(alpha: 0.15),
                    icon: Assets.icons.transaction,
                    borderRadiusTopLeft: 0.0,
                    borderRadiusBottomLeft: 0.0,
                    borderRadiusBottomRight: 10.0,
                    borderRadiusTopRight: 10.0,
                    iconColor: AppUtils.isDarkMode(context)
                        ? context.onPrimaryColor
                        : null,
                    iconHeight: 24.0,
                    iconWidth: 24.0),
              ),
            )
          ]),
      child: InkWell(
          onTap: () => showDialog(
              context: context,
              builder: (context) => StockTransferAddDialog(
                    item: itemList[index].item,
                    cartItem: itemList[index],
                  )),
          child:
              StockTransferDetailsCard(items: itemList[index], index: index)),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: context.surfaceColor,
              title: Text(context.translate(AppStrings.delete)),
              titleTextStyle: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
              content:
                  Text(context.translate(AppStrings.deleteConfirmationInCart)),
              contentTextStyle: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              actions: [
                Row(
                  children: [
                    Expanded(
                        child: SecondaryButton(
                      onPressed: () {},
                      label: AppStrings.cancel,
                      labelColor: context.defaultTextColor,
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : null,
                      border: BorderSide(
                        color:
                            context.colorScheme.primary.withValues(alpha: 0.2),
                      ),
                    )),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(child:
                        Consumer(builder: (context, WidgetRef ref, child) {
                      return PrimaryButton(
                        width: double.infinity,
                        label: context.translate(AppStrings.delete),
                        bgColor:
                            CustomColors.getTransactionCardRedColor(context),
                        onPressed: () {
                          ref
                              .read(stockTransferProvider.notifier)
                              .removeItemFromCart(index: index);
                          context.router.popForced();
                        },
                      );
                    }))
                  ],
                )
              ],
            ));
  }

  void _showEditDialog(BuildContext context, int index) {
    TextEditingController descriptionController = TextEditingController();
    descriptionController.text = itemList[index].description;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.surfaceColor,
        title: Text(context.translate(AppStrings.description)),
        titleTextStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        content: SizedBox(
          width: 1.sw,
          child: TextInputFormField(
            controller: descriptionController,
            maxLines: 6,
            hint: AppStrings.description,
          ),
        ),
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
                    label: context.translate(AppStrings.submit),
                    bgColor: CustomColors.getTransactionCardBlueColor(context),
                    onPressed: () {
                      final updatedItem = itemList[index]
                          .copyWith(description: descriptionController.text);
                      ref
                          .read(stockTransferProvider.notifier)
                          .updateCartItem(cartItem: updatedItem);

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

  Widget _buildSlidingAction(
      {required Function()? onTap,
      required Color? color,
      required String icon,
      required Color? iconColor,
      double? borderRadiusTopLeft,
      double? borderRadiusTopRight,
      double? borderRadiusBottomLeft,
      double? borderRadiusBottomRight,
      double? width,
      double? iconHeight,
      double? iconWidth}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadiusTopLeft ?? 0.0),
                topRight: Radius.circular(borderRadiusTopRight ?? 0.0),
                bottomLeft: Radius.circular(borderRadiusBottomLeft ?? 0.0),
                bottomRight: Radius.circular(borderRadiusBottomRight ?? 0.0))),
        padding: const EdgeInsets.all(18.0),
        child: SvgIcon(
          height: iconHeight ?? 18,
          width: iconWidth ?? 18,
          icon: icon,
          color: iconColor,
        ),
      ),
    );
  }
}
