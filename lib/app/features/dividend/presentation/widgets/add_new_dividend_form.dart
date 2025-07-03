import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/expense_ledger_info_widget.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense_cart/expense_cart_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewDividendForm extends ConsumerStatefulWidget {
  final TextEditingController dividendNoController;
  final TextEditingController refNoController;
  final TextEditingController issuedByController;
  final TextEditingController notesController;
  final ValueNotifier<String?> paymentModeNotifier;
  final ValueNotifier<String?> cashAccountNotifier;
  const AddNewDividendForm(
      {super.key,
      required this.refNoController,
      required this.issuedByController,
      required this.notesController,
      required this.paymentModeNotifier,
      required this.cashAccountNotifier,
      required this.dividendNoController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewDividendFormState();
}

class _AddNewDividendFormState extends ConsumerState<AddNewDividendForm> {
  final _viewMoreNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paymentModeState = ref.watch(paymentModeNotifierProvider);
    final cashLedgerState = ref.watch(cashLedgerNotifierProvider);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: ExpenseLedgerInfoWidget(),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    child: CustomTextField(
                      label: context.translate(AppStrings.dividendNo),
                      controller: widget.dividendNoController,
                      labelAndTextfieldGap: 2,
                      hint: context.translate(AppStrings.dividendNo),
                      fillColor: context.surfaceColor,
                      enabled: false,
                      height: 38.h,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    label: context.translate(AppStrings.refNo),
                    controller: widget.refNoController,
                    hint: context.translate(AppStrings.enterRefNumber),
                    height: 38.h,
                    labelAndTextfieldGap: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return DatePickerTextField(
                        label: context.translate(AppStrings.date),
                        labelAndTextfieldGap: 2,
                        initialValue: ref
                            .watch(expenseCartProvider)
                            .expenseDate, // need to change
                        onDateSelected: (data) {
                          ref
                              .read(expenseCartProvider.notifier)
                              .setExpenseDate(data);
                        },
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : null,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: paymentModeState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                error: (message) => Text('Error: $message'),
                loaded: (paymentModes, selectedPaymentMode) {
                  if (paymentModes.isNotEmpty &&
                      widget.cashAccountNotifier.value == null) {
                    _getdefaultSelection(paymentModes);
                  }
                  return DropdownField(
                      label: context.translate(AppStrings.paymentMode),
                      valueNotifier: widget.paymentModeNotifier,
                      items: paymentModes
                          .map((mode) => mode.paymentModes)
                          .toList(),
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : context.surfaceColor,
                      onChanged: (newValue) {
                        widget.paymentModeNotifier.value = newValue;
                        final shouldFetchCash =
                            newValue?.toLowerCase() == "cash";
                        final shouldFetchBank =
                            (newValue?.toLowerCase() == "bank" ||
                                newValue?.toLowerCase() == "card" ||
                                newValue?.toLowerCase() == "credit");
                        if (shouldFetchCash) {
                          widget.cashAccountNotifier.value = null;
                          ref
                              .read(cashLedgerNotifierProvider.notifier)
                              .fetchCashLedgers();
                        } else if (shouldFetchBank) {
                          widget.cashAccountNotifier.value = null;
                          ref
                              .read(cashLedgerNotifierProvider.notifier)
                              .fetchBankLedgers();
                        }
                      });
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: CustomTextField(
                label: context.translate(AppStrings.issuedBy),
                controller: widget.issuedByController,
                labelAndTextfieldGap: 2,
                height: 38.h,
                hint: context.translate(AppStrings.issuedBy),
                fillColor: context.surfaceColor,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
            valueListenable: _viewMoreNotifier,
            builder: (BuildContext context, bool isExpanded, Widget? child) {
              return AnimatedContainer(
                duration: Duration(microseconds: 500),
                height: isExpanded ? 80.h : 0.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: cashLedgerState.maybeWhen(
                            loading: () => Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                            loaded: (ledgers) {
                              final currentPaymentMode = widget
                                  .paymentModeNotifier.value
                                  ?.toLowerCase();
                              if (currentPaymentMode == "credit") {
                                return const SizedBox.shrink();
                              }
                              List<String> ledgerNames = [];
                              ledgerNames = ledgers
                                  .map((ledger) => ledger.ledgerName ?? "")
                                  .toList();
                              if (ledgerNames.isNotEmpty &&
                                  widget.cashAccountNotifier.value == null) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  widget.cashAccountNotifier.value =
                                      ledgerNames.first;
                                  ref
                                      .read(expenseCartProvider.notifier)
                                      .setExpenseAccount(
                                          ledgers.first); // need to change
                                });
                              }
                              return DropdownField(
                                  label: (widget.paymentModeNotifier.value
                                              ?.isEmpty ==
                                          true)
                                      ? context
                                          .translate(AppStrings.cashAccount)
                                      : "${widget.paymentModeNotifier.value ?? "Cash"} Account",
                                  valueNotifier: widget.cashAccountNotifier,
                                  items: ledgerNames,
                                  backgroundColor: AppUtils.isDarkMode(context)
                                      ? context.colorScheme.tertiaryContainer
                                      : context.surfaceColor,
                                  onChanged: (newValue) {
                                    widget.cashAccountNotifier.value = newValue;
                                    if (newValue != null) {
                                      final cashLedger = ledgers.firstWhere(
                                          (cashLedger) =>
                                              cashLedger.ledgerName
                                                  ?.toLowerCase() ==
                                              newValue.toLowerCase());
                                      ref
                                          .read(expenseCartProvider.notifier)
                                          .setCashAccount(cashLedger);
                                    }
                                  });
                            },
                            error: (message) => Text(message),
                            orElse: () => SizedBox.shrink(),
                          ),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            }),
        ValueListenableBuilder(
            valueListenable: _viewMoreNotifier,
            builder: (BuildContext context, bool isExpanded, Widget? child) {
              return InkWell(
                onTap: () {
                  _viewMoreNotifier.value = !_viewMoreNotifier.value;
                },
                child: Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : context.colorScheme.secondary
                              .withValues(alpha: 0.2)),
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isExpanded
                            ? context.translate(AppStrings.viewLess)
                            : context.translate(AppStrings.viewMore),
                        style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.secondary),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 16.0,
                        color: context.colorScheme.secondary,
                      )
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }

  // need to Change
  void _getdefaultSelection(List<PaymentModeModel> paymentModes) {
    final currentPaymentMode =
        ref.read(expenseCartProvider.notifier).paymentMode.toLowerCase();
    final selectedMode = paymentModes.firstWhere(
      (mode) => currentPaymentMode.isNotEmpty
          ? mode.paymentModes.toLowerCase() == currentPaymentMode
          : mode.paymentModes.toLowerCase() == "cash",
      orElse: () => paymentModes.first,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedValue = selectedMode.paymentModes;
      ref.read(expenseCartProvider.notifier).setPaymentMode(selectedValue);
      widget.paymentModeNotifier.value = selectedValue;

      final selectedLower = selectedValue.toLowerCase();
      if (selectedLower == "cash") {
        widget.cashAccountNotifier.value = null;
        ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
      } else {
        widget.cashAccountNotifier.value = null;
        ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
      }
    });
  }
}
