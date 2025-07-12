import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/dotted_line.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockTransferAmount extends ConsumerStatefulWidget {
  const StockTransferAmount({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StockTransferAmountState();
}

class _StockTransferAmountState extends ConsumerState<StockTransferAmount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stockTransferProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate(AppStrings.totalSellValue),
              style: context.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              state.totalSellValue.toStringAsFixed(2),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
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
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate(AppStrings.totalNetCost),
              style: context.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              state.totalNetCost.toStringAsFixed(2),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            )
          ],
        )
      ],
    );
  }
}
