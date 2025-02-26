import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/domain/usecase/params/sales_invoice_params.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/sales_notifiers.dart';
import 'package:easy_vat_v2/app/features/widgets/date_range_picker.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/filter_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';

class PosAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  final TextEditingController searchController;

  const PosAppBar({
    super.key,
    required this.searchController,
  });

  @override
  ConsumerState<PosAppBar> createState() => _PosAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(110.h + kToolbarHeight);
}

class _PosAppBarState extends ConsumerState<PosAppBar> {
  DateTime fromDate = DateTime.now();
  DateTime? toDate;

  void _updateFromDate(DateTime selectedDate) {
    setState(() {
      fromDate = selectedDate;
    });
    _fetchSalesInvoice();
  }

  void _updateToDate(DateTime selectedDate) {
    setState(() {
      toDate = selectedDate;
    });
    _fetchSalesInvoice();
  }

  void _fetchSalesInvoice() {
    if (toDate != null) {
      final params = SalesInvoiceParams(
        salesIDPK: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        fromDate: fromDate,
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
      title: Text(AppStrings.pointOfSales),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 5,
                  child: DateRangePicker(
                    onFromDateSelected: _updateFromDate,
                    onToDateSelected: _updateToDate,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        color: context.colorScheme.surfaceContainerLowest,
                        padding: const EdgeInsets.all(5),
                        child: FilterWidget(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.filters,
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        AppStrings.clearAll,
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: context.colorScheme.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Divider(
                                    height: 0,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Expanded(child: )
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ))),
              ],
            ),
            const Divider(thickness: 4, height: 0),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: TextInputFormField(
        controller: widget.searchController,
        prefixIcon: const Icon(Icons.search_rounded),
        hint: AppStrings.search,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {},
            child: SvgIcon(icon: Assets.icons.barcode),
          ),
        ),
      ),
    );
  }
}
