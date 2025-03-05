import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSalesFooterWidget extends StatefulWidget {
  final TextEditingController saleNoController;
  final TextEditingController refNoController;
  final ValueNotifier<String?> salesModeNotifier;
  final ValueNotifier<String?> soldByNotifier;
  const AddSalesFooterWidget(
      {super.key,
      required this.saleNoController,
      required this.refNoController,
      required this.salesModeNotifier,
      required this.soldByNotifier});

  @override
  State<AddSalesFooterWidget> createState() => _AddSalesFooterWidgetState();
}

class _AddSalesFooterWidgetState extends State<AddSalesFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final isCartNotEmpty =
          (ref.watch(cartProvider).itemList?.length ?? 0) > 0;
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isCartNotEmpty ? 107.h : 67.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiaryContainer
              : context.surfaceColor,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.5),
              blurRadius: 1,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildButtonsRow(context),
            if (isCartNotEmpty) ...[
              SizedBox(
                height: 6,
              ),
              SizedBox(
                width: double.infinity,
                height: 40.h,
                child: PrimaryButton(
                  label: AppStrings.save,
                  onPressed: () {
                    ref
                        .read(cartProvider.notifier)
                        .setSalesNo(widget.saleNoController.text);
                    ref
                        .read(cartProvider.notifier)
                        .setSalesMode(widget.salesModeNotifier.value ?? "");
                    ref
                        .read(cartProvider.notifier)
                        .setRefNo(widget.refNoController.text);
                    ref
                        .read(cartProvider.notifier)
                        .setSoldBy(widget.soldByNotifier.value ?? "");
                    // ref
                    //     .read(cartProvider.notifier)
                    //     .setCashAccount(widget.salesModeNotifier.value ?? "");
                  },
                ),
              )
            ],
          ],
        ),
      );
    });
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _buildActionButton(
          context,
          Icons.add_circle_outline_rounded,
          AppStrings.addItem,
          () {},
        )),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildActionButton(
              context, Assets.icons.barcode, AppStrings.scanBarCode, () {},
              isSvg: true),
        ),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context, dynamic icon, String label, VoidCallback onPressed,
      {bool isSvg = false}) {
    return SecondaryButton(
      onPressed: onPressed,
      label: "",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSvg
              ? SvgIcon(
                  icon: icon,
                  color: (AppUtils.isDarkMode(context)
                      ? context.defaultTextColor
                      : context.colorScheme.primary))
              : Icon(
                  icon,
                  size: 18,
                  color: (AppUtils.isDarkMode(context)
                      ? context.defaultTextColor
                      : context.colorScheme.primary),
                ),
          SizedBox(width: 6.w),
          _styledText(context, label, isPrimary: true, isBold: true),
        ],
      ),
    );
  }

  Widget _styledText(BuildContext context, String text,
      {bool isBold = false, bool isOutline = false, bool isPrimary = false}) {
    return Text(
      text,
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
        color: isOutline
            ? context.colorScheme.outline
            : (isPrimary
                ? (AppUtils.isDarkMode(context)
                    ? context.defaultTextColor
                    : context.colorScheme.primary)
                : null),
      ),
    );
  }
}
