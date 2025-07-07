import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/items_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddStockTransferWidgert extends StatefulWidget {
  final TextEditingController stockTransferNoController;
  final TextEditingController refNoController;
  final ValueNotifier<String?> fromStoreNotifier;
  final ValueNotifier<String?> toStoreNotifier;
  const AddStockTransferWidgert(
      {super.key,
      required this.stockTransferNoController,
      required this.refNoController,
      required this.fromStoreNotifier,
      required this.toStoreNotifier});

  @override
  State<AddStockTransferWidgert> createState() =>
      _AddStockTransferWidgertState();
}

class _AddStockTransferWidgertState extends State<AddStockTransferWidgert> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 67.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
          decoration: BoxDecoration(
              color: AppUtils.isDarkMode(context)
                  ? context.colorScheme.tertiaryContainer
                  : context.surfaceColor,
              boxShadow: [
                BoxShadow(
                    color: context.colorScheme.shadow.withValues(alpha: 0.5),
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            children: [
              _buildButtonsRow(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Consumer(
            builder: (context, WidgetRef ref, child) {
              return _buildActionButton(
                context,
                Icons.add_circle_outline_rounded,
                context.translate(AppStrings.addItem),
                () {
                  showItemsBottomSheet(context);
                },
              );
            },
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildActionButton(
              context,
              Assets.icons.barcode,
              context.translate(AppStrings.scanBarCode),
              () => context.router.pushNamed(AppRouter.barcodeScanner),
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
