import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/supplier_info_widget.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/purchase/purchase_notifier.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewPurchaseForm extends ConsumerStatefulWidget {
  final TextEditingController supInvNoController;
  final ValueNotifier<String?> purchaseModeNotifier;
  final ValueNotifier<String?> purchasedByNotifier;
  final ValueNotifier<String?> cashAccountNotifier;
  final ValueNotifier<String?> purchaseAccountNotifier;
  final TextEditingController purchaseNoController;
  const AddNewPurchaseForm(
      {super.key,
      required this.purchaseAccountNotifier,
      required this.supInvNoController,
      required this.purchaseModeNotifier,
      required this.purchasedByNotifier,
      required this.cashAccountNotifier,
      required this.purchaseNoController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewPurchaseFormState();
}

class _AddNewPurchaseFormState extends ConsumerState<AddNewPurchaseForm> {
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
    widget.purchaseNoController.text =
        ref.watch(purchaseProvider).purchaseNo ?? "";
    widget.supInvNoController.text = ref.watch(purchaseProvider).supInvNo ?? "";

    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 4, child: SupplierInfoWidget()),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    child: CustomTextField(
                      label: context.translate(AppStrings.purchaseNo),
                      controller: widget.purchaseNoController,
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                      hint: context.translate(AppStrings.purchaseNo),
                      fillColor: context.surfaceColor,
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    label: context.translate(AppStrings.supInvNo),
                    controller: widget.supInvNoController,
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
                      initialValue: ref.watch(purchaseProvider).purchaseDate,
                      onDateSelected: (data) {
                        ref
                            .read(purchaseProvider.notifier)
                            .setPurchaseDate(data);
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
                      widget.purchaseModeNotifier.value == null) {
                    _getDefaultSelection(paymentModes);
                  }

                  return DropdownField(
                    label: context.translate(AppStrings.purchaseMode),
                    valueNotifier: widget.purchaseModeNotifier,
                    items:
                        paymentModes.map((mode) => mode.paymentModes).toList(),
                    backgroundColor: AppUtils.isDarkMode(context)
                        ? context.colorScheme.tertiaryContainer
                        : context.surfaceColor,
                    onChanged: (newValue) {
                      widget.purchaseModeNotifier.value = newValue;
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
                      if (widget.purchasedByNotifier.value != matchedEmployee) {
                        widget.purchasedByNotifier.value = matchedEmployee;

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
                    label: context.translate(AppStrings.purchasedBy),
                    valueNotifier: widget.purchasedByNotifier,
                    onChanged: (newValue) {
                      widget.purchasedByNotifier.value = newValue;

                      if (newValue != null) {
                        final selectedEmployee = employeeList.firstWhere(
                          (employee) =>
                              employee.empName?.trim().toLowerCase() ==
                              newValue.toLowerCase(),
                        );

                        ref
                            .read(purchaseProvider.notifier)
                            .setPurchasedBy(selectedEmployee);
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
            return AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: isExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: cashLedgerState.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          loaded: (ledgers) {
                            List<String> ledgerNames = ledgers
                                .map((ledger) => ledger.ledgerName ?? "")
                                .toList();

                            if (ledgerNames.isNotEmpty &&
                                widget.cashAccountNotifier.value == null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                widget.cashAccountNotifier.value =
                                    ledgerNames.first;
                                ref
                                    .read(purchaseProvider.notifier)
                                    .setPurchaseAccount(ledgers.first);
                              });
                            }

                            return DropdownField(
                              height: 38.h,
                              labelAndTextFieldGap: 2,
                              label: (widget.purchaseModeNotifier.value
                                          ?.isEmpty ??
                                      true)
                                  ? context.translate(AppStrings.cashAccount)
                                  : "${widget.purchaseModeNotifier.value ?? "Cash"} Account",
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
                                      .read(purchaseProvider.notifier)
                                      .setCashAccount(cashLedger);
                                }
                              },
                            );
                          },
                          error: (message) => Text(message),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: salesLedgerState.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          loaded: (ledgers) {
                            if (ledgers.isEmpty) {
                              return const Text(
                                  'No sales ledger data available');
                            }

                            final ledgerNames = ledgers
                                .map((ledger) => ledger.ledgerName ?? "")
                                .where((name) => name.isNotEmpty)
                                .toList();

                            if (ledgerNames.isNotEmpty &&
                                widget.purchaseAccountNotifier.value == null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                widget.purchaseAccountNotifier.value =
                                    ledgerNames.first;
                              });
                            }

                            return DropdownField(
                              height: 38.h,
                              labelAndTextFieldGap: 2,
                              label:
                                  context.translate(AppStrings.purchaseAccount),
                              valueNotifier: widget.purchaseAccountNotifier,
                              items: ledgerNames,
                              backgroundColor: AppUtils.isDarkMode(context)
                                  ? context.colorScheme.tertiaryContainer
                                  : context.surfaceColor,
                              onChanged: (newValue) {
                                widget.purchaseAccountNotifier.value = newValue;
                                if (newValue != null) {
                                  final salesLedger = ledgers.firstWhere(
                                    (cashLedger) =>
                                        cashLedger.ledgerName?.toLowerCase() ==
                                        newValue.toLowerCase(),
                                  );
                                  ref
                                      .read(purchaseProvider.notifier)
                                      .setPurchaseAccount(salesLedger);
                                }
                              },
                            );
                          },
                          error: (message) => Text(message),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
              secondChild: const SizedBox.shrink(),
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
    final currentPurchaseMode =
        ref.read(purchaseProvider.notifier).purchaseMode.toLowerCase();

    final selectedMode = paymentModes.firstWhere(
      (mode) => currentPurchaseMode.isNotEmpty
          ? mode.paymentModes.toLowerCase() == currentPurchaseMode
          : mode.paymentModes.toLowerCase() == 'cash',
      orElse: () => paymentModes.first,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedValue = selectedMode.paymentModes;
      ref.read(purchaseProvider.notifier).setPurchaseMode(selectedValue);
      widget.purchaseModeNotifier.value = selectedValue;

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
