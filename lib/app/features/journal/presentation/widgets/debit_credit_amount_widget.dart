import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/dotted_line.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal_cart/journal_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebitCreditAmountWidget extends ConsumerStatefulWidget {
  final double? totalAmount;
  final double? debitTotal;
  final double? creditTotal;

  const DebitCreditAmountWidget({
    super.key,
    this.totalAmount,
    this.debitTotal,
    this.creditTotal,
  });

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
    final journalState = ref.watch(journalCartProvider);

    final entryMode = ref.watch(entryModeProvider);
    return Consumer(
      builder: (context, ref, child) {
        return entryMode.when(
            singleEntry: () => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.translate(AppStrings.totalAmount),
                          style: context.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          journalState.totalAmount.toStringAsFixed(2),
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ),
            doubleEntry: () => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.translate(AppStrings.debitTotal),
                          style: context.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          journalState.drAmount.toStringAsFixed(2),
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomPaint(
                      size: Size(double.infinity, 1),
                      painter:
                          DottedLinePainter(color: context.colorScheme.outline),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.translate(AppStrings.creditTotal),
                          style: context.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          journalState.crAmount.toStringAsFixed(2),
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ));
      },
    );
  }

  // Widget _buidAmountSplitup(BuildContext context,
  //     {required String label, bool isDottedDivider = true}) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             label,
  //             style: context.textTheme.bodySmall?.copyWith(
  //                 color: context.colorScheme.outline,
  //                 fontWeight: FontWeight.w500),
  //           )
  //         ],
  //       ),
  //       SizedBox(
  //         height: 5,
  //       ),
  //       if (isDottedDivider)
  //         CustomPaint(
  //           size: Size(double.infinity, 1),
  //           painter: DottedLinePainter(color: context.colorScheme.outline),
  //         )
  //       else
  //         Divider(
  //           height: 0,
  //           thickness: 2,
  //         )
  //     ],
  //   );
  // }
}
