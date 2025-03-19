import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/purchase/presentation/providers/fetch_purchase_invoice/fetch_purchase_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_filter_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:easy_vat_v2/app/features/widgets/date_picker_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/date_range_picker.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/filter_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';

class PurchaseInvoiceAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController searchController;

  const PurchaseInvoiceAppbar({
    super.key,
    required this.searchController,
  });

  @override
  ConsumerState<PurchaseInvoiceAppbar> createState() => _PosAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(110.h + kToolbarHeight);
}

class _PosAppBarState extends ConsumerState<PurchaseInvoiceAppbar> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  DateTime? selectedSaleDate;
  final ValueNotifier<String?> purchaseModeModeNotifer = ValueNotifier(null);
  final ValueNotifier<String?> purchasedByNotifier = ValueNotifier(null);
  final ValueNotifier<String?> paymentMethodNotifier = ValueNotifier(null);

  void _updateFromDate(DateTime selectedDate) {
    setState(() {
      fromDate = selectedDate;
    });
  }

  void _updateToDate(DateTime selectedDate) {
    setState(() {
      toDate = selectedDate;
    });
  }

  void _fetchSalesInvoice() {
    ref.read(fetchPurchaseInvoiceProvider.notifier).fetchPurchaseInvoice();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: context.colorScheme.onPrimary,
      title: Text(AppStrings.purchaseInvoice),
      actions: [
        PopupMenuButton<String>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          color: context.colorScheme.surfaceContainerLowest,
          offset: Offset(-10.w, 30.h),
          onSelected: (value) {},
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: AppStrings.print,
              child: _popupItem(AppStrings.print),
            ),
            PopupMenuItem(
              value: AppStrings.downloadExcel,
              child: _popupItem(AppStrings.downloadExcel),
            ),
            PopupMenuItem(
              value: AppStrings.showReport,
              child: _popupItem(AppStrings.showReport),
            ),
          ],
        ),
      ],
      bottom: PreferredSize(
        preferredSize: widget.preferredSize,
        child: Column(
          children: [
            _buildSearchAndFilter(context),
            const Divider(height: 0),
            Container(
              color: AppUtils.isDarkMode(context)
                  ? Theme.of(context).scaffoldBackgroundColor
                  : context.colorScheme.surfaceContainerLowest,
              padding: const EdgeInsets.only(
                  left: 16.0, top: 3.0, bottom: 3.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: DateRangePicker(
                      onFromDateSelected: _updateFromDate,
                      onToDateSelected: _updateToDate,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      _fetchSalesInvoice();
                    },
                    child: Container(
                      height: 36.h,
                      width: 41.w,
                      decoration: BoxDecoration(
                          color: AppUtils.isDarkMode(context)
                              ? context.colorScheme.surfaceBright
                              : context.colorScheme.surfaceContainerLowest,
                          border: Border.all(
                            color: context.colorScheme.outline.withValues(
                              alpha: 0.5,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      child: SvgIcon(
                        icon: Assets.icons.search,
                        color: AppUtils.isDarkMode(context)
                            ? context.onPrimaryColor
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 4, height: 0),
          ],
        ),
      ),
    );
  }

  _buildFilterBottomSheet(BuildContext context) {
    final salesManState = ref.read(salesManProvider);
    final paymentModeState = ref.read(paymentModeNotifierProvider);
    return showModalBottomSheet(
      backgroundColor: context.colorScheme.tertiaryContainer,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.filters,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    ref
                        .read(salesInvoiceNotifierProvider.notifier)
                        .filterSalesInvoice(
                            params:
                                SalesInvoiceFilterParams(clearAllFilter: true));
                    context.router.popForced();
                  },
                  child: Text(
                    AppStrings.clearAll,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppUtils.isDarkMode(context)
                          ? Color(0xFF8B62F1)
                          : context.colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: DatePickerTextField(
                    label: AppStrings.salesDate,
                    onDateSelected: (DateTime selectedDate) {
                      selectedSaleDate = selectedDate;
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: paymentModeState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () =>
                        Center(child: CircularProgressIndicator.adaptive()),
                    error: (message) => Text('Error: $message'),
                    loaded: (paymentModes, selectedPaymentMode) {
                      return DropdownField(
                        label: AppStrings.salesMode,
                        valueNotifier: paymentMethodNotifier,
                        items: paymentModes
                            .map((mode) => mode.paymentModes)
                            .toList(),
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : context.surfaceColor,
                        onChanged: (newValue) {
                          paymentMethodNotifier.value = newValue;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: salesManState.maybeWhen(
                    loaded: (employeeList) {
                      final List<String> employeeNames = employeeList
                          .map((employee) => employee.empName ?? "")
                          .where((name) => name.isNotEmpty)
                          .toList();

                      return DropdownField(
                        height: 38.h,
                        labelAndTextFieldGap: 2,
                        label: AppStrings.soldBy,
                        valueNotifier: purchasedByNotifier,
                        onChanged: (newValue) {
                          purchasedByNotifier.value = newValue;
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
                SizedBox(width: 12.w),
                const Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: AppStrings.filter,
                onPressed: () {
                  final params = SalesInvoiceFilterParams(
                      clearAllFilter: false,
                      salesDate: selectedSaleDate,
                      salesMode: purchaseModeModeNotifer.value,
                      soldBy: purchasedByNotifier.value);
                  ref
                      .read(salesInvoiceNotifierProvider.notifier)
                      .filterSalesInvoice(params: params);
                  context.router.popForced();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _popupItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(text),
    );
  }

  Widget _buildSearchAndFilter(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 16.0, bottom: 16.0, right: 8.0),
            child: TextInputFormField(
              height: 36.h,
              controller: widget.searchController,
              fillColor: AppUtils.isDarkMode(context)
                  ? context.colorScheme.surfaceBright
                  : null,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgIcon(
                    icon: Assets.icons.search,
                    color: AppUtils.isDarkMode(context)
                        ? context.colorScheme.onPrimary
                        : null),
              ),
              hint: AppStrings.search,
              hintDecoration: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.defaultTextColor.withValues(alpha: .32)),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {},
                  child: SvgIcon(
                      icon: Assets.icons.barcode,
                      color: AppUtils.isDarkMode(context)
                          ? context.colorScheme.onPrimary
                          : null),
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: FilterWidget(
            onTap: () => _buildFilterBottomSheet(context),
          ),
        ),
      ],
    );
  }
}
