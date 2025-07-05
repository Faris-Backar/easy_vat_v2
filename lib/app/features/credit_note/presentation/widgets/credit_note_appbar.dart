import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/params/credit_note_filter_params.dart';
import 'package:easy_vat_v2/app/features/credit_note/domain/usecase/params/credit_note_params.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note/credit_note_notifier.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/providers/credit_note_cart/credit_note_cart_provider.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/filter_widget.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/providers/date_range/date_range_provider.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/customer_selector_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/date_range_picker.dart';
import 'package:easy_vat_v2/app/features/widgets/dropdown_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditNoteAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController searchController;
  final CreditNoteAppBarConfig config;

  const CreditNoteAppbar(
      {super.key, required this.searchController, required this.config});

  @override
  ConsumerState<CreditNoteAppbar> createState() => _CreditNoteAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(120.h + kToolbarHeight);
}

class CreditNoteAppBarConfig {
  final String title;
  final Future<bool> Function()? onWillPop;
  final Future<void> Function(CreditNoteParams params)? fetchFunction;
  final Future<void> Function(CreditNoteFilterParams params)? filterFunction;
  final List<PopupMenuEntry<String>>? additionalPopupMenuItems;
  final bool showDateRangePicker;
  final bool showSearchBar;
  final bool showFilterButton;

  const CreditNoteAppBarConfig({
    this.title = "",
    this.onWillPop,
    this.fetchFunction,
    this.filterFunction,
    this.additionalPopupMenuItems,
    this.showDateRangePicker = true,
    this.showSearchBar = true,
    this.showFilterButton = true,
  });
}

class _CreditNoteAppBarState extends ConsumerState<CreditNoteAppbar> {
  late final ValueNotifier<bool> isSearchNotEmpty;
  final ValueNotifier<int?> creditNoteNoNotifier = ValueNotifier(null);
  final ValueNotifier<String?> customerNotifier = ValueNotifier(null);
  final ValueNotifier<String?> paymentMethodNotifier = ValueNotifier(null);

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

  Future<void> _defaultFetchCreditNote() async {
    final dateRange = ref.read(dateRangeProvider);
    final params = CreditNoteParams(
        creditNoteIDPK: PrefResources.emptyGuid,
        fromDate: dateRange.fromDate,
        toDate: dateRange.toDate,
        customerID: PrefResources.emptyGuid);

    if (widget.config.fetchFunction != null) {
      await widget.config.fetchFunction!(params);
    } else {
      await ref
          .read(creditNoteNotifierProvider.notifier)
          .fetchCreditNote(params: params);
    }
  }

