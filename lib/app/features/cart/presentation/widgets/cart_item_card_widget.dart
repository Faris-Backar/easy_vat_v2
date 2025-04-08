import 'package:flutter/material.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';

class CartItemCardWidget extends StatefulWidget {
  final CartEntity items;
  final int index;
  const CartItemCardWidget({
    super.key,
    required this.items,
    required this.index,
  });

  @override
  State<CartItemCardWidget> createState() => _CartItemCardWidgetState();
}

class _CartItemCardWidgetState extends State<CartItemCardWidget> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isExpanded,
      builder: (context, isExpanded, child) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppUtils.isDarkMode(context)
                ? Color(0xFF2B2E30)
                : const Color(0xFFF9F9F9),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row with title and expand/collapse button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${widget.index + 1} - ${widget.items.item.itemName}",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    widget.items.item.isActive == true
                        ? AppStrings.inStock
                        : AppStrings.outOfStock,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: widget.items.item.isActive == true
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                    onPressed: () => _isExpanded.value = !_isExpanded.value,
                  ),
                ],
              ),

              // Middle row that's always visible
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.barcode),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.defaultTextColor
                                .withValues(alpha: 0.32),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.items.item.barcode ?? "",
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: context.defaultTextColor
                                .withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.itemcode),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.defaultTextColor
                                .withValues(alpha: 0.32),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.items.item.itemCode ?? "",
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: context.defaultTextColor
                                .withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.unit),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.defaultTextColor
                                .withValues(alpha: 0.32),
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.items.unit,
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: context.defaultTextColor
                                .withValues(alpha: 0.75),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.qty),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.defaultTextColor
                                .withValues(alpha: 0.32),
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.items.qty.toString(),
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: context.defaultTextColor
                                .withValues(alpha: 0.75),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.translate(AppStrings.netTotal),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.defaultTextColor
                                .withValues(alpha: 0.32),
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 3),
                        Text(
                          widget.items.netTotal.toStringAsFixed(2),
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: context.defaultTextColor
                                .withValues(alpha: 0.75),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isExpanded ? 60 : 0,
                child: ClipRect(
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.translate(AppStrings.qty),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.32),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    widget.items.qty.toStringAsFixed(2),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.75),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.translate(AppStrings.rate),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.32),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    widget.items.rate.toStringAsFixed(2),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.75),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.translate(AppStrings.discount),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.32),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    widget.items.discount.toStringAsFixed(2),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.75),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.translate(AppStrings.gross),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.32),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    widget.items.gross.toStringAsFixed(2),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.75),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${context.translate(AppStrings.tax)} (${widget.items.item.taxPercentage?.toStringAsFixed(2)}%)",
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.32),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    widget.items.tax.toStringAsFixed(2),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.75),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.translate(AppStrings.total),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.32),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    widget.items.netTotal.toStringAsFixed(2),
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: context.defaultTextColor
                                          .withValues(alpha: 0.75),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
