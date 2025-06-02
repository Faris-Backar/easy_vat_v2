import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/expense/domain/usecase/params/expense_params.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense/expense_notifier.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/supplier_selector_widget.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/filter_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/date_range_picker.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController searchController;

  const ExpenseAppBar({super.key, required this.searchController});

  @override
  ConsumerState<ExpenseAppBar> createState() => _PosAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(110.h + kToolbarHeight);
}

class _PosAppBarState extends ConsumerState<ExpenseAppBar> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  DateTime? selectedExpenseDate;
  final ValueNotifier<int?> expenseNoNotifier = ValueNotifier(null);
  final ValueNotifier<String?> supplierNotifier = ValueNotifier(null);
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

  void _fetchExpense() {
    final params = ExpenseParams(
        expenseIDPK: "00000000-0000-0000-0000-000000000000",
        fromDate: fromDate,
        toDate: toDate,
        supplierID: "00000000-0000-0000-0000-000000000000");
    ref.read(expenseNotifierProvider.notifier).fetchExpenses(params: params);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: context.colorScheme.onPrimary,
      title: Text(context.translate(AppStrings.expenses)),
      actions: [
        PopupMenuButton<String>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: context.colorScheme.surfaceContainerLowest,
          offset: Offset(-10.w, 30.h),
          onSelected: (value) {},
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          itemBuilder: (context) => [
            PopupMenuItem(
                value: AppStrings.print,
                child: _popupItem(context.translate(AppStrings.print))),
            PopupMenuItem(
                value: AppStrings.downloadExcel,
                child: _popupItem(context.translate(AppStrings.downloadExcel))),
            PopupMenuItem(
                value: AppStrings.showReport,
                child: _popupItem(context.translate(AppStrings.showReport))),
          ],
        )
      ],
      bottom: PreferredSize(
          preferredSize: widget.preferredSize,
          child: Column(
            children: [
              _buildSearchAndFilter(context),
              const Divider(
                height: 0,
              ),
              Container(
                color: AppUtils.isDarkMode(context)
                    ? Theme.of(context).scaffoldBackgroundColor
                    : context.colorScheme.surfaceContainerLowest,
                padding: const EdgeInsets.only(
                    left: 16.0, right: 8.0, top: 3.0, bottom: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: DateRangePicker(
                      onFromDateSelected: _updateFromDate,
                      onToDateSelected: _updateToDate,
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        _fetchExpense();
                      },
                      child: Container(
                        height: 36.h,
                        width: 41.w,
                        decoration: BoxDecoration(
                            color: AppUtils.isDarkMode(context)
                                ? context.colorScheme.surfaceBright
                                : context.colorScheme.surfaceContainerLowest,
                            border: Border.all(
                                color: context.colorScheme.outline
                                    .withValues(alpha: 0.5)),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(10),
                        child: SvgIcon(
                          icon: Assets.icons.search,
                          color: AppUtils.isDarkMode(context)
                              ? context.onPrimaryColor
                              : null,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 4,
                height: 0,
              )
            ],
          )),
    );
  }

  _buildFilterBottomSheet(BuildContext context) {
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
                  context.translate(AppStrings.filters),
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // ref.read(expenseNotifierProvider.notifier).filterExpenses(
                    //     params: ExpenseFilterParam(clearAllFilter: true));
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
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                // date picker field excluded
                SizedBox(width: 12.w),
                Expanded(
                  flex: 1,
                  child: paymentModeState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () =>
                        Center(child: CircularProgressIndicator.adaptive()),
                    error: (message) => Text('Error: $message'),
                    loaded: (paymentModes, selectedPaymentMode) {
                      return DropdownField(
                        label: context.translate(AppStrings.paymentMode),
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
                SizedBox(width: 12.w),
                Expanded(
                  child: SupplierSelectorWidget(), //need to create supplier
                ),
                SizedBox(width: 12.w),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: context.translate(AppStrings.filter),
                onPressed: () {
                  // final params = ExpenseFilterParam(
                  //   clearAllFilter: false,
                  //   expenseDate: selectedExpenseDate,
                  //   paymentMode: null,
                  //   supplier: null,
                  // );
                  // ref
                  //     .read(expenseNotifierProvider.notifier)
                  //     .filterExpenses(params: params);
                  context.router.popForced();
                },
              ),
            )
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

  Widget _buildSearchAndFilter(BuildContext content) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 8.0, top: 16, bottom: 16),
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
                      : null,
                ),
              ),
              hint: context.translate(AppStrings.search),
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
                        : null,
                  ),
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
        )
      ],
    );
  }
}
