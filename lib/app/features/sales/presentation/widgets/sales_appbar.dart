import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales/sales_notifier.dart';
import 'package:easy_vat_v2/app/features/salesman/presentation/providers/salesman_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/sales_invoice/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/customer_selector_widget.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/filter_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/date_range_picker.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';

/// Generic Sales App Bar for various sales-related screens
class SalesAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  /// Controller for the search input
  final TextEditingController searchController;

  /// Configuration options for the app bar
  final SalesAppBarConfig config;

  const SalesAppBar({
    super.key,
    required this.searchController,
    required this.config,
  });

  @override
  ConsumerState<SalesAppBar> createState() => _SalesAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(123.h + kToolbarHeight);
}

/// Configuration class for customizing the SalesAppBar
class SalesAppBarConfig {
  /// Title of the app bar
  final String title;

  /// Optional confirmation dialog to show on back navigation
  final Future<bool> Function()? onWillPop;

  /// Custom fetch function for retrieving data
  final Future<void> Function(SalesParams params)? fetchFunction;

  /// Custom filter function for applying filters
  final Future<void> Function(SalesParams params)? filterFunction;

  /// Additional popup menu items
  final List<PopupMenuEntry<String>>? additionalPopupMenuItems;

  /// Whether to show date range picker
  final bool showDateRangePicker;

  /// Whether to show search bar
  final bool showSearchBar;

  /// Whether to show filter button
  final bool showFilterButton;

  /// Whether to enable barcode scanning
  final bool enableBarcodeScanning;

  /// Callback for barcode scanning
  final VoidCallback? onBarcodeScan;

  /// Flag to indicate if this is for purchase instead of sales
  final bool isForPurchase;

  const SalesAppBarConfig(
      {this.title = '',
      this.fetchFunction,
      this.filterFunction,
      this.additionalPopupMenuItems,
      this.showDateRangePicker = true,
      this.showSearchBar = true,
      this.showFilterButton = true,
      this.enableBarcodeScanning = false,
      this.onBarcodeScan,
      this.onWillPop,
      this.isForPurchase = false});
}

class _SalesAppBarState extends ConsumerState<SalesAppBar> {
  final ValueNotifier<String?> salesModeNotifier = ValueNotifier(null);
  final ValueNotifier<String?> soldByNotifier = ValueNotifier(null);
  final ValueNotifier<String?> paymentMethodNotifier = ValueNotifier(null);
  late final ValueNotifier<bool> isSearchNotEmpty;

  DateTime? selectedSaleDate;

