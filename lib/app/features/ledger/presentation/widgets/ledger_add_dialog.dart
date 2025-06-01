import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LedgerAddDialog extends ConsumerStatefulWidget {
  final LedgerAccountEntity ledger;
  const LedgerAddDialog({super.key, required this.ledger});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LedgerAddDialogState();
}

class _LedgerAddDialogState extends ConsumerState<LedgerAddDialog> {
  late LedgerAccountEntity ledget;
  final _grossTotalController = TextEditingController();
  final _taxPercentController = TextEditingController();
  final _taxAmountController = TextEditingController();
  final _netTotalController = TextEditingController();
  double taxAmount = 0.0;
  double netTotal = 0.0;
  bool isTaxEnabled = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.tertiaryContainer,
      title: Text(widget.ledger.ledgerName ?? ""),
      titleTextStyle: context.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextInputFormField(
                      height: 36.h,
                      label: context.translate(AppStrings.grossTotal),
                      fillColor: context.colorScheme.tertiaryContainer,
                      controller: _grossTotalController),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                    child: TextInputFormField(
                  height: 36.h,
                  label: context.translate(AppStrings.taxPercentage),
                  fillColor: context.colorScheme.tertiaryContainer,
                  textInputAction: TextInputAction.next,
                  controller: _taxPercentController,
                  textInputType:
                      const TextInputType.numberWithOptions(decimal: true),
                )),
                SizedBox(
                  width: 5.w,
                ),
                // Expanded(
                //     child: TextInputFormField(
                //         height: 36.h,
                //         label: context.translate(AppStrings.taxAmount),
                //         fillColor: context.colorScheme.tertiaryContainer,
                //         enabled: false,
                //         controller: _taxAmountController)),
                // SizedBox(
                //   width: 5.w,
                // ),
                // Expanded(
                //     child: TextInputFormField(
                //         height: 36.h,
                //         label: context.translate(AppStrings.netTotal),
                //         fillColor: context.colorScheme.tertiaryContainer,
                //         enabled: false,
                //         controller: _netTotalController))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: TextInputFormField(
                        height: 36.h,
                        label: context.translate(AppStrings.taxAmount),
                        fillColor: context.colorScheme.tertiaryContainer,
                        enabled: false,
                        controller: _taxAmountController)),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                    child: TextInputFormField(
                        height: 36.h,
                        label: context.translate(AppStrings.netTotal),
                        fillColor: context.colorScheme.tertiaryContainer,
                        enabled: false,
                        controller: _netTotalController))
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      contentTextStyle:
          context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      actions: [
        SecondaryButton(
          onPressed: () => context.router.popForced(),
          label: context.translate(AppStrings.cancel),
          labelColor: context.defaultTextColor,
          backgroundColor: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiary
              : null,
          border: BorderSide(
              color: context.colorScheme.primary.withValues(alpha: 0.2)),
        ),
        SizedBox(
          width: 5.w,
        ),
        PrimaryButton(
          label: context.translate(AppStrings.addToCart),
          onPressed: () {},
        )
      ],
    );
  }
}
