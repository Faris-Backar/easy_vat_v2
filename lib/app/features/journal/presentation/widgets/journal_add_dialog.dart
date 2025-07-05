import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/journal/domain/entity/journal_cart_entity.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/entry_mode/entry_mode_state.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal_cart/journal_cart_provider.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_notifier.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/ledger_mode/ledger_mode_state.dart';
import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';

import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JournalAddDialog extends ConsumerStatefulWidget {
  final LedgerAccountEntity ledger;

  final JournalCartEntity? ledgerEntry;
  const JournalAddDialog({
    super.key,
    required this.ledger,
    this.ledgerEntry,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JournalAddDialogState();
}

class _JournalAddDialogState extends ConsumerState<JournalAddDialog> {
  JournalCartEntity? cart;
  late LedgerAccountEntity ledger;
  final _descriptionController = TextEditingController();
  final _drAmountController = TextEditingController();
  final _crAmountController = TextEditingController();
  final _totalAmountController = TextEditingController();

  final _decimalInputFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));

  @override
  void initState() {
    super.initState();
    cart = widget.ledgerEntry;
    ledger = widget.ledger;

    final double drAmount = cart?.drAmount ?? 0.0;
    final double crAmount = cart?.crAmount ?? 0.0;
    final double totalAmount = cart?.netTotal ?? 0.0;

    _descriptionController.text = ledger.description ?? "";
    _crAmountController.text = crAmount.toStringAsFixed(2);
    _drAmountController.text = drAmount.toStringAsFixed(2);
    _totalAmountController.text = totalAmount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final ledgerMode =
        ref.watch(ledgerModeProvider(widget.ledger.ledgerCode ?? ""));
    final entryMode = ref.watch(entryModeProvider);
    return AlertDialog(
      backgroundColor: context.colorScheme.tertiaryContainer,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(widget.ledger.ledgerName ?? "")),
          SizedBox(
            width: 10.w,
          ),
          Consumer(
            builder: (context, ref, child) {
              return entryMode.when(
                singleEntry: () => const SizedBox.shrink(),
                doubleEntry: () => SizedBox(
                  width: 140.w,
                  child: DropdownButton<LedgerModeState>(
                    value: ledgerMode,
                    onChanged: (LedgerModeState? newValue) {
                      if (newValue != null) {
                        if (newValue == LedgerModeState.debitLedger()) {
                          _crAmountController.text = "0.0";
                          _drAmountController.text = "0.0";
                        } else if (newValue == LedgerModeState.creditLedger()) {
                          _crAmountController.text = "0.0";
                          _drAmountController.text = "0.0";
                        }
                        ref
                            .read(ledgerModeProvider(widget.ledger.ledgerCode!)
                                .notifier)
                            .setLedgerMode(newValue);
                      }
                    },
                    items: [
                      DropdownMenuItem(
                        value: LedgerModeState.debitLedger(),
                        child: Text("Debit Ledger"),
                      ),
                      DropdownMenuItem(
                        value: LedgerModeState.creditLedger(),
                        child: Text("Credit Ledger"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
                Consumer(
                  builder: (context, ref, child) {
                    return entryMode.when(
                        singleEntry: () => Expanded(
                              child: Row(
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
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: [_decimalInputFormatter],
                                      onTap: () =>
                                          _totalAmountController.selection =
                                              TextSelection(
                                                  baseOffset: 0,
                                                  extentOffset:
                                                      _totalAmountController
                                                          .value.text.length),
                                      maxLines: 1,
                                      controller: _totalAmountController,
                                      fillColor:
                                          context.colorScheme.tertiaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        doubleEntry: () =>
                            Consumer(builder: (context, ref, child) {
                              return ledgerMode.when(
                                  debitLedger: () => Expanded(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 100.w,
                                              child: Text(
                                                context.translate(
                                                    AppStrings.drAmount),
                                                style: context
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                            Expanded(
                                              child: TextInputFormField(
                                                height: 36.h,
                                                textInputType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                inputFormatters: [
                                                  _decimalInputFormatter
                                                ],
                                                onTap: () => _drAmountController
                                                        .selection =
                                                    TextSelection(
                                                        baseOffset: 0,
                                                        extentOffset:
                                                            _drAmountController
                                                                .value
                                                                .text
                                                                .length),
                                                maxLines: 1,
                                                controller: _drAmountController,
                                                fillColor: context.colorScheme
                                                    .tertiaryContainer,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  creditLedger: () => Expanded(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 100.w,
                                              child: Text(
                                                context.translate(
                                                    AppStrings.crAmount),
                                                style: context
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                            Expanded(
                                              child: TextInputFormField(
                                                height: 36.h,
                                                textInputType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                inputFormatters: [
                                                  _decimalInputFormatter
                                                ],
                                                onTap: () => _crAmountController
                                                        .selection =
                                                    TextSelection(
                                                        baseOffset: 0,
                                                        extentOffset:
                                                            _crAmountController
                                                                .value
                                                                .text
                                                                .length),
                                                maxLines: 1,
                                                controller: _crAmountController,
                                                fillColor: context.colorScheme
                                                    .tertiaryContainer,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                            }));
                  },
                )
              ],
            ),
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
          onPressed: _handleJournalCartAction,
        )
      ],
    );
  }

  void _handleJournalCartAction() {
    final journalCartNotifier = ref.read(journalCartProvider.notifier);
    final ledgerMode = ref.read(ledgerModeProvider(widget.ledger.ledgerCode!));
    double drAmount = 0.0;
    double crAmount = 0.0;
    double totalAmount = 0.0;

    if (ref.read(entryModeProvider) == EntryModeState.singleEntry()) {
      totalAmount = double.tryParse(_totalAmountController.text) ?? 0.0;
    } else {
      if (ledgerMode == LedgerModeState.debitLedger()) {
        drAmount = double.tryParse(_drAmountController.text) ?? 0.0;
        crAmount = 0.0;
      } else if (ledgerMode == LedgerModeState.creditLedger()) {
        crAmount = double.tryParse(_crAmountController.text) ?? 0.0;
        drAmount = 0.0;
      }
    }

    final journalCartEntity = JournalCartEntity(
        ledgerId: widget.ledgerEntry != null
            ? widget.ledgerEntry!.ledgerId
            : (ref.read(journalCartProvider).ledgerList?.length ?? 0),
        ledger: ledger,
        currentBalance: ledger.currentBalance ?? 0.0,
        netTotal: totalAmount,
        drAmount: drAmount,
        crAmount: crAmount,
        ledgerMode: ledgerMode,
        description: _descriptionController.text);

    if (widget.ledgerEntry == null) {
      journalCartNotifier.addLedgerIntoJournalCart(ledger: journalCartEntity);
    } else {
      journalCartNotifier.updateJournalCartLedger(
          cartLedger: journalCartEntity);
    }
    context.router.popForced();
  }
}
