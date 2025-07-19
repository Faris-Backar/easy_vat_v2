import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense_cart/expense_cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/dotted_line.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AmountSplitupWidget extends ConsumerStatefulWidget {
  const AmountSplitupWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AmountSplitupWidgetState();
}

class _AmountSplitupWidgetState extends ConsumerState<AmountSplitupWidget> {
  final _discountController = TextEditingController();
  bool isTaxRegistrationEnabled = false;
  bool _isDiscountInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      isTaxRegistrationEnabled =
          prefs.getBool(PrefResources.isTaxEnabled) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(expenseCartProvider);
    if (!_isDiscountInitialized) {
      _discountController.text = state.discount.toStringAsFixed(2);
      _isDiscountInitialized = true;
    }

    return Column(
      children: [
        if (isTaxRegistrationEnabled)
          _buildAmountSplitup(
            context,
            content: state.grossTotal.toStringAsFixed(2),
            label: context.translate(AppStrings.totalBeforeTax),
          ),
        SizedBox(
          height: 5,
        ),
        if (isTaxRegistrationEnabled)
          _buildAmountSplitup(
            context,
            content: state.taxAmount.toStringAsFixed(2),
            label: context.translate(AppStrings.totalTax),
          ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate(AppStrings.discount),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.outline,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 110.w,
              height: 32.h,
              child: TextInputFormField(
                controller: _discountController,
                hint: "00.00",
                maxLines: 1,
                textAlign: TextAlign.right,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onTap: () {
                  if (_discountController.text == "0.00") {
                    _discountController.clear();
                  }
                },
                onChanged: (disc) {
                  final discountAmount = double.tryParse(disc) ?? 0.0;
                  if (discountAmount >= 0) {
                    ref
                        .read(expenseCartProvider.notifier)
                        .applyDiscount(discountAmount);
                  }
                },
                hintDecoration: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.defaultTextColor.withValues(alpha: 0.32)),
                style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.defaultTextColor),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        CustomPaint(
          size: Size(double.infinity, 1),
          painter: DottedLinePainter(color: context.colorScheme.outline),
        ),
        _buildAmountSplitup(context,
            content: state.roundOf.toStringAsFixed(2),
            label: context.translate(AppStrings.roundOf),
            isDottedDivider: false),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate(AppStrings.totalAmount),
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              state.totalAmount.toStringAsFixed(2),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            )
          ],
        )
      ],
    );
  }

  Widget _buildAmountSplitup(BuildContext context,
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
            )
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
          )
      ],
    );
  }
}
