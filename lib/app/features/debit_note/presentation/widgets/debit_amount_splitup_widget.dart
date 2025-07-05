import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note_cart/debit_note_cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/dotted_line.dart';
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
    final state = ref.watch(debitNoteCartProvider);

    return Column(
      children: [
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
}
