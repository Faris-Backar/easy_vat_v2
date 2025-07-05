import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note_cart/credit_note_cart_provider.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DebitAmountSplitupWidget extends ConsumerStatefulWidget {
  const DebitAmountSplitupWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DebitAmountSplitupWidgetState();
}

class _DebitAmountSplitupWidgetState
    extends ConsumerState<DebitAmountSplitupWidget> {
  bool isTaxRegistrationEnabled = false;
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
    final state = ref.watch(creditNoteCartProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate(AppStrings.discount),
              style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.outline,
                  fontWeight: FontWeight.w500),
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
        // _buildDebitAmountSplitup(context,
        //     content: state.toStringAsFixed(2),
        //     label: context.translate(AppStrings.roundOf),
        //     isDottedDivider: false),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.translate(AppStrings.totalAmount),
              style: context.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
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

  // Widget _buildDebitAmountSplitup(BuildContext context,
  //     {required String label,
  //     required String content,
  //     bool isDottedDivider = true}) {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             label,
  //             style: context.textTheme.bodySmall?.copyWith(
  //                 color: context.colorScheme.outline,
  //                 fontWeight: FontWeight.w500),
  //           ),
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
