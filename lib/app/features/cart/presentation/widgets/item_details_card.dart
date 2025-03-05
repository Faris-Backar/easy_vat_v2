import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/items/domain/entities/item_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';

class ItemDetailsCard extends StatelessWidget {
  final ItemEntity items;
  const ItemDetailsCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
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
              Text(
                items.itemName ?? "",
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                items.isActive == true
                    ? AppStrings.inStock
                    : AppStrings.outOfStock,
                style: context.textTheme.bodySmall?.copyWith(
                  color: items.isActive == true ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildContents(
                  context,
                  AppStrings.barcode,
                  items.barcode ?? "",
                ),
              ),
              Expanded(
                child: _buildContents(
                  context,
                  AppStrings.itemcode,
                  items.itemCode ?? "",
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: _buildContents(
                    context,
                    AppStrings.cost,
                    items.cost?.toStringAsFixed(2) ?? "0.0",
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: _buildContents(
                    context,
                    AppStrings.price,
                    items.retailRate?.toStringAsFixed(2) ?? "0.0",
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: _buildContents(
                    context,
                    AppStrings.unit,
                    items.unit ?? "",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContents(BuildContext context, String label, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.defaultTextColor.withValues(alpha: 0.32),
          ),
        ),
        SizedBox(height: 3),
        Text(
          content,
          style: context.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: context.defaultTextColor.withValues(alpha: 0.75)),
        )
      ],
    );
  }
}
