import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/supplier_info_widget.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewExpenseForm extends ConsumerStatefulWidget {
  final TextEditingController expenseNoController;
  final TextEditingController refNoController;
  final TextEditingController purchasedByController;
  final TextEditingController supplierInvNoController;
  final ValueNotifier<String?> paymentModeNotifier;
  final ValueNotifier<String?> cashAccountNotifier;
  const AddNewExpenseForm(
      {super.key,
      required this.expenseNoController,
      required this.refNoController,
      required this.purchasedByController,
      required this.paymentModeNotifier,
      required this.cashAccountNotifier,
      required this.supplierInvNoController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewExpenseFormState();
}

class _AddNewExpenseFormState extends ConsumerState<AddNewExpenseForm> {
  final _viewMoreNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paymentModeState = ref.watch(paymentModeNotifierProvider);
    final cashLedgerState = ref.watch(cashLedgerNotifierProvider);
    widget.expenseNoController.text = ref.watch(cartProvider).expenseNo ?? "";
    widget.refNoController.text = ref.watch(cartProvider).refNo ?? "";
    widget.purchasedByController.text =
        ref.watch(cartProvider).purchasedBy ?? "";
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 4, child: SupplierInfoWidget()), // supplier info widget
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    child: CustomTextField(
                      label: context.translate(
                        AppStrings.expNo,
                      ),
                      controller: widget.expenseNoController,
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                      hint: context.translate(AppStrings.expNo),
                      fillColor: context.surfaceColor,
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    label: context.translate(AppStrings.refNo),
                    controller: widget.refNoController,
                    hint: context.translate(AppStrings.enterRefNumber),
                    labelAndTextfieldGap: 2,
                    height: 38.h,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return DatePickerTextField(
                        label: context.translate(AppStrings.date),
                        initialValue: ref.watch(cartProvider).expenseDate,
                        onDateSelected: (data) {
                          ref.read(cartProvider.notifier).setExpenseDate(data);
                        },
                        labelAndTextfieldGap: 2,
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : null,
                      );
                    },
                  )
                ],
              ),
            ),
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
                      widget.paymentModeNotifier.value == null) {
                    _getdefaultSelection(paymentModes);
                  }
                  return DropdownField(
                      // dropdownfield
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
                                newValue?.toLowerCase() == "card");

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
                label: context.translate(AppStrings.supInvNo),
                controller: widget.purchasedByController,
                labelAndTextfieldGap: 2,
                height: 38.h,
                hint: context.translate(AppStrings.supInvNo),
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
                                        .read(cartProvider.notifier)
                                        .setSalesAccount(ledgers.first);
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
                                    backgroundColor:
                                        AppUtils.isDarkMode(context)
                                            ? context
                                                .colorScheme.tertiaryContainer
                                            : context.surfaceColor,
                                    onChanged: (newValue) {
                                      widget.cashAccountNotifier.value =
                                          newValue;
                                      if (newValue != null) {
                                        final cashLedger = ledgers.firstWhere(
                                            (cashLedger) =>
                                                cashLedger.ledgerName
                                                    ?.toLowerCase() ==
                                                newValue.toLowerCase());
                                        ref
                                            .read(cartProvider.notifier)
                                            .setCashAccount(cashLedger);
                                      }
                                    });
                              },
                              error: (message) => Text(message),
                              orElse: () => SizedBox.shrink())),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: CustomTextField(
                          label: context.translate(AppStrings.purchasedBy),
                          controller: widget.purchasedByController,
                          labelAndTextfieldGap: 2,
                          height: 38.h,
                          hint: context.translate(AppStrings.purchasedBy),
                          fillColor: context.surfaceColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
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
                        : context.colorScheme.secondary.withValues(alpha: 0.2),
                  ),
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

  void _getdefaultSelection(List<PaymentModeModel> paymentModes) {
    final currentPaymentMode =
        ref.read(cartProvider.notifier).paymentMode.toLowerCase();
    final selectedMode = paymentModes.firstWhere(
      (mode) => currentPaymentMode.isNotEmpty
          ? mode.paymentModes.toLowerCase() == currentPaymentMode
          : mode.paymentModes.toLowerCase() == "cash",
      orElse: () => paymentModes.first,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedValue = selectedMode.paymentModes;
      ref.read(cartProvider.notifier).setPaymentMode(selectedValue);
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
