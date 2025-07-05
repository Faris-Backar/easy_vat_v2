import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/dividend/domain/entity/dividend_cart_entity.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend_cart/dividend_cart_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividendAddDialog extends ConsumerStatefulWidget {
  final LedgerAccountEntity ledger;
  final DividendCartEntity? ledgerEntry;
  const DividendAddDialog({super.key, required this.ledger, this.ledgerEntry});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DividendAddDialogState();
}

class _DividendAddDialogState extends ConsumerState<DividendAddDialog> {
  DividendCartEntity? cart;
  late LedgerAccountEntity ledger;
  final _descriptionController = TextEditingController();
  final _totalAmountController = TextEditingController();

  final _decimalInputFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));

  @override
  void initState() {
    super.initState();
    cart = widget.ledgerEntry;
    ledger = widget.ledger;

    final double totalAmount = cart?.netTotal ?? 0.0;
    final String description = cart?.description ?? "";

    _descriptionController.text = description;
    _totalAmountController.text = totalAmount.toStringAsFixed(2);
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    label: context.translate(AppStrings.description),
                    maxLines: 5,
                    fillColor: context.colorScheme.tertiaryContainer,
                    controller: _descriptionController,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    context.translate(AppStrings.totalAmount),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                Expanded(
                  child: TextInputFormField(
                    height: 36.h,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [_decimalInputFormatter],
                    onTap: () => _totalAmountController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset:
                                _totalAmountController.value.text.length),
                    maxLines: 1,
                    controller: _totalAmountController,
                    fillColor: context.colorScheme.tertiaryContainer,
                  ),
                )
              ],
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
          onPressed: _handleDividendCartAction,
        )
      ],
    );
  }

  void _handleDividendCartAction() {
    final dividendCartNotifier = ref.read(dividendCartProvider.notifier);
    final totalAmount = double.tryParse(_totalAmountController.text) ?? 0.0;

    final dividendCartEntity = DividendCartEntity(
        ledgerId: widget.ledgerEntry != null
            ? widget.ledgerEntry!.ledgerId
            : (ref.read(dividendCartProvider).ledgerList?.length ?? 0),
        ledger: ledger,
        currentBalance: ledger.currentBalance ?? 0.0,
        netTotal: totalAmount,
        currentBalanceType: ledger.currentBalanceType ?? "",
        description: _descriptionController.text);

    if (widget.ledgerEntry == null) {
      dividendCartNotifier.addLedgerIntoDividendCart(
          ledger: dividendCartEntity);
    } else {
      dividendCartNotifier.updateDividendCartLedger(
          cartLedger: dividendCartEntity);
    }
    context.router.popForced();
  }
}
