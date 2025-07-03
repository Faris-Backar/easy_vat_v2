import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra_cart/contra_cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/dotted_line.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContraAmountSplitupWidget extends ConsumerStatefulWidget {
  final double? totalAmount;
  final double? debitTotal;
  final double? creditTotal;

  const ContraAmountSplitupWidget(
      {super.key, this.totalAmount, this.creditTotal, this.debitTotal});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContraAmountWidgetState();
}

class _ContraAmountWidgetState
    extends ConsumerState<ContraAmountSplitupWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contraState = ref.watch(contraCartProvider);

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
                          contraState.totalAmount.toStringAsFixed(2),
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
                          contraState.drAmount.toStringAsFixed(2),
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
                          contraState.crAmount.toStringAsFixed(2),
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
}
