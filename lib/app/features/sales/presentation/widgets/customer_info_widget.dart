import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_notifier.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_state.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/customer_details_card.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/refresh_button.dart';
import 'package:easy_vat_v2/app/features/widgets/search_debouncer.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/customer_address_info.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/customer_info_tab_content.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomerInfoWidget extends ConsumerStatefulWidget {
  const CustomerInfoWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomerInfoWidgetState();
}

class _CustomerInfoWidgetState extends ConsumerState<CustomerInfoWidget> {
  final _searchController = TextEditingController();
  final _expansionNotifier = ValueNotifier<int?>(null);
  final TextEditingController shippingAddressController =
      TextEditingController();
  final TextEditingController billingAddressController =
      TextEditingController();
  final searchDebouncer = SearchDebouncer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchAndSelectCustomer();
    });
  }

  Future<void> _fetchAndSelectCustomer() async {
    final cashCustomer = CustomerEntity(ledgerName: "Cash", isActive: true);
    ref.read(cartProvider.notifier).setCustomer(cashCustomer);
    await ref.read(customerNotifierProvider.notifier).getCustomer();
    billingAddressController.text =
        ref.read(cartProvider).selectedCustomer?.billingAddress ?? "";
    shippingAddressController.text =
        ref.read(cartProvider).selectedCustomer?.shippingAddress ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
                context: context,
                useSafeArea: true,
                isScrollControlled: true,
                backgroundColor: AppUtils.isDarkMode(context)
                    ? context.colorScheme.tertiaryContainer
                    : context.colorScheme.surfaceContainerLowest,
                builder: (context) => _buildCustomerBottomSheet(context))
            .whenComplete(() {
          _expansionNotifier.value = null;
        });
      },
      child: _buildCustomerTabView(context),
    );
  }

  Widget _buildCustomerBottomSheet(
    BuildContext context,
  ) {
    return Consumer(builder: (context, WidgetRef ref, child) {
      final customerState = ref.watch(customerNotifierProvider);
      return Container(
        height: 1.sh,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: context.surfaceColor,
        child: Column(
          children: [
            SizedBox(height: 5.h),
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
                              .read(customerNotifierProvider.notifier)
                              .getCustomer();
                        } else if (value.length > 3) {
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
                ),
              ],
            ),
            SizedBox(height: 16.h),
            if (customerState.status == CustomerStateStatus.success)
              Expanded(
                child: ValueListenableBuilder<int?>(
                  valueListenable: _expansionNotifier,
                  builder: (_, expandedIndex, __) => ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemCount: customerState.customerList?.length ?? 0,
                    itemBuilder: (_, index) {
                      final customer = customerState.customerList![index];
                      return InkWell(
                          onTap: () {},
                          child: _buildCustomerCard(
                              index, expandedIndex, customer));
                    },
                  ),
                ),
              )
            else if (customerState.status == CustomerStateStatus.failure)
              Center(
                  child: Text(
                      customerState.errorMessage ?? AppStrings.noDataIsFound))
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
                      label: AppStrings.addCustomer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgIcon(
                            icon: Assets.icons.customer,
                            color: AppUtils.isDarkMode(context)
                                ? context.defaultTextColor
                                : null,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            AppStrings.addCustomer,
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
                            label: AppStrings.submit,
                            bgColor: context.colorScheme.primary,
                            onPressed: value != null
                                ? () {
                                    if (customerState
                                            .customerList?.isNotEmpty ==
                                        true) {
                                      final selectedCustomer =
                                          customerState.customerList![
                                              _expansionNotifier.value!];
                                      ref
                                          .read(cartProvider.notifier)
                                          .setCustomer(selectedCustomer);
                                      context.router.popForced();
                                    }
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
    });
  }

  Widget _buildCustomerCard(
      int index, int? expandedIndex, CustomerEntity customer) {
    final isExpanded = expandedIndex == index;
    return InkWell(
        onTap: () => _expansionNotifier.value = isExpanded ? null : index,
        child: CustomerDetailsCard(isExpanded: isExpanded, customer: customer));
  }

  Widget _buildCustomerTabView(BuildContext context) {
    final selectedCustomer = ref.watch(cartProvider).selectedCustomer;
    return DefaultTabController(
      length: 3,
      child: Container(
        height: 185.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: context.colorScheme.outline.withValues(alpha: 0.5)),
          color: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiaryContainer
              : const Color(0xFFFDFBFF),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTabBar(context),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  children: [
                    CustomerInfoTabContent(
                      creditDays:
                          selectedCustomer?.creditDays?.toString() ?? "0",
                      creditLimit:
                          selectedCustomer?.creditLimit?.toStringAsFixed(2) ??
                              "0.0",
                      customerName: selectedCustomer?.ledgerName ?? "",
                      outstandingAmount:
                          selectedCustomer?.creditLimit?.toStringAsFixed(2) ??
                              "0.0",
                      trn: selectedCustomer?.taxRegistrationNo ?? "",
                      isActive: selectedCustomer?.isActive ?? false,
                    ),
                    CustomerAddressInfo(
                      address: selectedCustomer?.billingAddress ?? "-",
                      textEditingController: billingAddressController,
                      hint: AppStrings.address,
                      label: AppStrings.enterBillingAddress,
                      onSubmitted: () async {
                        if (selectedCustomer != null) {
                          final updatedCustomer = selectedCustomer.copyWith(
                              billingAddress: billingAddressController.text);
                          ref
                              .read(cartProvider.notifier)
                              .setCustomer(updatedCustomer);
                          context.router.popForced();
                        } else {
                          Fluttertoast.showToast(
                              msg: AppStrings.pleaseSelectACustomer);
                        }
                      },
                    ),
                    CustomerAddressInfo(
                      address: selectedCustomer?.shippingAddress ?? "-",
                      textEditingController: shippingAddressController,
                      hint: AppStrings.address,
                      label: AppStrings.enterShippingAddress,
                      onSubmitted: () {
                        if (selectedCustomer != null) {
                          final updatedCustomer = selectedCustomer.copyWith(
                              shippingAddress: shippingAddressController.text);
                          ref
                              .read(cartProvider.notifier)
                              .setCustomer(updatedCustomer);
                          context.router.popForced();
                        } else {
                          Fluttertoast.showToast(
                              msg: AppStrings.pleaseSelectACustomer);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
    tabs: const [
      Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(AppStrings.info),
      ),
      Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(AppStrings.billing),
      ),
      Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(AppStrings.shipping),
      )
    ],
  );
}
