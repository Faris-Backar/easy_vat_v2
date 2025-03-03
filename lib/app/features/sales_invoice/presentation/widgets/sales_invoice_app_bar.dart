import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/sales_notifiers.dart';
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
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/filter_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';

class SalesInvoiceAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController searchController;

  const SalesInvoiceAppBar({
    super.key,
    required this.searchController,
  });

  @override
  ConsumerState<SalesInvoiceAppBar> createState() => _PosAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(110.h + kToolbarHeight);
}

class _PosAppBarState extends ConsumerState<SalesInvoiceAppBar> {
  DateTime? fromDate;
  DateTime? toDate;
  DateTime? selectedSaleDate;
  final ValueNotifier<String?> salesModeNotifer = ValueNotifier(null);
  final ValueNotifier<String?> soldByNotifier = ValueNotifier(null);

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
    if (fromDate != null && toDate != null) {
      final params = SalesInvoiceParams(
        salesIDPK: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        fromDate: fromDate!,
        toDate: toDate!,
        customerID: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      );
      ref
          .read(salesInvoiceNotifierProvider.notifier)
          .fetchSalesInvoice(params: params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: context.colorScheme.onPrimary,
      title: Text(AppStrings.salesInvoice),
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
                Text(
                  AppStrings.clearAll,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppUtils.isDarkMode(context)
                        ? Color(0xFF8B62F1)
                        : context.colorScheme.primary,
                    decoration: TextDecoration.underline,
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
                  child: DropdownField(
                    label: AppStrings.salesMode,
                    valueNotifier: salesModeNotifer,
                    items: ["Cash", "Card", "Online"],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: DropdownField(
                    label: AppStrings.soldBy,
                    hint: AppStrings.selectSaleMode,
                    valueNotifier: soldByNotifier,
                    items: ["Faris", "Salih", "Adhil"],
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
                onPressed: () {},
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
          color: context.colorScheme.surfaceContainer,
          padding: const EdgeInsets.all(5),
          child: FilterWidget(
            onTap: () => _buildFilterBottomSheet(context),
          ),
        ),
      ],
    );
  }
}
