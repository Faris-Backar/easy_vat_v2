import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';

class ItemDetailsCard extends StatelessWidget {
  final bool isExpanded;
  final TextEditingController itemController;
  const ItemDetailsCard({
    super.key,
    required this.isExpanded,
    required this.itemController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isExpanded ? 134.h : 88.h,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: isExpanded
            ? Border.all(color: context.colorScheme.secondary)
            : null,
        color: const Color(0xFFF9F9F9),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.itemName,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "InStock",
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildContents(
                  context,
                  AppStrings.barcode,
                  "123456",
                ),
              ),
              Expanded(
                child: _buildContents(
                  context,
                  AppStrings.itemcode,
                  "1234446",
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: _buildContents(
                    context,
                    AppStrings.cost,
                    "1236.00",
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: _buildContents(
                    context,
                    AppStrings.price,
                    "1240.00",
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: _buildContents(
                    context,
                    AppStrings.unit,
                    "Outer",
                  ),
                ),
              ),
            ],
          ),
          if (isExpanded) ...[
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextInputFormField(
                height: 38.h,
                width: 108.w,
                controller: itemController,
                hint: AppStrings.itemCount,
                maxLines: 1,
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContents(BuildContext context, String label, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