  _buidlFilterBottomSheet(BuildContext context) {
    final paymentModeState = ref.read(paymentModeNotifierProvider);
    return showModalBottomSheet(
        context: context,
        backgroundColor: context.colorScheme.tertiaryContainer,
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
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          if (widget.config.filterFunction != null) {
                            widget.config.filterFunction!(
                                CreditNoteFilterParams(clearAllFilter: true));
                          } else {
                            paymentMethodNotifier.value = null;
                          }
                          context.router.popForced();
                        },
                        child: Text(
                          context.translate(AppStrings.clearAll),
                          style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppUtils.isDarkMode(context)
                                  ? Color(0xFF8B62F1)
                                  : context.colorScheme.primary,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: paymentModeState.when(
                          initial: () => SizedBox.shrink(),
                          loading: () => Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          error: (message) => Text("Error: $message"),
                          loaded: (paymentModes, selectedPaymentMode) {
                            return DropdownField(
                                label:
                                    context.translate(AppStrings.paymentMode),
                                valueNotifier: paymentMethodNotifier,
                                items: paymentModes
                                    .map((mode) => mode.paymentModes)
                                    .toList(),
                                backgroundColor: AppUtils.isDarkMode(context)
                                    ? context.colorScheme.tertiaryContainer
                                    : context.surfaceColor,
                                onChanged: (newValue) {
                                  paymentMethodNotifier.value = newValue;
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                          child: paymentModeState.when(
                              initial: () => const SizedBox.shrink(),
                              loading: () => Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                              error: (message) => Text("Error: $message"),
                              loaded: (paymentModes, selectedPaymentMode) {
                                return DropdownField(
                                    label: context.translate(AppStrings.soldBy),
                                    valueNotifier: paymentMethodNotifier,
                                    items: paymentModes
                                        .map((mode) => mode.paymentModes)
                                        .toList(),
                                    onChanged: (newValue) {
                                      paymentMethodNotifier.value = newValue;
                                    });
                              }))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [Expanded(child: CustomerSelectorWidget())],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: context.translate(AppStrings.filter),
                      onPressed: () {
                        final params = CreditNoteParams(
                            fromDate: ref.read(dateRangeProvider).fromDate,
                            toDate: ref.read(dateRangeProvider).toDate,
                            customerID: ref
                                .read(creditNoteCartProvider.notifier)
                                .selectedCustomer
                                ?.ledgerIdpk,
                            paymentMode: paymentMethodNotifier.value);

                        if (widget.config.filterFunction != null) {
                        } else {
                          ref
                              .read(creditNoteNotifierProvider.notifier)
                              .fetchCreditNote(params: params);
                        }
                        context.router.popForced();
                      },
                    ),
                  )
                ],
              ),
            ));
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
            : context.translate(AppStrings.creditNote)),
        actions: [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            color: context.colorScheme.surfaceContainerLowest,
            offset: Offset(-10.w, 30.h),
            onSelected: (value) {},
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context) => [
              ...widget.config.additionalPopupMenuItems ??
                  [
                    PopupMenuItem(
                        value: AppStrings.print,
                        child: _popupItem(context.translate(AppStrings.print))),
                    PopupMenuItem(
                      value: AppStrings.downloadExcel,
                      child: _popupItem(
                          context.translate(AppStrings.downloadExcel)),
                    ),
                    PopupMenuItem(
                      value: AppStrings.showReport,
                      child:
                          _popupItem(context.translate(AppStrings.showReport)),
                    )
                  ]
            ],
          )
        ],
        bottom: PreferredSize(
            preferredSize: widget.preferredSize,
            child: Column(
              children: [
                if (widget.config.showSearchBar) _buildSearchAndFiler(context),
                const Divider(
                  height: 0,
                ),
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
                          }, onToDateSelected: (selectedDate) {
                            ref
                                .read(dateRangeProvider.notifier)
                                .updateToDate(selectedDate);
                          }),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            _defaultFetchCreditNote(); // fetch func
                          },
                          child: Container(
                            height: 36.h,
                            width: 41.w,
                            decoration: BoxDecoration(
                                color: AppUtils.isDarkMode(context)
                                    ? context.colorScheme.surfaceBright
                                    : context
                                        .colorScheme.surfaceContainerLowest,
                                border: Border.all(
                                    color: context.colorScheme.outline
                                        .withValues(alpha: 0.5)),
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: SvgIcon(
                              icon: Assets.icons.search,
                              color: AppUtils.isDarkMode(context)
                                  ? context.primaryColor
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
      ),
    );
  }

  Widget _popupItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
      child: Text(text),
    );
  }

  Widget _buildSearchAndFiler(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 16.0, bottom: 16.0, right: 8.0),
            child: ValueListenableBuilder<bool>(
                valueListenable: isSearchNotEmpty,
                builder: (_, hasText, __) => TextInputFormField(
                      controller: widget.searchController,
                      height: 36.h,
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
                          color:
                              context.defaultTextColor.withValues(alpha: 0.32)),
                      onChanged: (value) {
                        ref
                            .read(creditNoteNotifierProvider.notifier)
                            .searchCreditNote(value);
                      }, // CreditNote Notifier provider and search creditNote
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
                                  size: 29,
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            )
                          : null,
                    )),
          ),
        ),
        if (widget.config.showFilterButton)
          Container(
            padding: const EdgeInsets.all(5),
            child: FilterWidget(onTap: () => _buidlFilterBottomSheet(context)),
          )
      ],
    );
  }
}
