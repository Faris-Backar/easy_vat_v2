import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
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
  CartEntity? cart;
  late ItemEntity item;
  final _quantityController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _costPriceController = TextEditingController();
  final _priceWithTaxController = TextEditingController();
  final _unitController = TextEditingController();
  final _netTotalController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _discountController = TextEditingController();
  final _taxController = TextEditingController();

  final _passwordVisibilityNotifier = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    cart = widget.cartItem;
    item = widget.item;
    final sellingPrice =
        (((cart?.rate ?? item.retailRate) ?? 0.0) * (cart?.qty ?? 1.00));
    final priceWithTax =
        (sellingPrice + (sellingPrice * (item.taxPercentage ?? 1) / 100));
    log("selling price => $sellingPrice || $priceWithTax");
    _quantityController.text = cart?.qty.toStringAsFixed(2) ?? "1.00";
    _sellingPriceController.text = cart?.rate.toStringAsFixed(2) ??
        item.retailRate?.toStringAsFixed(2) ??
        "0.00";
    _costPriceController.text = cart?.cost.toStringAsFixed(2) ??
        item.cost?.toStringAsFixed(2) ??
        "0.00";
    _priceWithTaxController.text = priceWithTax.toStringAsFixed(2);
    _unitController.text = cart?.unit ?? item.unit ?? "";
    _descriptionController.text = cart?.description ?? item.description ?? "";
    _discountController.text = cart?.discount.toStringAsFixed(2) ?? "0.00";
    _taxController.text = cart?.item.taxPercentage?.toStringAsFixed(2) ??
        item.taxPercentage?.toStringAsFixed(2) ??
        "0.0";
  }

  // @override
  // void dispose() {
  //   _quantityController.dispose();
  //   _sellingPriceController.dispose();
  //   _priceWithTaxController.dispose();
  //   _quantityController.dispose();
  //   _costPriceController.dispose();
  //   super.dispose();
  // }

  void _updatePricesOnQtyChange() {
    final qty = double.tryParse(_quantityController.text) ?? 1;
    final basePrice = cart?.rate ?? item.retailRate ?? 1.0;
    final sellingPrice = basePrice * qty;
    final taxPercentage = cart?.item.taxPercentage ?? item.taxPercentage ?? 1.0;
    final priceWithTax = sellingPrice + (sellingPrice * taxPercentage / 100);
    _sellingPriceController.text = sellingPrice.toStringAsFixed(2);
    _priceWithTaxController.text = priceWithTax.toStringAsFixed(2);
  }

  void _updatePriceWithTax() {
    final sellingPrice = double.tryParse(_sellingPriceController.text) ?? 0.0;
    final taxPercentage = cart?.item.taxPercentage ?? item.taxPercentage ?? 1.0;
    final priceWithTax = sellingPrice + (sellingPrice * taxPercentage / 100);
    _priceWithTaxController.text = priceWithTax.toStringAsFixed(2);
  }

  void _updateSellingPrice() {
    final priceWithTax = double.tryParse(_priceWithTaxController.text) ?? 0.0;
    final taxPercentage = cart?.item.taxPercentage ?? item.taxPercentage ?? 1.0;
    final sellingPrice = priceWithTax / (1 + taxPercentage / 100);
    _sellingPriceController.text = sellingPrice.toStringAsFixed(2);
  }

  void _updateNetTotal() {
    final qty = double.tryParse(_quantityController.text) ?? 1.0;
    final sellingPrice = double.tryParse(_sellingPriceController.text) ?? 0.0;
    final taxPercentage = cart?.item.taxPercentage ?? item.taxPercentage ?? 1.0;
    final gross = sellingPrice * qty;
    final tax = gross * (taxPercentage / 100);
    final netTotal = gross + tax;
    _netTotalController.text = netTotal.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.tertiaryContainer,
      title: Text(widget.item.itemName ?? ""),
      titleTextStyle: context.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: AppStrings.quantity,
                    controller: _quantityController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    maxLines: 1,
                    onTap: () => _quantityController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _quantityController.value.text.length),
                    onChanged: (value) => _updatePricesOnQtyChange(),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return "Please enter a valid amount";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: AppStrings.sellingPrice,
                    controller: _sellingPriceController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    onChanged: (value) => _updatePriceWithTax(),
                    onTap: () => _sellingPriceController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset:
                                _sellingPriceController.value.text.length),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    maxLines: 1,
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
                      return TextInputFormField(
                        height: 36.h,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number,
                        maxLines: 1,
                        label: AppStrings.cost,
                        enabled: false,
                        controller: _costPriceController,
                        fillColor: context.colorScheme.tertiaryContainer,
                        isPasswordVisible: _passwordVisibilityNotifier.value,
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
                  child: TextInputFormField(
                    height: 36.h,
                    label: AppStrings.priceWithTax,
                    controller: _priceWithTaxController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    onTap: () => _priceWithTaxController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset:
                                _priceWithTaxController.value.text.length),
                    onChanged: (value) => _updateSellingPrice(),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: AppStrings.discount,
                    hint: AppStrings.discount,
                    controller: _discountController,
                    onTap: () => _discountController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _discountController.value.text.length),
                    textInputType: TextInputType.number,
                    fillColor: context.colorScheme.tertiaryContainer,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: AppStrings.tax,
                    hint: AppStrings.tax,
                    controller: _taxController,
                    enabled: false,
                    textInputType: TextInputType.number,
                    fillColor: context.colorScheme.tertiaryContainer,
                    onTap: () => _taxController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _taxController.value.text.length),
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
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
                  child: TextInputFormField(
                    height: 36.h,
                    label: AppStrings.unit,
                    enabled: false,
                    controller: _unitController,
                    fillColor: context.colorScheme.tertiaryContainer,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: AppStrings.netTotal,
                    onChanged: (value) => _updateNetTotal(),
                    enabled: false,
                    controller: _netTotalController,
                    fillColor: context.colorScheme.tertiaryContainer,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextInputFormField(
              label: AppStrings.description,
              controller: _descriptionController,
              fillColor: context.colorScheme.tertiaryContainer,
              hint: AppStrings.description,
              maxLines: 3,
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
            onPressed: _handleCartAction),
      ],
    );
  }

  void _handleCartAction() {
    final cartNotifier = ref.read(cartProvider.notifier);
    final qty = double.tryParse(_quantityController.text) ?? 0.0;
    final discount = double.tryParse(_discountController.text) ?? 0.0;
    final rate = double.tryParse(_sellingPriceController.text) ?? 0.0;
    final cost = double.tryParse(_priceWithTaxController.text) ?? 0.0;

    final gross = cartNotifier.calculateGross(
        retailRate: rate, qty: qty, discount: discount);
    final tax = cartNotifier.calculateTotalTax(
        retailRate: rate,
        qty: qty,
        taxPercentage: widget.item.taxPercentage ?? 1);
    final priceBeforeTax =
        cartNotifier.calculateBeforeTax(retailRate: rate, qty: qty);
    final netTotal = gross + tax;

    final cartEntity = CartEntity(
      cartItemId: widget.cartItem != null
          ? ref.read(cartProvider).itemList?.length ?? 0
          : (ref.read(cartProvider).itemList?.length ?? 0) + 1,
      item: widget.item,
      qty: qty,
      cost: cost,
      rate: rate,
      description: _descriptionController.text,
      discount: discount,
      unit: _unitController.text,
      netTotal: netTotal,
      gross: gross,
      priceBeforeTax: priceBeforeTax,
      tax: tax,
    );
    log("rate split up => \n $cartEntity\n ${widget.item.taxPercentage}");
    if (widget.cartItem == null) {
      cartNotifier.addItemsIntoCart(item: cartEntity);
    } else {
      cartNotifier.updateCartItem(cartItem: cartEntity);
    }

    context.router.popForced();
  }
}
