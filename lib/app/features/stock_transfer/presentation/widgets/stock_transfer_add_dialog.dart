import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/domain/entities/stock_transfer_cart_entity.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockTransferAddDialog extends ConsumerStatefulWidget {
  final ItemEntity item;
  final StockTransferCartEntity? cartItem;
  const StockTransferAddDialog({super.key, required this.item, this.cartItem});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StockTransferAddDialogState();
}

class _StockTransferAddDialogState
    extends ConsumerState<StockTransferAddDialog> {
  StockTransferCartEntity? cart;
  late ItemEntity item;
  final _unitController = TextEditingController();
  final _requestedQtyController = TextEditingController();
  final _transferQtyController = TextEditingController();
  final _retailRateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  final _netCostController = TextEditingController();
  final _sellValueController = TextEditingController();

  //bool _isUpdatingFromQuantity = false;

  final _decimalInputFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));

  @override
  void initState() {
    super.initState();
    cart = widget.cartItem;
    item = widget.item;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _unitController.text = cart?.unit ?? item.unit ?? "";
      final double qty = cart?.transferQty ?? 1.0;
      _transferQtyController.text = qty.toStringAsFixed(2);
      _retailRateController.text = cart?.retailRate.toStringAsFixed(2) ??
          item.retailRate?.toStringAsFixed(2) ??
          "";
      _costController.text =
          cart?.cost.toStringAsFixed(2) ?? item.cost?.toStringAsFixed(2) ?? "";
      _updateNetCostOnQtyChange();
    });
  }

  void _updateNetCostOnQtyChange() {
    //_isUpdatingFromQuantity = true;

    final qty = double.tryParse(_transferQtyController.text) ?? 1.0;
    final retailRate = double.tryParse(_retailRateController.text) ?? 0.0;
    final cost = double.tryParse(_costController.text) ?? 0.0;
    final netCost = cost * qty;
    _netCostController.text = netCost.toStringAsFixed(2);
    final sellValue = retailRate * qty;
    _sellValueController.text = sellValue.toStringAsFixed(2);

    //_isUpdatingFromQuantity = false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.tertiaryContainer,
      title: Text(widget.item.itemName ?? ""),
      titleTextStyle: context.textTheme.titleSmall
          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
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
                    label: context.translate(AppStrings.requestedQty),
                    controller: _requestedQtyController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    enabled: false,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: context.translate(AppStrings.transferQty),
                    controller: _transferQtyController,
                    fillColor: context.colorScheme.tertiaryContainer,
                    textInputAction: TextInputAction.next,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [_decimalInputFormatter],
                    maxLines: 1,
                    onTap: () => _transferQtyController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset:
                                _transferQtyController.value.text.length),
                    onChanged: (value) => _updateNetCostOnQtyChange(),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return "Please enter a valid quantity";
                      }
                      return null;
                    },
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
                  label: context.translate(AppStrings.retailRate),
                  controller: _retailRateController,
                  fillColor: context.colorScheme.tertiaryContainer,
                  enabled: false,
                )),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                    child: TextInputFormField(
                  height: 36.h,
                  label: context.translate(AppStrings.cost),
                  controller: _costController,
                  fillColor: context.colorScheme.tertiaryContainer,
                  enabled: false,
                )),
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
                    label: context.translate(AppStrings.netCost),
                    fillColor: context.colorScheme.tertiaryContainer,
                    textInputAction: TextInputAction.next,
                    controller: _netCostController,
                    maxLines: 1,
                    onTap: () => _netCostController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _netCostController.value.text.length),
                    onChanged: (value) => _updateNetCostOnQtyChange(),
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: context.translate(AppStrings.sellValue),
                    fillColor: context.colorScheme.tertiaryContainer,
                    textInputAction: TextInputAction.next,
                    controller: _sellValueController,
                    maxLines: 1,
                    onTap: () => _sellValueController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _sellValueController.value.text.length),
                    onChanged: (value) => _updateNetCostOnQtyChange(),
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
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
          label: context.translate(AppStrings.cancel),
          labelColor: context.defaultTextColor,
          backgroundColor: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiary
              : null,
          border: BorderSide(
              color: context.colorScheme.primary.withValues(alpha: 0.2)),
        ),
        PrimaryButton(
          label: widget.cartItem != null
              ? context.translate(AppStrings.updateItem)
              : context.translate(AppStrings.addToCart),
          onPressed: _handleCartAction,
        )
      ],
    );
  }

  void _handleCartAction() {
    final cartNotifier = ref.read(stockTransferProvider.notifier);
    final transferQty = double.tryParse(_transferQtyController.text) ?? 0.0;
    final requestedQty = double.tryParse(_requestedQtyController.text) ?? 0.0;
    final qty = double.tryParse(_transferQtyController.text) ?? 0.0;
    final retailRate = double.tryParse(_retailRateController.text) ?? 0.0;
    final cost = double.tryParse(_costController.text) ?? 0.0;
    final netCost = cost * qty;
    _netCostController.text = netCost.toStringAsFixed(2);
    final sellValue = retailRate * qty;
    _sellValueController.text = sellValue.toStringAsFixed(2);

    final stockTransferCartEntity = StockTransferCartEntity(
        cartItemId: widget.cartItem != null
            ? widget.cartItem!.cartItemId
            : (ref.read(stockTransferProvider).itemList?.length ?? 0) + 1,
        item: widget.item,
        transferQty: transferQty,
        netCost: netCost,
        requestedQty: requestedQty,
        cost: cost,
        unit: _unitController.text,
        description: _descriptionController.text,
        retailRate: retailRate,
        sellValue: sellValue);
    if (widget.cartItem == null) {
      cartNotifier.addItemsIntoCart(item: stockTransferCartEntity);
      AppUtils.showToast(context,
          "${stockTransferCartEntity.item.itemName} - ${context.translate(AppStrings.addedToCart)}");
    } else {
      cartNotifier.updateCartItem(cartItem: stockTransferCartEntity);
    }
    context.router.popForced();
  }
}
