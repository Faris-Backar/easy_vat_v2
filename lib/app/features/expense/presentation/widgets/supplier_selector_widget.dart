import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/supplier_details_card.dart';
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

class SupplierSelectorWidget extends ConsumerStatefulWidget {
  const SupplierSelectorWidget({super.key});

  @override
  ConsumerState<SupplierSelectorWidget> createState() =>
      _SupplierSelectorState();
}

class _SupplierSelectorState extends ConsumerState<SupplierSelectorWidget> {
  final ValueNotifier<int?> _expansionNotifier = ValueNotifier(null);
  final TextEditingController _searchController = TextEditingController();
  final SearchDebouncer searchDebouncer = SearchDebouncer();

  @override
  Widget build(BuildContext context) {
    final selectedSupplier =
        ref.watch(cartProvider.select((state) => state.selectedSupplier));

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            backgroundColor: Colors.transparent,
            builder: (context) => _buildSupplierBottomSheet(context));
      },
      child: IgnorePointer(
        child: CustomTextField(
          label: context.translate(AppStrings.supplier),
          controller: TextEditingController(
              text: selectedSupplier?.ledgerName ??
                  context.translate(AppStrings.supplier)),
          suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
          hint: context.translate(AppStrings.supplier),
          height: 36.h,
          fillColor: AppUtils.isDarkMode(context)
              ? Theme.of(context).scaffoldBackgroundColor
              : null,
        ),
      ),
    );
  }

  Widget _buildSupplierBottomSheet(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
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
                IconButton(
                    onPressed: () => context.maybePop(),
                    icon: Icon(Icons.adaptive.arrow_back)),
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
                )),
                SizedBox(
                  width: 5.w,
                ),
                RefreshButton(onTap: () {
                  _searchController.text = "";
                  ref.read(supplierNotfierProvider.notifier).getSupplier();
                })
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
                              final supplier =
                                  supplierState.supplierList![index];
                              return InkWell(
                                onTap: () {
                                  _expansionNotifier.value =
                                      expandedIndex == index ? null : index;
                                },
                                child: SupplierDetailsCard(
                                    isExpanded: expandedIndex == index,
                                    supplier: supplier),
                              );
                            },
                          )))
            else if (supplierState.status == SupplierStateStatus.failure)
              Center(
                child: Text(
                    supplierState.errorMessage ?? AppStrings.noDataIsFound),
              )
            else if (supplierState.status == SupplierStateStatus.loading)
              Expanded(
                  child: Center(
                child: CircularProgressIndicator.adaptive(),
              )),
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
                  )),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                      child: ValueListenableBuilder<int?>(
                          valueListenable: _expansionNotifier,
                          builder: (_, selectedIndex, __) {
                            return PrimaryButton(
                                label: context.translate(AppStrings.submit),
                                bgColor: context.colorScheme.primary,
                                onPressed: selectedIndex != null
                                    ? () {
                                        final selectedSupplier = supplierState
                                            .supplierList![selectedIndex];
                                        ref
                                            .read(cartProvider.notifier)
                                            .setSupplier(selectedSupplier);
                                        context.router.popForced();
                                      }
                                    : null);
                          }))
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
