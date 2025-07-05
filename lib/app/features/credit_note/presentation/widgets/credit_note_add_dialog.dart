import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/entity/credit_note_cart_entity.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note_cart/credit_note_cart_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditNoteAddDialog extends ConsumerStatefulWidget {
  final LedgerAccountEntity ledger;
  final CreditNoteCartEntity? ledgerEntry;
  const CreditNoteAddDialog(
      {super.key, required this.ledger, this.ledgerEntry});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreditNoteAddDialogState();
}

class _CreditNoteAddDialogState extends ConsumerState<CreditNoteAddDialog> {
  CreditNoteCartEntity? cart;
  late LedgerAccountEntity ledger;
  final _drAmountTotalController = TextEditingController();
  final _taxPercentController = TextEditingController();
  final _taxAmountController = TextEditingController();
  final _descriptionController = TextEditingController();
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

    taxPercentage = cart?.taxPercentage ?? 0.0;

    final double drAmount = cart?.drAmount ?? 0.0;
    final double taxAmount = drAmount * taxPercentage / 100;
    final double netTotal = drAmount + taxAmount;

    _descriptionController.text = ledger.description ?? "";
    _drAmountTotalController.text = drAmount.toStringAsFixed(2);
    _taxPercentController.text = taxPercentage.toStringAsFixed(2);
    _taxAmountController.text = taxAmount.toStringAsFixed(2);
    _netTotalController.text = netTotal.toStringAsFixed(2);
  }

  void _updateFromDrAmountChange() {
    final drAmount = double.tryParse(_drAmountTotalController.text) ?? 0.0;
    final taxPercentage = double.tryParse(_taxPercentController.text) ?? 0.0;

    final bool isTaxEnabled = taxPercentage != 0;
    final taxAmount = isTaxEnabled ? drAmount * taxPercentage / 100 : 0.0;
    final netTotal = drAmount + taxAmount;

    _taxAmountController.text = taxAmount.toStringAsFixed(2);
    _netTotalController.text = netTotal.toStringAsFixed(2);
  }

  void _updateFromNetTotalChange() {
    final netTotal = double.tryParse(_netTotalController.text) ?? 0.0;
    final taxPercentage = double.tryParse(_taxPercentController.text) ?? 0.0;

    final bool isTaxEnabled = taxPercentage != 0;

    final double drAmount =
        isTaxEnabled ? netTotal / (1 + taxPercentage / 100) : netTotal;

    final double taxAmount = netTotal - drAmount;

    _drAmountTotalController.text = drAmount.toStringAsFixed(2);
    _taxAmountController.text = taxAmount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.tertiaryContainer,
      title: Text(widget.ledger.ledgerName ?? ""),
      titleTextStyle: context.textTheme.titleSmall
          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: TextInputFormField(
                        height: 36.h,
                        label: context.translate(AppStrings.drAmount),
                        fillColor: context.colorScheme.tertiaryContainer,
                        onChanged: (value) => _updateFromDrAmountChange(),
                        textInputAction: TextInputAction.next,
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [_decimalInputFormatter],
                        maxLines: 1,
                        onTap: () => _drAmountTotalController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset:
                                    _drAmountTotalController.value.text.length),
                        controller: _drAmountTotalController)),
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
                    onTap: () => _taxPercentController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset:
                                _taxPercentController.value.text.length),
                    onChanged: (value) => _updateFromDrAmountChange(),
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                )
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
                    maxLines: 1,
                    fillColor: context.colorScheme.tertiaryContainer,
                    enabled: false,
                    controller: _taxAmountController,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    label: context.translate(AppStrings.netTotal),
                    fillColor: context.colorScheme.tertiaryContainer,
                    enabled: true,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLines: 1,
                    inputFormatters: [_decimalInputFormatter],
                    onTap: () => _netTotalController.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: _netTotalController.value.text.length,
                    ),
                    controller: _netTotalController,
                    onChanged: (value) => _updateFromNetTotalChange(),
                  ),
                )
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
        PrimaryButton(
          label: widget.ledgerEntry != null
              ? context.translate(AppStrings.updateLedger)
              : context.translate(AppStrings.addLedger),
          onPressed: _handleCreditNoteCartAction,
          // creditNote cart acion
        )
      ],
    );
  }

  void _handleCreditNoteCartAction() {
    final creditNoteCartNotifier = ref.read(creditNoteCartProvider.notifier);
    final drAmount = double.tryParse(_drAmountTotalController.text) ?? 0.0;
    final taxPercentage = double.tryParse(_taxPercentController.text) ?? 0.0;
    final taxAmount = creditNoteCartNotifier.calculateTotalTax(
        drAmount: drAmount, taxPercentage: taxPercentage);
    final netTotal = drAmount + taxAmount;

    final creditNoteCartEntity = CreditNoteCartEntity(
        ledgerId: widget.ledgerEntry != null
            ? widget.ledgerEntry!.ledgerId
            : (ref.read(creditNoteCartProvider).ledgerList?.length ?? 0) + 1,
        ledgerBalance: ledger.currentBalance ?? 0.0,
        ledger: ledger,
        netTotal: netTotal,
        drAmount: drAmount,
        taxAmount: taxAmount,
        taxPercentage: taxPercentage,
        description: _descriptionController.text,
        tax: taxAmount);

    if (widget.ledgerEntry == null) {
      creditNoteCartNotifier.addLedgerIntoCreditNoteCart(
          ledger: creditNoteCartEntity);
    } else {
      creditNoteCartNotifier.updateCreditNoteCartLedger(
          cartLedger: creditNoteCartEntity);
    }
    context.router.popForced();
  }
}
