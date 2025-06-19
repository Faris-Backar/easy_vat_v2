import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_notifier.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_state.dart';
import 'package:easy_vat_v2/app/features/income/presentation/providers/income_cart/income_cart_provider.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/customer_details_card.dart';
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

class CustomerSelectorWidget extends ConsumerStatefulWidget {
  const CustomerSelectorWidget({super.key});

  @override
  ConsumerState<CustomerSelectorWidget> createState() =>
      _CustomerSelectorState();
}

class _CustomerSelectorState extends ConsumerState<CustomerSelectorWidget> {
  final ValueNotifier<int?> _expansionNotifier = ValueNotifier(null);
  final TextEditingController _searchController = TextEditingController();
  final SearchDebouncer searchDebouncer = SearchDebouncer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(customerNotifierProvider.notifier).getCustomer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedCustomer =
        ref.watch(incomeCartProvider.select((state) => state.selectedCustomer));

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            backgroundColor: Colors.transparent,
            builder: (context) => _buildCustomerBottomSheet(context));
      },
      child: IgnorePointer(
        child: CustomTextField(
          label: context.translate(AppStrings.customer),
          controller: TextEditingController(
              text: selectedCustomer?.ledgerName ??
                  context.translate(AppStrings.customer)),
          suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
          hint: context.translate(AppStrings.customer),
          height: 36.h,
          fillColor: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiaryContainer
              : null,
        ),
      ),
    );
  }

  Widget _buildCustomerBottomSheet(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final customerState = ref.watch(customerNotifierProvider);

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
                      textInputAction: TextInputAction.done,
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
                                .read(customerNotifierProvider.notifier)
                                .getCustomer();
                          } else {
                            ref
                                .read(customerNotifierProvider.notifier)
                                .searchCustomer(searchQuery: value);
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
                      ref.read(customerNotifierProvider.notifier).getCustomer();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              if (customerState.status == CustomerStateStatus.success)
                Expanded(
                  child: ValueListenableBuilder<int?>(
                      valueListenable: _expansionNotifier,
                      builder: (_, expandedIndex, __) => ListView.separated(
                            separatorBuilder: (_, __) => const SizedBox(
                              height: 10,
                            ),
                            itemCount: customerState.customerList?.length ?? 0,
                            itemBuilder: (_, index) {
                              final customer =
                                  customerState.customerList![index];
                              return InkWell(
                                onTap: () {
                                  _expansionNotifier.value =
                                      expandedIndex == index ? null : index;
                                },
                                child: CustomerDetailsCard(
                                    isExpanded: expandedIndex == index,
                                    customer: customer),
                              );
                            },
                          )),
                )
              else if (customerState.status == CustomerStateStatus.failure)
                Center(
                  child: Text(
                      customerState.errorMessage ?? AppStrings.noDataIsFound),
                )
              else if (customerState.status == CustomerStateStatus.loading)
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              if (customerState.status == CustomerStateStatus.loading) Spacer(),
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
                        label: context.translate(AppStrings.addCustomer),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgIcon(
                              icon: Assets.icons.customer,
                              color: AppUtils.isDarkMode(context)
                                  ? context.defaultTextColor
                                  : null,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              context.translate(AppStrings.addCustomer),
                              style: context.textTheme.bodyMedium?.copyWith(
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
                          builder: (_, selectedIndex, __) {
                            return PrimaryButton(
                              label: context.translate(AppStrings.submit),
                              bgColor: context.colorScheme.primary,
                              onPressed: selectedIndex != null
                                  ? () {
                                      final selectedCustomer = customerState
                                          .customerList![selectedIndex];
                                      ref
                                          .read(incomeCartProvider.notifier)
                                          .setCustomer(selectedCustomer);
                                      context.router.popForced();
                                    }
                                  : null,
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
