import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/debit_note/presentation/providers/debit_note_cart/debit_note_cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/supplier_address_info.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/supplier_details_card.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/supplier_info_tab_content.dart';
import 'package:easy_vat_v2/app/features/supplier/domain/entities/supplier_entity.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/providers/supplier_notifier.dart';
import 'package:easy_vat_v2/app/features/supplier/presentation/providers/supplier_state.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/refresh_button.dart';
import 'package:easy_vat_v2/app/features/widgets/search_debouncer.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DebitNoteSupplierInfoWidget extends ConsumerStatefulWidget {
  const DebitNoteSupplierInfoWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DebitNoteSupplierInfoWidgetState();
}

class _DebitNoteSupplierInfoWidgetState
    extends ConsumerState<DebitNoteSupplierInfoWidget> {
  final _searchController = TextEditingController();
  final _expansionNotifier = ValueNotifier<int?>(null);
  final TextEditingController billingAddressController =
      TextEditingController();
  final searchDebouncer = SearchDebouncer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchAndSelectSupplier();
    });
  }

  Future<void> _fetchAndSelectSupplier() async {
    final selectedSupplier = ref.read(debitNoteCartProvider).selectedSupplier;
    if (selectedSupplier != null) {
      ref.read(debitNoteCartProvider).selectedSupplier?.billingAddress ?? "";
    } else {
      final cashSupplier = SupplierEntity(ledgerName: "Cash", isActive: true);
      ref.read(debitNoteCartProvider.notifier).setSupplier(cashSupplier);
    }
    await ref.read(supplierNotfierProvider.notifier).getSupplier();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSupplierTabView(context);
  }

  Widget _buildSupplierbottomSheet(
    BuildContext context,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final supplierState = ref.watch(supplierNotfierProvider);
        return Container(
          height: 1.sh,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: context.surfaceColor,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextInputFormField(
                      controller: _searchController,
                      prefixIcon: const Icon(Icons.search_rounded),
                      hint: AppStrings.search,
                      height: 36.h,
                      fillColor: AppUtils.isDarkMode(context)
                          ? Theme.of(context).scaffoldBackgroundColor
                          : null,
                      onChanged: (value) {
                        searchDebouncer.run(() {
                          if (value.isEmpty) {
                            ref
                                .read(supplierNotfierProvider.notifier)
                                .getSupplier();
                          } else if (value.length > 3) {
                            ref
                                .read(supplierNotfierProvider.notifier)
                                .searchSupplier(searchQuery: value);
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  RefreshButton(
                    onTap: () {
                      _searchController.text = "";
                      ref.read(supplierNotfierProvider.notifier).getSupplier();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              if (supplierState.status == SupplierStateStatus.success)
                Expanded(
                  child: ValueListenableBuilder<int?>(
                    valueListenable: _expansionNotifier,
                    builder: (_, expandedIndex, __) => ListView.separated(
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: supplierState.supplierList?.length ?? 0,
                      itemBuilder: (_, index) {
                        final supplier = supplierState.supplierList![index];
                        return InkWell(
                          onTap: () {},
                          child: _buildSupplierCard(
                              index, expandedIndex, supplier),
                        );
                      },
                    ),
                  ),
                )
              else if (supplierState.status == SupplierStateStatus.failure)
                Center(
                  child: Text(
                      supplierState.errorMessage ?? AppStrings.noDataIsFound),
                )
              else if (supplierState.status == SupplierStateStatus.loading)
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              if (supplierState.status == SupplierStateStatus.loading) Spacer(),
              Container(
                height: 67,
                width: double.infinity,
                color: AppUtils.isDarkMode(context)
                    ? context.surfaceColor
                    : context.colorScheme.surfaceContainerLowest,
                child: Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        onPressed: () {},
                        label: context.translate(AppStrings.addSupplier),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgIcon(
                              icon: Assets.icons.supplier,
                              color: AppUtils.isDarkMode(context)
                                  ? context.defaultTextColor
                                  : null,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              context.translate(AppStrings.addSupplier),
                              style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppUtils.isDarkMode(context)
                                      ? context.defaultTextColor
                                      : context.colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Expanded(
                        child: ValueListenableBuilder(
                            valueListenable: _expansionNotifier,
                            builder: (context, int? value, child) {
                              return PrimaryButton(
                                  label: context.translate(AppStrings.submit),
                                  bgColor: context.colorScheme.primary,
                                  onPressed: value != null
                                      ? () {
                                          if (supplierState
                                                  .supplierList?.isNotEmpty ==
                                              true) {
                                            final selectedSupplier =
                                                supplierState.supplierList![
                                                    _expansionNotifier.value!];
                                            ref
                                                .read(debitNoteCartProvider
                                                    .notifier)
                                                .setSupplier(selectedSupplier);
                                            context.router.popForced();
                                          }
                                        }
                                      : null);
                            }))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildSupplierCard(
      int index, int? expandedIndex, SupplierEntity supplier) {
    final isExpanded = expandedIndex == index;
    return InkWell(
      onTap: () => _expansionNotifier.value = isExpanded ? null : index,
      child: SupplierDetailsCard(isExpanded: isExpanded, supplier: supplier),
    );
  }

  Widget _buildSupplierTabView(BuildContext context) {
    final selectedSupplier = ref.watch(debitNoteCartProvider).selectedSupplier;
    return DefaultTabController(
        length: 2,
        child: Container(
          height: 185.h,
          decoration: BoxDecoration(
              border: Border.all(
                  color: context.colorScheme.outline.withValues(alpha: 0.5)),
              color: AppUtils.isDarkMode(context)
                  ? context.colorScheme.tertiaryContainer
                  : const Color(0xFFFDFBFF),
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildTabBar(context),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              isScrollControlled: true,
                              backgroundColor: AppUtils.isDarkMode(context)
                                  ? context.colorScheme.tertiaryContainer
                                  : context.colorScheme.surfaceContainerLowest,
                              builder: (context) =>
                                  _buildSupplierbottomSheet(context))
                          .whenComplete(() {
                        _expansionNotifier.value = null;
                      });
                    },
                    child: SupplierInfoTabContent(
                      creditDays:
                          selectedSupplier?.creditDays?.toString() ?? "0",
                      creditLimit:
                          selectedSupplier?.creditLimit?.toStringAsFixed(2) ??
                              "0.0",
                      supplierName: selectedSupplier?.ledgerName ?? "",
                      outstandingAmount:
                          selectedSupplier?.creditLimit?.toStringAsFixed(2) ??
                              "0.0",
                      trn: selectedSupplier?.taxRegistrationNo ?? "",
                      isActive: selectedSupplier?.isActive ?? false,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: 200.h,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: Column(
                              children: [
                                CustomTextField(
                                  label: context.translate(
                                      AppStrings.enterBillingAddress),
                                  controller: billingAddressController,
                                  hint: context.translate(AppStrings.address),
                                  maxLines: 4,
                                  fillColor: AppUtils.isDarkMode(context)
                                      ? context.surfaceColor
                                      : null,
                                  validator: (value) {
                                    if (value?.isEmpty == true ||
                                        (value?.length ?? 0) < 5) {
                                      return "Please enter a valid adress";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  height: 40.h,
                                  width: double.infinity,
                                  child: PrimaryButton(
                                    label: context.translate(AppStrings.submit),
                                    onPressed: () async {
                                      if (selectedSupplier != null) {
                                        final updatedSupplier =
                                            selectedSupplier.copyWith(
                                                billingAddress:
                                                    billingAddressController
                                                        .text);
                                        ref
                                            .read(
                                                debitNoteCartProvider.notifier)
                                            .setSupplier(updatedSupplier);
                                        context.router.popForced();
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: context.translate(AppStrings
                                                .pleaseSelectASupplier));
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: SupplierAddressInfo(
                        address: selectedSupplier?.billingAddress ?? "",
                        hint: context.translate(AppStrings.address),
                        label:
                            context.translate(AppStrings.enterBillingAddress)),
                  ),
                ]),
              ))
            ],
          ),
        ));
  }
}

Widget _buildTabBar(BuildContext context) {
  return TabBar(
    labelColor: AppUtils.isDarkMode(context)
        ? Color(0xFF8B62F1)
        : context.colorScheme.secondary,
    unselectedLabelColor: context.colorScheme.onSurface,
    indicatorColor: AppUtils.isDarkMode(context)
        ? Color(0xFF8B62F1)
        : context.colorScheme.secondary,
    dividerColor: Colors.transparent,
    padding: EdgeInsets.zero,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
          width: 2.0,
          color: AppUtils.isDarkMode(context)
              ? Color(0xFF8B62F1)
              : context.colorScheme.secondary),
    ),
    labelStyle: context.textTheme.bodySmall
        ?.copyWith(fontSize: 11, fontWeight: FontWeight.w600),
    tabAlignment: TabAlignment.fill,
    indicatorSize: TabBarIndicatorSize.label,
    labelPadding: EdgeInsets.zero,
    tabs: [
      Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(context.translate(AppStrings.info)),
      ),
      Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(context.translate(AppStrings.billing)),
      ),
    ],
  );
}
