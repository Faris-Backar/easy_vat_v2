import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebitCreditAmountWidget extends ConsumerStatefulWidget {
  final ValueNotifier<String?> entryModeNotifier;
  final double? totalAmount;
  final double? debitTotal;
  final double? creditTotal;
  const DebitCreditAmountWidget(
      {super.key,
      required this.entryModeNotifier,
      this.totalAmount,
      this.debitTotal,
      this.creditTotal});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DebitCreditAmountWidgetState();
}

class _DebitCreditAmountWidgetState
    extends ConsumerState<DebitCreditAmountWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
        valueListenable: widget.entryModeNotifier,
        builder: (context, entryMode, __) {
          if (entryMode == null) {
            return const SizedBox();
          }
          final isDoubleEntry = entryMode == "Double Entry";

          return Column(
            children: [
              if (isDoubleEntry) ...[
                _buidAmountSplitup(context,
                    label: context.translate(AppStrings.debitTotal),
                    isDottedDivider: true),
                const SizedBox(
                  height: 5,
                ),
                _buidAmountSplitup(context,
                    label: context.translate(AppStrings.creditTotal),
                    isDottedDivider: false)
              ] else ...[
                _buidAmountSplitup(context,
                    label: context.translate(AppStrings.totalAmount),
                    isDottedDivider: false)
              ]
            ],
          );
        });
  }

  Widget _buidAmountSplitup(BuildContext context,
      {required String label, bool isDottedDivider = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.outline,
                  fontWeight: FontWeight.w500),
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
