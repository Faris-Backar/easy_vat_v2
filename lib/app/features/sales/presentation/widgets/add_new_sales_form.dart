import 'dart:developer';

import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/sales_ledger_notifier/sales_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/data/model/payment_mode_model.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/pages/add_new_sales_screen.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales/sales_notifier.dart';
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
  final bool isSalesReturn;
  final SalesType salesType;

  const AddNewSalesForm({
    super.key,
    required this.saleNoController,
    required this.refNoController,
    required this.salesModeNotifier,
    required this.soldByNotifier,
    required this.cashAccountNotifier,
    required this.salesAccountNotifier,
    this.isSalesReturn = false,
    this.salesType = SalesType.salesInvoice,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewSalesFormState();
}

class _AddNewSalesFormState extends ConsumerState<AddNewSalesForm> {
  final _viewMoreNotifier = ValueNotifier(false);
  final TextEditingController _paymentTermsController = TextEditingController();
  final TextEditingController _projectDescriptionController =
      TextEditingController();
  final TextEditingController _termsAndConditionController =
      TextEditingController();
  final TextEditingController requestNoController = TextEditingController();
  final TextEditingController generalNoController = TextEditingController();
  final TextEditingController vehicleNoController = TextEditingController();
  final TextEditingController quotationValidityController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Initialize controllers with values from the sales provider
    final salesPrvd = ref.watch(salesProvider);
    widget.saleNoController.text = salesPrvd.salesNo ?? "";
    widget.refNoController.text = salesPrvd.refNo ?? "";
    _paymentTermsController.text = salesPrvd.paymentTerms ?? "";
    _projectDescriptionController.text = salesPrvd.projectDescription ?? "";
    _termsAndConditionController.text = salesPrvd.termsAndCondition ?? "";
    requestNoController.text = salesPrvd.quotationRequstNo ?? "";
    generalNoController.text = salesPrvd.generalNo ?? "";
    vehicleNoController.text = salesPrvd.vehicleNo ?? "";
    quotationValidityController.text = salesPrvd.quotationValidity ?? "";

    log("vehicleNo: ${vehicleNoController.text} || ${salesPrvd.vehicleNo} \n QuatationValidity: ${quotationValidityController.text} || ${salesPrvd.quotationValidity}");

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
                      label: salesNoLabel(),
                      controller: widget.saleNoController,
                      height: 38.h,
                      labelAndTextfieldGap: 2,
                      hint: salesNoLabel(),
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
                      initialValue: salesPrvd.saleDate,
                      onDateSelected: (date) {
                        ref.read(salesProvider.notifier).setSalesDate(date);
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
        buildSalesFields(),
      ],
    );
  }

  Widget buildSalesFields() {
    if (widget.salesType == SalesType.salesQuotation) {
      return Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: context.translate(AppStrings.requestNo),
                  hint: context.translate(AppStrings.enterRequestNo),
                  height: 38.h,
                  onChanged: (value) => ref
                      .read(salesProvider.notifier)
                      .setQuotationRequstNo(value),
                  controller: requestNoController,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomTextField(
                  label: context.translate(AppStrings.generalNo),
                  hint: context.translate(AppStrings.enterGeneralNo),
                  height: 38.h,
                  onChanged: (value) =>
                      ref.read(salesProvider.notifier).setGeneralNo(value),
                  controller: generalNoController,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // 👇 View More Section (Vehicle No + Validity + Description)
          ValueListenableBuilder(
            valueListenable: _viewMoreNotifier,
            builder: (context, isExpanded, _) {
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
                          child: CustomTextField(
                            label: context.translate(AppStrings.vehicleNo),
                            hint: context.translate(AppStrings.enterVehicleNo),
                            height: 38.h,
                            controller: vehicleNoController,
                            onChanged: (value) => ref
                                .read(salesProvider.notifier)
                                .setVehicleNumber(value),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomTextField(
                            label:
                                context.translate(AppStrings.quotationValidity),
                            hint: context
                                .translate(AppStrings.enterQuotationValidity),
                            height: 38.h,
                            controller: quotationValidityController,
                            onChanged: (value) => ref
                                .read(salesProvider.notifier)
                                .setQuotationValidity(value),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: context.translate(AppStrings.paymentTerms),
                      controller: _paymentTermsController,
                      onChanged: (value) => ref
                          .read(salesProvider.notifier)
                          .setPaymentTerms(value),
                      hint: context.translate(AppStrings.enterPaymentTerms),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: context.translate(AppStrings.projectDescription),
                      controller: _projectDescriptionController,
                      maxLines: 5,
                      onChanged: (value) => ref
                          .read(salesProvider.notifier)
                          .setProjectDescription(value),
                      hint:
                          context.translate(AppStrings.enterProjectDescription),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: context.translate(AppStrings.termsAndCondition),
                      controller: _termsAndConditionController,
                      maxLines: 5,
                      onFieldSubmitted: (value) => ref
                          .read(salesProvider.notifier)
                          .setTermsAndCondition(value),
                      hint:
                          context.translate(AppStrings.enterTermsAndCondition),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                secondChild: const SizedBox.shrink(),
              );
            },
          ),

          // 👇 View More / View Less Toggle Button
          InkWell(
            onTap: () {
              _viewMoreNotifier.value = !_viewMoreNotifier.value;
            },
            child: Container(
              height: 30,
              width: double.infinity,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppUtils.isDarkMode(context)
                    ? context.colorScheme.tertiaryContainer
                    : context.colorScheme.secondary.withValues(alpha: 0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _viewMoreNotifier.value
                        ? context.translate(AppStrings.viewLess)
                        : context.translate(AppStrings.viewMore),
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.secondary,
                    ),
                  ),
                  Icon(
                    _viewMoreNotifier.value
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 16,
                    color: context.colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    // 👇 Default: Sales Invoice, Return, or Order
    return _buildDefaultSalesFields(); // Extracted to keep it clean
  }

  _buildDefaultSalesFields() {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ref.watch(paymentModeNotifierProvider).when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    error: (message) => Text('Error: $message'),
                    loaded: (paymentModes, _) {
                      if (paymentModes.isNotEmpty &&
                          widget.salesModeNotifier.value == null) {
                        _getDefaultSelection(paymentModes);
                      }

                      return DropdownField(
                        label: context.translate(AppStrings.salesMode),
                        valueNotifier: widget.salesModeNotifier,
                        items: paymentModes.map((e) => e.paymentModes).toList(),
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : context.surfaceColor,
                        onChanged: (newValue) {
                          widget.salesModeNotifier.value = newValue;
                          final lower = newValue?.toLowerCase();
                          if (lower == "cash") {
                            widget.cashAccountNotifier.value = null;
                            ref
                                .read(cashLedgerNotifierProvider.notifier)
                                .fetchCashLedgers();
                          } else if (["bank", "card", "credit"]
                              .contains(lower)) {
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
            SizedBox(width: 10.w),
            Expanded(
              child: ref.watch(salesManProvider).maybeWhen(
                    loaded: (employees) {
                      final employeeNames = employees
                          .map((e) => e.empName ?? "")
                          .where((name) => name.isNotEmpty)
                          .toList();

                      final providerSoldBy = ref.read(salesProvider).soldBy;

                      if (employeeNames.isNotEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          final fallbackSoldBy = employeeNames.first;
                          final validValue =
                              providerSoldBy?.empName?.toLowerCase().trim();
                          final matched = employeeNames.firstWhere(
                            (name) => name.toLowerCase().trim() == validValue,
                            orElse: () => fallbackSoldBy,
                          );
                          if (widget.soldByNotifier.value != matched) {
                            widget.soldByNotifier.value = matched;
                            final selectedEmp = employees.firstWhere(
                              (e) =>
                                  e.empName?.toLowerCase().trim() ==
                                  matched.toLowerCase(),
                            );
                            ref
                                .read(salesProvider.notifier)
                                .setSoldBy(selectedEmp);
                          }
                        });
                      }

                      return DropdownField(
                        height: 38.h,
                        labelAndTextFieldGap: 2,
                        label: context.translate(AppStrings.soldBy),
                        valueNotifier: widget.soldByNotifier,
                        onChanged: (newValue) {
                          widget.soldByNotifier.value = newValue;
                          final emp = employees.firstWhere(
                            (e) =>
                                e.empName?.toLowerCase().trim() ==
                                newValue?.toLowerCase(),
                          );
                          ref.read(salesProvider.notifier).setSoldBy(emp);
                        },
                        items: employeeNames,
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : context.surfaceColor,
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                    loading: () => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    error: (message) => Text(message),
                  ),
            ),
          ],
        ),
        SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: _viewMoreNotifier,
          builder: (_, isExpanded, __) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: isExpanded ? 80.h : 0,
              child: Row(
                children: [
                  Expanded(
                    child: ref.watch(cashLedgerNotifierProvider).maybeWhen(
                          loading: () =>
                              const CircularProgressIndicator.adaptive(),
                          loaded: (ledgers) {
                            final ledgerNames =
                                ledgers.map((e) => e.ledgerName ?? "").toList();
                            if (ledgerNames.isNotEmpty &&
                                widget.cashAccountNotifier.value == null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                widget.cashAccountNotifier.value =
                                    ledgerNames.first;
                                ref
                                    .read(salesProvider.notifier)
                                    .setCashAccount(ledgers.first);
                              });
                            }
                            return DropdownField(
                              label:
                                  "${widget.salesModeNotifier.value ?? "Cash"} Account",
                              valueNotifier: widget.cashAccountNotifier,
                              items: ledgerNames,
                              height: 38.h,
                              labelAndTextFieldGap: 2,
                              onChanged: (newValue) {
                                widget.cashAccountNotifier.value = newValue;
                                final matched = ledgers.firstWhere((l) =>
                                    l.ledgerName?.toLowerCase() ==
                                    newValue?.toLowerCase());
                                ref
                                    .read(salesProvider.notifier)
                                    .setCashAccount(matched);
                              },
                              backgroundColor: AppUtils.isDarkMode(context)
                                  ? context.colorScheme.tertiaryContainer
                                  : context.surfaceColor,
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                          error: (msg) => Text(msg),
                        ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ref.watch(salesLedgerNotifierProvider).maybeWhen(
                          loading: () =>
                              const CircularProgressIndicator.adaptive(),
                          loaded: (ledgers) {
                            final names = ledgers
                                .map((e) => e.ledgerName ?? "")
                                .where((e) => e.isNotEmpty)
                                .toList();
                            if (names.isNotEmpty &&
                                widget.salesAccountNotifier.value == null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                final defaultLedger = widget.isSalesReturn
                                    ? ledgers.firstWhere(
                                        (l) =>
                                            l.ledgerName
                                                ?.toLowerCase()
                                                .trim() ==
                                            "sales return",
                                        orElse: () => ledgers.first,
                                      )
                                    : ledgers.first;
                                widget.salesAccountNotifier.value =
                                    defaultLedger.ledgerName;
                                ref
                                    .read(salesProvider.notifier)
                                    .setSalesAccount(defaultLedger);
                              });
                            }
                            return DropdownField(
                              label: context.translate(AppStrings.salesAccount),
                              valueNotifier: widget.salesAccountNotifier,
                              items: names,
                              height: 38.h,
                              labelAndTextFieldGap: 2,
                              onChanged: (newValue) {
                                widget.salesAccountNotifier.value = newValue;
                                final matched = ledgers.firstWhere((l) =>
                                    l.ledgerName?.toLowerCase() ==
                                    newValue?.toLowerCase());
                                ref
                                    .read(salesProvider.notifier)
                                    .setSalesAccount(matched);
                              },
                              backgroundColor: AppUtils.isDarkMode(context)
                                  ? context.colorScheme.tertiaryContainer
                                  : context.surfaceColor,
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                          error: (msg) => Text(msg),
                        ),
                  ),
                ],
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _viewMoreNotifier,
          builder: (_, isExpanded, __) {
            return InkWell(
              onTap: () => _viewMoreNotifier.value = !isExpanded,
              child: Container(
                height: 30,
                width: double.infinity,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppUtils.isDarkMode(context)
                      ? context.colorScheme.tertiaryContainer
                      : context.colorScheme.secondary.withValues(alpha: 0.2),
                ),
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
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 16,
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
        ref.read(salesProvider.notifier).salesMode.toLowerCase();

    final selectedMode = paymentModes.firstWhere(
      (mode) => currentSalesMode.isNotEmpty
          ? mode.paymentModes.toLowerCase() == currentSalesMode
          : mode.paymentModes.toLowerCase() == 'cash',
      orElse: () => paymentModes.first,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedValue = selectedMode.paymentModes;
      ref.read(salesProvider.notifier).setSalesMode(selectedValue);
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

  salesNoLabel() {
    if (widget.salesType == SalesType.salesInvoice) {
      return context.translate(AppStrings.salesNo);
    } else if (widget.salesType == SalesType.salesReturn) {
      return context.translate(AppStrings.salesNo);
    } else if (widget.salesType == SalesType.salesQuotation) {
      return context.translate(AppStrings.quotationNo);
    } else if (widget.salesType == SalesType.salesOrder) {
      return context.translate(AppStrings.orderNo);
    }
    return context.translate(AppStrings.salesNo);
  }
}
