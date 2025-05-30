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

  Widget _buildHeaderText(String text,
      {TextAlign textAlign = TextAlign.start, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: context.textTheme.bodySmall?.copyWith(
          color: context.defaultTextColor.withValues(alpha: 0.32),
        ),
        textAlign: textAlign,
      ),
    );
  }

  Widget _buildValueText(String value,
      {TextAlign textAlign = TextAlign.start, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        value,
        style: context.textTheme.bodySmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: context.defaultTextColor.withValues(alpha: 0.75),
        ),
        textAlign: textAlign,
      ),
    );
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
                ? const Color(0xFF2B2E30)
                : const Color(0xFFF9F9F9),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${widget.index + 1} - ${widget.items.item.itemName}",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ((widget.items.item.currentStock ?? 0) > 0)
                        ? context.translate(AppStrings.inStock)
                        : context.translate(AppStrings.outOfStock),
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
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.keyboard_arrow_down),
                    ),
                    onPressed: () => _isExpanded.value = !_isExpanded.value,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderText(
                    context.translate(AppStrings.barcode),
                    flex: 2,
                  ),
                  const SizedBox(width: 8),
                  _buildHeaderText(
                    context.translate(AppStrings.itemcode),
                    flex: 2,
                  ),
                  const SizedBox(width: 8),
                  _buildHeaderText(
                    context.translate(AppStrings.qty),
                    textAlign: TextAlign.center,
                    flex: 1,
                  ),
                  const SizedBox(width: 8),
                  _buildHeaderText(
                    context.translate(AppStrings.rate),
                    textAlign: TextAlign.end,
                    flex: 2,
                  ),
                  const SizedBox(width: 8),
                  _buildHeaderText(
                    "${context.translate(AppStrings.tax)} (${widget.items.item.taxPercentage?.toStringAsFixed(2) ?? '0.00'}%)",
                    textAlign: TextAlign.center,
                    flex: 2,
                  ),
                  const SizedBox(width: 8),
                  _buildHeaderText(
                    context.translate(AppStrings.netTotal),
                    textAlign: TextAlign.end,
                    flex: 2,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  _buildValueText(
                    widget.items.item.barcode ?? "",
                    flex: 2,
                  ),
                  const SizedBox(width: 8),
                  _buildValueText(
                    widget.items.item.itemCode ?? "",
                    flex: 2,
                  ),
                  const SizedBox(width: 8),
                  _buildValueText(
                    widget.items.qty.toString(),
                    textAlign: TextAlign.center,
                    flex: 1,
                  ),
                  const SizedBox(width: 8),
                  _buildValueText(
                    widget.items.rate.toStringAsFixed(2),
                    textAlign: TextAlign.end,
                    flex: 2,
                  ),
                  const SizedBox(width: 8),
                  _buildValueText(
                    widget.items.tax.toStringAsFixed(2),
                    textAlign: TextAlign.end,
                    flex: 2,
                  ),
                  const SizedBox(width: 8),
                  _buildValueText(
                    widget.items.netTotal.toStringAsFixed(2),
                    textAlign: TextAlign.end,
                    flex: 2,
                  ),
                ],
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      const Divider(height: 1),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _buildHeaderText(
                            context.translate(AppStrings.unit),
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          _buildHeaderText(
                            context.translate(AppStrings.discount),
                            textAlign: TextAlign.center,
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          _buildHeaderText(
                            context.translate(AppStrings.gross),
                            textAlign: TextAlign.end,
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          _buildHeaderText(
                            context.translate(AppStrings.total),
                            textAlign: TextAlign.end,
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          const Spacer(flex: 1),
                          const SizedBox(width: 8),
                          const Spacer(flex: 2),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          _buildValueText(
                            widget.items.unit,
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          _buildValueText(
                            widget.items.discount.toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          _buildValueText(
                            widget.items.gross.toStringAsFixed(2),
                            textAlign: TextAlign.end,
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          _buildValueText(
                            widget.items.netTotal.toStringAsFixed(2),
                            textAlign: TextAlign.end,
                            flex: 2,
                          ),
                          const SizedBox(width: 8),
                          const Spacer(flex: 1),
                          const SizedBox(width: 8),
                          const Spacer(flex: 2),
                        ],
                      ),
                    ],
                  ),
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        );
      },
    );
  }
}
