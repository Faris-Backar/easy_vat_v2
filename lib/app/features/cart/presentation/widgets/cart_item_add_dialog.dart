import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
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
  const CartItemAddDialog({super.key, required this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartItemAddDialogState();
}

class _CartItemAddDialogState extends ConsumerState<CartItemAddDialog> {
  final _quantityController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _priceWithoutTaxController = TextEditingController();
  final _unitController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityController.text = "1.0";
    _sellingPriceController.text =
        widget.item.retailRate?.toStringAsFixed(2) ?? "0.0";
    _priceWithoutTaxController.text =
        widget.item.cost?.toStringAsFixed(2) ?? "0.0";
    _unitController.text = widget.item.unit ?? "";
    _descriptionController.text = widget.item.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.tertiaryContainer,
      title: Text(AppStrings.addToCart),
      titleTextStyle: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      content: Column(
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
                  label: AppStrings.quantity,
                  controller: _sellingPriceController,
                  fillColor: context.colorScheme.tertiaryContainer,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            height: 36.h,
            label: AppStrings.priceWithOutTax,
            controller: _priceWithoutTaxController,
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
      contentTextStyle:
          context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      actions: [
        SecondaryButton(
          onPressed: () => context.router.popForced(),
          label: AppStrings.cancel,
          labelColor: context.defaultTextColor,
          backgroundColor: context.colorScheme.tertiary,
          border: BorderSide(
            color: context.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
        SizedBox(width: 5.w),
        PrimaryButton(
          label: AppStrings.addToCart,
          onPressed: () {
            final qty = double.tryParse(_quantityController.text);
            final total = (widget.item.retailRate ?? 0.0) * (qty ?? 0);
            final CartEntity cartEntity = CartEntity(
                item: widget.item,
                qty: qty ?? 0.0,
                cost: double.tryParse(_priceWithoutTaxController.text) ?? 0.0,
                price: double.tryParse(_sellingPriceController.text) ?? 0.0,
                description: _descriptionController.text,
                unit: _unitController.text,
                total: total);
            ref.read(cartProvider.notifier).addItemsIntoCart(item: cartEntity);
            context.router.popForced();
          },
        ),
      ],
    );
  }
}