  @override
  void initState() {
    super.initState();
    isSearchNotEmpty = ValueNotifier(false);
    widget.searchController.addListener(() {
      isSearchNotEmpty.value = widget.searchController.text.trim().isNotEmpty;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dateRangeProvider.notifier).updateFromDate(DateTime.now());
      ref.read(dateRangeProvider.notifier).updateToDate(DateTime.now());
    });
  }

  @override
  void dispose() {
    isSearchNotEmpty.dispose();
    super.dispose();
  }

  Future<void> _defaultFetchInvoice() async {
    final dateRange = ref.read(dateRangeProvider);

    final params = SalesParams(
      salesIDPK: "00000000-0000-0000-0000-000000000000",
      fromDate: dateRange.fromDate,
      toDate: dateRange.toDate,
      customerID: "00000000-0000-0000-0000-000000000000",
    );

    if (widget.config.fetchFunction != null) {
      await widget.config.fetchFunction!(params);
    } else {
      await ref
          .read(salesInvoiceNotifierProvider.notifier)
          .fetchSalesInvoice(params: params);
    }
  }

  _buildFilterBottomSheet(BuildContext context) {
    final paymentModeState = ref.read(paymentModeNotifierProvider);
    final salesManState = ref.read(salesManProvider);
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
                  context.translate(AppStrings.filters),
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    salesModeNotifier.value = null;
                    soldByNotifier.value = null;
                    ref.read(salesProvider.notifier).selectedCustomer = null;

                    context.router.popForced();
                  },
                  child: Text(
                    context.translate(AppStrings.clearAll),
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
                  child: paymentModeState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () =>
                        Center(child: CircularProgressIndicator.adaptive()),
                    error: (message) => Text('Error: $message'),
                    loaded: (paymentModes, selectedPaymentMode) {
                      return DropdownField(
                        label: context.translate(widget.config.isForPurchase
                            ? AppStrings.purchaseMode
                            : AppStrings.salesMode),
                        valueNotifier: salesModeNotifier,
                        items: paymentModes
                            .map((mode) => mode.paymentModes)
                            .toList(),
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : context.surfaceColor,
                        onChanged: (newValue) {
                          salesModeNotifier.value = newValue;
                        },
                      );
                    },
                  ),
                ),
                SizedBox(width: 12.w),
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
                        label: context.translate(widget.config.isForPurchase
                            ? AppStrings.purchasedBy
                            : AppStrings.soldBy),
                        valueNotifier: soldByNotifier,
                        onChanged: (newValue) {
                          soldByNotifier.value = newValue;
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
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(child: CustomerSelectorWidget()),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: context.translate(AppStrings.filter),
                onPressed: () {
                  final params = SalesParams(
                      fromDate: ref.read(dateRangeProvider).fromDate,
                      toDate: ref.read(dateRangeProvider).toDate,
                      customerID: ref
                          .read(salesProvider.notifier)
                          .selectedCustomer
                          ?.ledgerIdpk,
                      salesMode: salesModeNotifier.value,
                      soldBy: soldByNotifier.value);

                  if (widget.config.filterFunction != null) {
                    widget.config.filterFunction!(params);
                  } else {
                    ref
                        .read(salesInvoiceNotifierProvider.notifier)
                        .fetchSalesInvoice(params: params);
                  }
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
            child: ValueListenableBuilder<bool>(
              valueListenable: isSearchNotEmpty,
              builder: (_, hasText, __) => TextInputFormField(
                height: 36.h,
                controller: widget.searchController,
                textInputAction: TextInputAction.done,
                maxLines: 1,
                fillColor: AppUtils.isDarkMode(context)
                    ? context.colorScheme.surfaceBright
                    : null,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgIcon(
                    icon: Assets.icons.search,
                    color: AppUtils.isDarkMode(context)
                        ? context.colorScheme.onPrimary
                        : null,
                  ),
                ),
                hint: context.translate(AppStrings.search),
                hintDecoration: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.defaultTextColor.withValues(alpha: .32),
                ),
                onChanged: (value) => ref
                    .read(salesInvoiceNotifierProvider.notifier)
                    .searchSalesInvoice(value),
                suffixIcon: hasText
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            widget.searchController.clear();
                            isSearchNotEmpty.value = false;
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      )
                    : widget.config.enableBarcodeScanning
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: widget.config.onBarcodeScan,
                              child: SvgIcon(
                                icon: Assets.icons.barcode,
                                color: AppUtils.isDarkMode(context)
                                    ? context.colorScheme.onPrimary
                                    : null,
                              ),
                            ),
                          )
                        : null,
              ),
            ),
          ),
        ),
        if (widget.config.showFilterButton)
          Container(
            padding: const EdgeInsets.all(5),
            child: FilterWidget(
              onTap: () => _buildFilterBottomSheet(context),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.config.onWillPop == null,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && widget.config.onWillPop != null) {
          final shouldPop = await widget.config.onWillPop!();
          if (shouldPop && context.mounted) {
            context.back();
          }
        }
      },
      child: AppBar(
        surfaceTintColor: context.colorScheme.onPrimary,
        title: Text(widget.config.title.isNotEmpty
            ? widget.config.title
            : context.translate(AppStrings.salesInvoice)),
        actions: [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            color: context.colorScheme.surfaceContainerLowest,
            offset: Offset(-10.w, 30.h),
            onSelected: (value) {},
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            itemBuilder: (context) => [
              ...widget.config.additionalPopupMenuItems ??
                  [
                    PopupMenuItem(
                      value: AppStrings.print,
                      child: _popupItem((context.translate(AppStrings.print))),
                    ),
                    PopupMenuItem(
                      value: AppStrings.downloadExcel,
                      child: _popupItem(
                          context.translate(AppStrings.downloadExcel)),
                    ),
                    PopupMenuItem(
                      value: AppStrings.showReport,
                      child:
                          _popupItem(context.translate(AppStrings.showReport)),
                    ),
                  ],
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: widget.preferredSize,
          child: Column(
            children: [
              if (widget.config.showSearchBar) _buildSearchAndFilter(context),
              const Divider(height: 0),
              if (widget.config.showDateRangePicker)
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
                          onFromDateSelected: (selectedDate) {
                            ref
                                .read(dateRangeProvider.notifier)
                                .updateFromDate(selectedDate);
                          },
                          onToDateSelected: (selectedDate) {
                            ref
                                .read(dateRangeProvider.notifier)
                                .updateToDate(selectedDate);
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: _defaultFetchInvoice,
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
                            borderRadius: BorderRadius.circular(10),
                          ),
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
      ),
    );
  }
}
