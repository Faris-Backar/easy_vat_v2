import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/domain/entities/cart_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LedgerAddDialog extends ConsumerStatefulWidget {
  final LedgerAccountEntity ledger;
  final CartEntity? ledgerEntry;
  const LedgerAddDialog({super.key, required this.ledger, this.ledgerEntry});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LedgerAddDialogState();
}

class _LedgerAddDialogState extends ConsumerState<LedgerAddDialog> {
  CartEntity? cart;
  late LedgerAccountEntity ledger;
  final _grossTotalController = TextEditingController();
  final _taxPercentController = TextEditingController();
  final _taxAmountController = TextEditingController();
  final _netTotalController = TextEditingController();
  double taxPercentage = 0.0;
  bool isTaxEnabled = false;

  final _decimalInputFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));

  @override
  void initState() {
    super.initState();
    cart = widget.ledgerEntry;
    ledger = widget.ledger;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      isTaxEnabled = prefs.getBool(PrefResources.isTaxEnabled) ?? false;
      taxPercentage = isTaxEnabled ? 0.0 : ledger.taxPercentage ?? 0.0;
    });

    taxPercentage = ledger.taxPercentage ?? 0.0;

    final double grossTotal = 0.0;
    final double taxAmount = grossTotal * taxPercentage / 100;
    final double netTotal = grossTotal + taxAmount;

    _grossTotalController.text = grossTotal.toStringAsFixed(2);
    _taxPercentController.text = taxPercentage.toStringAsFixed(2);
    _taxAmountController.text = taxAmount.toStringAsFixed(2);
    _netTotalController.text = netTotal.toStringAsFixed(2);
  }

  void _updateFromGrossTotalChange() {
    final grossTotal = double.tryParse(_grossTotalController.text) ?? 0.0;
    final taxPercentage = double.tryParse(_taxPercentController.text) ?? 0.0;
    final taxAmount = grossTotal * taxPercentage / 100;
    final netTotal = grossTotal + taxAmount;

    _taxAmountController.text = taxAmount.toStringAsFixed(2);
    _netTotalController.text = netTotal.toStringAsFixed(2);
  }

  // void _updateTaxAmount() {
  //   final grossTotal = double.parse(_grossTotalController.text);
  //   final amountWithTax = grossTotal + (grossTotal * taxPercentage / 100);
  //   _taxAmountController.text = amountWithTax.toStringAsFixed(2);
  //   _updateFromGrossTotalChange();
  // }

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
                      onChanged: (value) => _updateFromGrossTotalChange(),
                      textInputAction: TextInputAction.next,
                      textInputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [_decimalInputFormatter],
                      maxLines: 1,
                      onTap: () => _grossTotalController.selection =
                          TextSelection(
                              baseOffset: 0,
                              extentOffset:
                                  _grossTotalController.value.text.length),
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
                  maxLines: 1,
                  onTap: () => _taxPercentController.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: _taxPercentController.value.text.length),
                  onChanged: (value) => _updateFromGrossTotalChange(),
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
                  controller: _taxAmountController,
                )),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                    child: TextInputFormField(
                  height: 36.h,
                  label: context.translate(AppStrings.netTotal),
                  fillColor: context.colorScheme.tertiaryContainer,
                  enabled: false,
                  controller: _netTotalController,
                  onChanged: (value) => _updateFromGrossTotalChange(),
                ))
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
