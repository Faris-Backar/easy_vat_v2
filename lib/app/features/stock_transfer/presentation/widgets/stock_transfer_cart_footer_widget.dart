import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_bottom_model_sheet.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockTransferCartFooterWidget extends ConsumerStatefulWidget {
  const StockTransferCartFooterWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StockTransferCartFooterWidgetState();
}

class _StockTransferCartFooterWidgetState
    extends ConsumerState<StockTransferCartFooterWidget> {
  bool isTaxEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiaryContainer
              : null,
          boxShadow: [
            BoxShadow(
                blurRadius: .5,
                blurStyle: BlurStyle.outer,
                color: context.colorScheme.shadow.withValues(alpha: 0.5))
          ]),
      child: Consumer(
        builder: (context, ref, child) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.translate(AppStrings.total),
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  ref
                      .watch(stockTransferProvider)
                      .totalNetCost
                      .toStringAsFixed(2),
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryButton(
              onPressed: () {
                showStockTransferItemsBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: context.primaryColor,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    context.translate(AppStrings.addItem),
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.onPrimaryColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
