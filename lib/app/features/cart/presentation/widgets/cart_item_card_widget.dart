import 'package:flutter/material.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppUtils.isDarkMode(context)
                ? Color(0xFF2B2E30)
                : const Color(0xFFF9F9F9),
          ),
          child: Column(
            children: [
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
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onPressed: () => _isExpanded.value = !_isExpanded.value,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildContents(
                      context,
                      context.translate(AppStrings.barcode),
                      widget.items.item.barcode ?? "",
                    ),
                  ),
                  Expanded(
                    child: _buildContents(
                      context,
                      context.translate(AppStrings.itemcode),
                      widget.items.item.itemCode ?? "",
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: _buildContents(
                        context,
                        context.translate(AppStrings.unit),
                        widget.items.unit,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              if (isExpanded) ...[
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildContents(
                        context,
                        context.translate(AppStrings.rate),
                        widget.items.rate.toStringAsFixed(2),
                      ),
                    ),
                    Expanded(
                      child: _buildContents(
                          context,
                          "${context.translate(AppStrings.tax)} (${widget.items.item.taxPercentage?.toStringAsFixed(2)})",
                          widget.items.tax.toStringAsFixed(2),
                          textAlign: TextAlign.end),
                    ),
                    Expanded(
                      child: _buildContents(
                          context,
                          context.translate(AppStrings.total),
                          widget.items.netTotal.toStringAsFixed(2),
                          textAlign: TextAlign.end),
                    ),
                  ],
                ),
              ]
            ],
          ),
        );
      },
    );
  }

  Widget _buildContents(BuildContext context, String label, String content,
      {CrossAxisAlignment? crossAxisAlignment, TextAlign? textAlign}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.defaultTextColor.withValues(alpha: 0.32),
          ),
          textAlign: textAlign,
        ),
        SizedBox(height: 3),
        Text(
          content,
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: context.defaultTextColor.withValues(alpha: 0.75),
          ),
          textAlign: textAlign,
        )
      ],
    );
  }
}
