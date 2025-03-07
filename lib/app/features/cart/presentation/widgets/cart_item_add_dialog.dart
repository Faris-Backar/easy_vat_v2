import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemAddDialog extends ConsumerStatefulWidget {
  final ItemEntity item;
  final CartEntity? cartItem;
  const CartItemAddDialog({super.key, required this.item, this.cartItem});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartItemAddDialogState();
}

class _CartItemAddDialogState extends ConsumerState<CartItemAddDialog> {
  final _quantityController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _costPriceController = TextEditingController();
  final _priceWithoutTaxController = TextEditingController();
  final _unitController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _discountController = TextEditingController();

  final _passwordVisibilityNotifier = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    if (widget.cartItem != null) {
      _quantityController.text = widget.cartItem?.qty.toStringAsFixed(2) ?? "";
      _sellingPriceController.text =
          widget.cartItem?.price.toStringAsFixed(2) ?? "0.0";
      _priceWithoutTaxController.text =
          widget.cartItem?.cost.toStringAsFixed(2) ?? "0.0";
      _unitController.text = widget.cartItem?.unit ?? "";
      _descriptionController.text = widget.cartItem?.description ?? "";
      _costPriceController.text =
          widget.cartItem?.cost.toStringAsFixed(2) ?? "0.00";
    } else {
      _quantityController.text = "1.00";
      _sellingPriceController.text =
          widget.item.retailRate?.toStringAsFixed(2) ?? "0.00";
      _priceWithoutTaxController.text =
          widget.item.cost?.toStringAsFixed(2) ?? "0.00";
      _unitController.text = widget.item.unit ?? "";
      _descriptionController.text = widget.item.description ?? "";
      _costPriceController.text =
          widget.item.cost?.toStringAsFixed(2) ?? "0.00";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.tertiaryContainer,
      title: Text(widget.item.itemName ?? ""),
      titleTextStyle: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    height: 36.h,
                    label: AppStrings.quantity,
                    controller: _quantityController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: CustomTextField(
                    height: 36.h,
                    label: AppStrings.sellingPrice,
                    controller: _sellingPriceController,
                    fillColor: context.colorScheme.tertiaryContainer,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: _passwordVisibilityNotifier,
                    builder: (context, bool isPasswordVisible, child) {
                      return CustomTextField(
                        height: 36.h,
                        label: AppStrings.cost,
                        enabled: false,
                        controller: _costPriceController,
                        fillColor: context.colorScheme.tertiaryContainer,
                        passwordvisibility: _passwordVisibilityNotifier.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _passwordVisibilityNotifier.value =
                                !_passwordVisibilityNotifier.value;
                          },
                          icon: isPasswordVisible
                              ? Icon(Icons.visibility_rounded)
                              : Icon(
                                  Icons.visibility_off_rounded,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: CustomTextField(
                    height: 36.h,
                    label: AppStrings.priceWithOutTax,
                    controller: _priceWithoutTaxController,
                    fillColor: context.colorScheme.tertiaryContainer,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              height: 36.h,
              label: AppStrings.discount,
              enabled: false,
              hint: AppStrings.discount,
              controller: _discountController,
              fillColor: context.colorScheme.tertiaryContainer,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              height: 36.h,
              label: AppStrings.unit,
              enabled: false,
              controller: _unitController,
              fillColor: context.colorScheme.tertiaryContainer,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              height: 36.h,
              label: AppStrings.description,
              controller: _descriptionController,
              fillColor: context.colorScheme.tertiaryContainer,
              hint: AppStrings.description,
            )
          ],
        ),
      ),
      contentTextStyle:
          context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      actions: [
        SecondaryButton(
          onPressed: () => context.router.popForced(),
          label: AppStrings.cancel,
          labelColor: context.defaultTextColor,
          backgroundColor: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiary
              : null,
          border: BorderSide(
            color: context.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
        SizedBox(width: 5.w),
        PrimaryButton(
          label: widget.cartItem != null
              ? AppStrings.updateItem
              : AppStrings.addToCart,
          onPressed: () {
            if (widget.cartItem == null) {
              final qty = double.tryParse(_quantityController.text);
              final total = (widget.item.retailRate ?? 0.0) * (qty ?? 0);
              final CartEntity cartEntity = CartEntity(
                  cartItemId:
                      (ref.read(cartProvider).itemList?.length ?? 0) + 1,
                  item: widget.item,
                  qty: qty ?? 0.0,
                  cost: double.tryParse(_priceWithoutTaxController.text) ?? 0.0,
                  price: double.tryParse(_sellingPriceController.text) ?? 0.0,
                  description: _descriptionController.text,
                  discount: double.tryParse(_discountController.text) ?? 0.0,
                  unit: _unitController.text,
                  total: total,
                  tax: 0.0);
              ref
                  .read(cartProvider.notifier)
                  .addItemsIntoCart(item: cartEntity);
              context.router.popForced();
            } else {
              final qty = double.tryParse(_quantityController.text);
              final total = (widget.item.retailRate ?? 0.0) * (qty ?? 0);
              final cartEntity = widget.cartItem!.copyWith(
                qty: qty,
                cost: double.tryParse(_priceWithoutTaxController.text),
                price: double.tryParse(_priceWithoutTaxController.text),
                description: _descriptionController.text,
                total: total,
                unit: _unitController.text,
              );
              ref
                  .read(cartProvider.notifier)
                  .updateCartItem(cartItem: cartEntity);
              context.router.popForced();
            }
          },
        ),
      ],
    );
  }
}
