import 'dart:developer';
import 'package:flutter/services.dart'; // Add this import for input filters

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
  final _grossTotalController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _discountController = TextEditingController();
  final _taxController = TextEditingController();
  double taxPercentage = 0.0;

  final _costVisibilityNotifier = ValueNotifier(false);
  final _passwordVisibilityNotifier = ValueNotifier(false);
  // Flag to prevent circular updates
  bool _isUpdatingFromNetTotal = false;
  bool _isUpdatingFromQuantity = false;
  bool _isUpdatingFromDiscount = false;

  // Create decimal number formatter that only allows numbers and decimal point
  final _decimalInputFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));

  @override
  void initState() {
    super.initState();
    cart = widget.cartItem;
    item = widget.item;

    taxPercentage = item.taxPercentage ?? 0.0;

    final double qty = cart?.qty ?? 1.00;
    final double sellingPrice = (cart?.rate ?? item.retailRate) ?? 0.0;
    final double discount = cart?.discount ?? 0.0;

    final double grossTotal = (qty * sellingPrice) - discount;
    final double taxAmount = grossTotal * taxPercentage / 100;
    final double netTotal = grossTotal + taxAmount;

    _taxController.text = taxAmount.toStringAsFixed(2);

    log("Selling Price => $sellingPrice || Quantity => $qty || Gross Total => $grossTotal || Discount => $discount || Tax => $taxAmount || Net Total => $netTotal");

    _quantityController.text = qty.toStringAsFixed(2);
    _sellingPriceController.text = sellingPrice.toStringAsFixed(2);
    _costPriceController.text = cart?.cost.toStringAsFixed(2) ??
        item.cost?.toStringAsFixed(2) ??
        "0.00";
    _priceWithTaxController.text =
        (sellingPrice * (1 + taxPercentage / 100)).toStringAsFixed(2);
    _unitController.text = cart?.unit ?? item.unit ?? "";
    _descriptionController.text = cart?.description ?? item.description ?? "";
    _discountController.text = discount.toStringAsFixed(2);
    _grossTotalController.text = grossTotal.toStringAsFixed(2);
    _netTotalController.text = netTotal.toStringAsFixed(2);
  }

  void _updatePricesOnQtyChange() {
    if (_isUpdatingFromNetTotal || _isUpdatingFromDiscount) {
      return; // Prevent circular updates
    }
    _isUpdatingFromQuantity = true;

    final qty = double.tryParse(_quantityController.text) ?? 1.0;
    final sellingPrice = double.tryParse(_sellingPriceController.text) ?? 0.0;
    final discount = double.tryParse(_discountController.text) ?? 0.0;
    final grossTotal = (qty * sellingPrice) - discount;
    final taxAmount = grossTotal * (taxPercentage / 100);
    final netTotal = grossTotal + taxAmount;
    _taxController.text = taxAmount.toStringAsFixed(2);

    _grossTotalController.text = grossTotal.toStringAsFixed(2);
    _netTotalController.text = netTotal.toStringAsFixed(2);

    _isUpdatingFromQuantity = false;
  }

  void _updatePriceWithTax() {
    final sellingPrice = double.tryParse(_sellingPriceController.text) ?? 0.0;
    final priceWithTax = sellingPrice + (sellingPrice * taxPercentage / 100);
    final taxAmount = sellingPrice * taxPercentage / 100;
    _taxController.text = taxAmount.toStringAsFixed(2);

    _priceWithTaxController.text = priceWithTax.toStringAsFixed(2);
    _updatePricesOnQtyChange();
  }

  void _updateSellingPrice() {
    final priceWithTax = double.tryParse(_priceWithTaxController.text) ?? 0.0;
    final sellingPrice = priceWithTax / (1 + taxPercentage / 100);
    final taxAmount = sellingPrice * taxPercentage / 100;
    _taxController.text = taxAmount.toStringAsFixed(2);

    _sellingPriceController.text = sellingPrice.toStringAsFixed(2);
    _updatePricesOnQtyChange();
  }

  // New method to update calculations when discount changes
  void _updateFromDiscount(String? value) {
    if (_isUpdatingFromNetTotal || _isUpdatingFromQuantity) return;

    _isUpdatingFromDiscount = true;

    final qty = double.tryParse(_quantityController.text) ?? 1.0;
    final sellingPrice = double.tryParse(_sellingPriceController.text) ?? 0.0;
    final discount = double.tryParse(value ?? _discountController.text) ?? 0.0;

    // Calculate new gross total with discount applied
    final grossTotal = (qty * sellingPrice) - discount;

    // Calculate tax amount based on the gross total (after discount)
    final taxAmount = grossTotal * (taxPercentage / 100);

    // Calculate net total (gross + tax)
    final netTotal = grossTotal + taxAmount;

    // Update the text fields
    _grossTotalController.text = grossTotal.toStringAsFixed(2);
    _netTotalController.text = netTotal.toStringAsFixed(2);
    _taxController.text = taxAmount.toStringAsFixed(2);
    _isUpdatingFromDiscount = false;
  }

  // New method to update calculations when net total changes
  void _updateSellingPriceFromNetTotal() {
    if (_isUpdatingFromQuantity || _isUpdatingFromDiscount) return;

    _isUpdatingFromNetTotal = true;

    // Fetch current values
    final netTotal = double.tryParse(_netTotalController.text) ?? 0.0;
    final qty = double.tryParse(_quantityController.text) ?? 1.0;
    final discount = double.tryParse(_discountController.text) ?? 0.0;

    // Calculate gross total from net total using the provided formula
    double grossTotal = (netTotal * 100) / (100 + taxPercentage);

    // Calculate rate (selling price without tax) and sell price with tax
    double rate = (grossTotal + discount) / qty;
    double sellPriceWithTax = netTotal / qty;

    // Update the fields with new calculated values
    _sellingPriceController.text = rate.toStringAsFixed(2);
    _priceWithTaxController.text = sellPriceWithTax.toStringAsFixed(2);

    // Also update the gross total and net total if needed (to keep things in sync)
    _grossTotalController.text = grossTotal.toStringAsFixed(2);

    _isUpdatingFromNetTotal = false;
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
                    label: context.translate(AppStrings.unit),
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
                    label: context.translate(AppStrings.quantity),
                    controller: _quantityController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    textInputAction: TextInputAction.next,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [_decimalInputFormatter],
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
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 5.w,
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
                    valueListenable: _costVisibilityNotifier,
                    builder: (context, bool isCostVisibile, child) {
                      return TextInputFormField(
                        height: 36.h,
                        label: context.translate(isCostVisibile
                            ? AppStrings.cost
                            : AppStrings.sellingPrice),
                        controller: isCostVisibile
                            ? _costPriceController
                            : _sellingPriceController,
                        fillColor: context.colorScheme.tertiaryContainer,
                        onChanged: (value) => _updatePriceWithTax(),
                        onTap: () {
                          final controller = isCostVisibile
                              ? _costPriceController
                              : _sellingPriceController;
                          controller.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: controller.value.text.length,
                          );
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [_decimalInputFormatter],
                        maxLines: 1,
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (_costVisibilityNotifier.value) {
                              _costVisibilityNotifier.value =
                                  !_costVisibilityNotifier.value;
                            } else {
                              _showPasswordDialog(context);
                            }
                          },
                          icon: Icon(
                            isCostVisibile
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                        textAlign: TextAlign.right,
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
                    label: context.translate(AppStrings.priceWithTax),
                    controller: _priceWithTaxController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    onTap: () => _priceWithTaxController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset:
                                _priceWithTaxController.value.text.length),
                    onChanged: (value) => _updateSellingPrice(),
                    textInputAction: TextInputAction.next,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [_decimalInputFormatter],
                    maxLines: 1,
                    textAlign: TextAlign.right,
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
                    label: context.translate(AppStrings.discount),
                    hint: context.translate(AppStrings.discount),
                    controller: _discountController,
                    onTap: () => _discountController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _discountController.value.text.length),
                    onChanged: (value) => _updateFromDiscount(value),
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [_decimalInputFormatter],
                    fillColor: context.colorScheme.tertiaryContainer,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: context.translate(AppStrings.gross),
                    enabled: false,
                    controller: _grossTotalController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    textAlign: TextAlign.right,
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
                    label:
                        "${context.translate(AppStrings.tax)}( $taxPercentage %)",
                    hint: "0 %",
                    controller: _taxController,
                    enabled: false,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    fillColor: context.colorScheme.tertiaryContainer,
                    onTap: () => _taxController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _taxController.value.text.length),
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: context.translate(AppStrings.netTotal),
                    controller: _netTotalController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    onTap: () => _netTotalController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _netTotalController.value.text.length),
                    onChanged: (value) => _updateSellingPriceFromNetTotal(),
                    textInputAction: TextInputAction.next,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [_decimalInputFormatter],
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
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
          label: context.translate(AppStrings.cancel),
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
                ? context.translate(AppStrings.updateItem)
                : context.translate(AppStrings.addToCart),
            onPressed: _handleCartAction),
      ],
    );
  }

  void _handleCartAction() {
    final cartNotifier = ref.read(cartProvider.notifier);
    final qty = double.tryParse(_quantityController.text) ?? 0.0;
    final discount = double.tryParse(_discountController.text) ?? 0.0;
    final rate = double.tryParse(_sellingPriceController.text) ?? 0.0;
    final cost = double.tryParse(_costPriceController.text) ?? 0.0;

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
          ? widget.cartItem!.cartItemId
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

// Add this method to your class
  void _showPasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.translate(AppStrings.enterPassword)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.translate(AppStrings.enterPasswordToViewCost),
                style: context.textTheme.bodySmall,
              ),
              SizedBox(height: 16.h),
              ValueListenableBuilder(
                  valueListenable: _passwordVisibilityNotifier,
                  builder: (BuildContext context, bool isCostVisibile,
                      Widget? child) {
                    return TextInputFormField(
                      label: AppStrings.password,
                      maxLength: 6,
                      controller: passwordController,
                      isPasswordVisible: !_passwordVisibilityNotifier.value,
                      suffixIcon: IconButton(
                        onPressed: () => _passwordVisibilityNotifier.value =
                            !_passwordVisibilityNotifier.value,
                        icon: Icon(
                          isCostVisibile
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                        ),
                      ),
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      prefixIcon: Icon(Icons.lock),
                      hint: context.translate(AppStrings.password),
                      onFieldSubmitted: (value) =>
                          _verifyPassword(context, value, passwordController),
                    );
                  }),
            ],
          ),
          actions: [
            SecondaryButton(
              onPressed: () => context.router.popForced(),
              label: context.translate(AppStrings.cancel),
              labelColor: context.defaultTextColor,
            ),
            PrimaryButton(
              onPressed: () => _verifyPassword(
                  context, passwordController.text, passwordController),
              label: context.translate(AppStrings.verify),
            ),
          ],
        );
      },
    );
  }

  void _verifyPassword(BuildContext context, String enteredPassword,
      TextEditingController controller) {
    final String dummyPassword = "111111";

    if (enteredPassword == dummyPassword) {
      _costVisibilityNotifier.value = !_costVisibilityNotifier.value;
      context.router.popForced();

      // // Show success message (optional)
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       _passwordVisibilityNotifier.value
      //           ? context.translate(AppStrings.costPriceVisible)
      //           : context.translate(AppStrings.sellingPriceVisible),
      //     ),
      //     backgroundColor: Colors.green,
      //     duration: Duration(seconds: 2),
      //   ),
      // );
    } else {
      // Password incorrect - show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.translate(AppStrings.incorrectPassword)),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );

      // Clear the password field and keep dialog open
      controller.clear();
    }
  }
}
