import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/customer_info_widget.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewSalesForm extends ConsumerStatefulWidget {
  final TextEditingController saleNoController;
  final TextEditingController refNoController;
  final ValueNotifier<String?> salesModeNotifier;
  final ValueNotifier<String?> soldByNotifier;
  final ValueNotifier<String?> cashAccountNotifier;
  final ValueNotifier<String?> salesAccountNotifier;
  final TextEditingController? purchaseNoController;
  const AddNewSalesForm(
      {super.key,
      required this.saleNoController,
      required this.refNoController,
      required this.salesModeNotifier,
      required this.soldByNotifier,
      required this.cashAccountNotifier,
      required this.salesAccountNotifier,
      this.purchaseNoController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewSalesFormState();
}

class _AddNewSalesFormState extends ConsumerState<AddNewSalesForm> {
  final _viewMoreNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final salesManState = ref.watch(salesManProvider);
    final paymentModeState = ref.watch(paymentModeNotifierProvider);
    final cashLedgerState = ref.watch(cashLedgerNotifierProvider);
    final salesLedgerState = ref.watch(salesLedgerNotifierProvider);
    widget.saleNoController.text = ref.watch(cartProvider).salesNo ?? "";
    widget.refNoController.text = ref.watch(cartProvider).refNo ?? "";

    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 4, child: CustomerInfoWidget()),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    child: CustomTextField(
                      label: widget.purchaseNoController == null
                          ? context.translate(AppStrings.salesNo)
                          : context.translate(AppStrings.purchaseNo),
                      controller: widget.saleNoController,
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                      hint: context.translate(AppStrings.salesNo),
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
                  Consumer(builder: (context, WidgetRef ref, child) {
                    return DatePickerTextField(
                      label: context.translate(AppStrings.date),
                      initialValue: ref.watch(cartProvider).saleDate,
                      onDateSelected: (data) {
                        ref.read(cartProvider.notifier).setSalesDate(data);
                      },
                      labelAndTextfieldGap: 2,
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : null,
                    );
                  }),
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
                loading: () =>
                    Center(child: CircularProgressIndicator.adaptive()),
                error: (message) => Text('Error: $message'),
                loaded: (paymentModes, selectedPaymentMode) {
                  if (paymentModes.isNotEmpty &&
                      widget.salesModeNotifier.value == null) {
                    _getDefaultSelection(paymentModes);
                  }

                  return DropdownField(
                    label: widget.purchaseNoController != null
                        ? context.translate(AppStrings.purchaseMode)
                        : context.translate(AppStrings.salesMode),
                    valueNotifier: widget.salesModeNotifier,
                    items:
                        paymentModes.map((mode) => mode.paymentModes).toList(),
                    backgroundColor: AppUtils.isDarkMode(context)
                        ? context.colorScheme.tertiaryContainer
                        : context.surfaceColor,
                    onChanged: (newValue) {
                      widget.salesModeNotifier.value = newValue;
                      final shouldFetchCash = newValue?.toLowerCase() == "cash";

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
                    },
                  );
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: salesManState.maybeWhen(
                loaded: (employeeList) {
                  final List<String> employeeNames = employeeList
                      .map((employee) => employee.empName ?? "")
                      .where((name) => name.isNotEmpty)
                      .toList();

                  final providerSoldBy = ref.read(cartProvider).soldBy;

                  if (employeeNames.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      final fallbackSoldBy = employeeNames.first;
                      final validProviderValue =
                          providerSoldBy?.empName?.toLowerCase().trim();
                      final matchedEmployee = employeeNames.firstWhere(
                        (name) =>
                            name.toLowerCase().trim() == validProviderValue,
                        orElse: () => fallbackSoldBy,
                      );
                      if (widget.soldByNotifier.value != matchedEmployee) {
                        widget.soldByNotifier.value = matchedEmployee;

                        final selectedEmployee = employeeList.firstWhere(
                          (emp) =>
                              emp.empName?.toLowerCase().trim() ==
                              matchedEmployee.toLowerCase(),
                        );

                        ref
                            .read(cartProvider.notifier)
                            .setSoldBy(selectedEmployee);
                      }
                    });
                  }

                  return DropdownField(
                    height: 38.h,
                    labelAndTextFieldGap: 2,
                    label: widget.purchaseNoController != null
                        ? context.translate(AppStrings.purchasedBy)
                        : context.translate(AppStrings.soldBy),
                    valueNotifier: widget.soldByNotifier,
                    onChanged: (newValue) {
                      widget.soldByNotifier.value = newValue;

                      if (newValue != null) {
                        final selectedEmployee = employeeList.firstWhere(
                          (employee) =>
                              employee.empName?.trim().toLowerCase() ==
                              newValue.toLowerCase(),
                        );

                        ref
                            .read(cartProvider.notifier)
                            .setSoldBy(selectedEmployee);
                      }
                    },
                    items: employeeNames,
                    backgroundColor: AppUtils.isDarkMode(context)
                        ? context.colorScheme.tertiaryContainer
                        : context.surfaceColor,
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                error: (message) => Text(message),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
          valueListenable: _viewMoreNotifier,
          builder: (BuildContext context, bool isExpanded, Widget? child) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: isExpanded ? 80.h : 0.0,
              child: Column(
                children: [
                  Row(
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
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                widget.cashAccountNotifier.value =
                                    ledgerNames.first;
                                ref
                                    .read(cartProvider.notifier)
                                    .setSalesAccount(ledgers.first);
                              });
                            }
                            return DropdownField(
                                height: 38.h,
                                labelAndTextFieldGap: 2,
                                label: (widget
                                            .salesModeNotifier.value?.isEmpty ==
                                        true)
                                    ? context.translate(AppStrings.cashAccount)
                                    : "${widget.salesModeNotifier.value ?? "Cash"} Account",
                                valueNotifier: widget.cashAccountNotifier,
                                backgroundColor: AppUtils.isDarkMode(context)
                                    ? context.colorScheme.tertiaryContainer
                                    : context.surfaceColor,
                                items: ledgerNames,
                                onChanged: (newValue) {
                                  widget.cashAccountNotifier.value = newValue;
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
                          orElse: () => SizedBox.shrink(),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: salesLedgerState.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          loaded: (ledgers) {
                            if (ledgers.isEmpty) {
                              return Text('No sales ledger data available');
                            }

                            final List<String> ledgerNames = ledgers
                                .map((ledger) => ledger.ledgerName ?? "")
                                .where((name) => name.isNotEmpty)
                                .toList();

                            if (ledgerNames.isNotEmpty &&
                                widget.salesAccountNotifier.value == null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                widget.salesAccountNotifier.value =
                                    ledgerNames.first;
                              });
                            }

                            return DropdownField(
                                height: 38.h,
                                labelAndTextFieldGap: 2,
                                label: widget.purchaseNoController != null
                                    ? context
                                        .translate(AppStrings.purchaseAccount)
                                    : context
                                        .translate(AppStrings.salesAccount),
                                valueNotifier: widget.salesAccountNotifier,
                                items: ledgerNames,
                                backgroundColor: AppUtils.isDarkMode(context)
                                    ? context.colorScheme.tertiaryContainer
                                    : context.surfaceColor,
                                onChanged: (newValue) {
                                  widget.salesAccountNotifier.value = newValue;
                                  if (newValue != null) {
                                    final salesLedger = ledgers.firstWhere(
                                      (cashLedger) =>
                                          cashLedger.ledgerName
                                              ?.toLowerCase() ==
                                          newValue.toLowerCase(),
                                    );
                                    ref
                                        .read(cartProvider.notifier)
                                        .setSalesAccount(salesLedger);
                                  }
                                });
                          },
                          error: (message) => Text(message),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
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
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _getDefaultSelection(List<PaymentModeModel> paymentModes) {
    final currentSalesMode =
        ref.read(cartProvider.notifier).salesMode.toLowerCase();

    final selectedMode = paymentModes.firstWhere(
      (mode) => currentSalesMode.isNotEmpty
          ? mode.paymentModes.toLowerCase() == currentSalesMode
          : mode.paymentModes.toLowerCase() == 'cash',
      orElse: () => paymentModes.first,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedValue = selectedMode.paymentModes;
      ref.read(cartProvider.notifier).setSalesMode(selectedValue);
      widget.salesModeNotifier.value = selectedValue;

      final selectedLower = selectedValue.toLowerCase();
      if (selectedLower == 'cash') {
        widget.cashAccountNotifier.value = null;
        ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
      } else {
        widget.cashAccountNotifier.value = null;
        ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
      }
    });
  }
}
