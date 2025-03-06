import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/dotted_line.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateSplitupWidget extends ConsumerStatefulWidget {
  const RateSplitupWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RateSplitupWidgetState();
}

class _RateSplitupWidgetState extends ConsumerState<RateSplitupWidget> {
  final _discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartProvider);
    return Column(
      children: [
        _buildRateSplitup(
          context,
          content: state.totalBeforeTax.toStringAsFixed(2),
          label: AppStrings.totalBeforeTax,
        ),
        SizedBox(
          height: 5,
        ),
        _buildRateSplitup(
          context,
          content: state.totalTax.toStringAsFixed(2),
          label: AppStrings.totalTax,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.discount,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.outline,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 69.w,
              height: 29,
              child: TextInputFormField(
                controller: _discountController,
                hint: "00.00",
                maxLines: 1,
                onChanged: (disc) {
                  final discountAmount = double.tryParse(disc);
                  if ((discountAmount ?? 0.0) > 0) {
                    ref
                        .read(cartProvider.notifier)
                        .applyDiscount(discountAmount!);
                  }
                },
                hintDecoration: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.defaultTextColor.withValues(alpha: 0.32)),
                style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.defaultTextColor),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        CustomPaint(
          size: Size(double.infinity, 1),
          painter: DottedLinePainter(color: context.colorScheme.outline),
        ),
        SizedBox(
          height: 5,
        ),
        _buildRateSplitup(context,
            content: state.roundOf.toStringAsFixed(2),
            label: AppStrings.roundOf,
            isDottedDivider: false),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.totalAmount,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              state.totalAmount.toStringAsFixed(2),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRateSplitup(BuildContext context,
      {required String label,
      required String content,
      bool isDottedDivider = true}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.outline,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              content,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        if (isDottedDivider)
          CustomPaint(
            size: Size(double.infinity, 1),
            painter: DottedLinePainter(color: context.colorScheme.outline),
          )
        else
          Divider(
            height: 0,
            thickness: 2,
          ),
      ],
    );
  }
}
