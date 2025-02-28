import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/features/customer/domain/entities/customer_entity.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_notifier.dart';
import 'package:easy_vat_v2/app/features/customer/presentation/providers/customer_state.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/create_sales_inovice/create_sales_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/customer_address_info.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/customer_info_tab_content.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';

class CustomerInfoWidget extends ConsumerStatefulWidget {
  const CustomerInfoWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomerInfoWidgetState();
}

class _CustomerInfoWidgetState extends ConsumerState<CustomerInfoWidget> {
  final _searchController = TextEditingController();
  final _expansionNotifier = ValueNotifier<int?>(null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ref.read(customerNotifierProvider.notifier).getCustomer();
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          isScrollControlled: true,
          backgroundColor: context.colorScheme.surfaceContainerLowest,
          builder: (context) => Consumer(builder: (context, ref, child) {
            final state = ref.watch(customerNotifierProvider);
            return _buildCustomerBottomSheet(context, state);
          }),
        ).whenComplete(() {
          _expansionNotifier.value = null;
        });
      },
      child: _buildCustomerTabView(context),
    );
  }

  Widget _buildCustomerBottomSheet(BuildContext context, CustomerState state) {
    return Container(
      height: 1.sh,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          SizedBox(height: 5.h),
          TextInputFormField(
            controller: _searchController,
            prefixIcon: const Icon(Icons.search_rounded),
            hint: AppStrings.search,
            height: 36.h,
          ),
          SizedBox(height: 16.h),
          if (state.status == CustomerStateStatus.success)
            Expanded(
              child: ValueListenableBuilder<int?>(
                valueListenable: _expansionNotifier,
                builder: (_, expandedIndex, __) => ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemCount: state.customerList?.length ?? 0,
                  itemBuilder: (_, index) => InkWell(
                      onTap: () {},
                      child: _buildCustomerCard(
                          index, expandedIndex, state.customerList![index])),
                ),
              ),
            )
          else if (state.status == CustomerStateStatus.failure)
            Center(child: Text(state.errorMessage ?? AppStrings.noDataIsFound))
          else if (state.status == CustomerStateStatus.loading)
            Expanded(
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          if (state.status == CustomerStateStatus.loading) Spacer(),
          Container(
            height: 67,
            width: double.infinity,
            color: context.colorScheme.surfaceContainerLowest,
            child: Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    onPressed: () {},
                    label: AppStrings.addCustomer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(icon: Assets.icons.customer),
                        SizedBox(width: 6.w),
                        Text(
                          AppStrings.addCustomer,
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.colorScheme.primary),
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
                          onPressed: value != null
                              ? () {
                                  if (state.customerList?.isNotEmpty == true) {
                                    ref
                                        .read(createSalesNotifierProvider
                                            .notifier)
                                        .setCustomer(state.customerList![
                                            _expansionNotifier.value!]);
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
  }

  Widget _buildCustomerCard(
      int index, int? expandedIndex, CustomerEntity customer) {
    final isExpanded = expandedIndex == index;
    return InkWell(
      onTap: () => _expansionNotifier.value = isExpanded ? null : index,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isExpanded ? 190.h : 89.h,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isExpanded
                ? context.colorScheme.secondary
                : context.colorScheme.outline.withValues(alpha: 0.5),
          ),
          color: const Color(0xFFF9F9F9),
        ),
        child: Column(
          children: [
            _buildHeaderRow(customer.ledgerName ?? "-"),
            const SizedBox(height: 10),
            _buildDetailsRow([
              _buildCustomerDetail(AppStrings.outstanding,
                  customer.openingBalance?.toStringAsFixed(2) ?? "-"),
              _buildCustomerDetail(AppStrings.creditLimit,
                  customer.creditLimit?.toStringAsFixed(2) ?? "0.0"),
              _buildCustomerDetail(AppStrings.creditDays,
                  customer.creditDays?.toString() ?? "0"),
              _buildCustomerDetail(AppStrings.status, customer.nature ?? "-"),
            ]),
            if (isExpanded) ...[
              const SizedBox(height: 12),
              _buildDetailsRow([
                _buildCustomerDetail(
                    AppStrings.address, customer.billingAddress ?? "-"),
                _buildCustomerDetail(
                    AppStrings.phoneNumber, customer.phone ?? "-"),
              ]),
              const SizedBox(height: 12),
              _buildDetailsRow([
                _buildCustomerDetail(
                    AppStrings.trn, customer.taxRegistrationNo ?? "-"),
                const SizedBox.shrink(),
              ]),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
        const Icon(Icons.keyboard_arrow_down_rounded),
      ],
    );
  }

  Widget _buildDetailsRow(List<Widget> children) {
    return Row(
        children: children.map((child) => Expanded(child: child)).toList());
  }

  Widget _buildCustomerDetail(String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: context.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colorScheme.outline)),
        const SizedBox(height: 5),
        Text(content,
            style: context.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildCustomerTabView(BuildContext context) {
    final selectedCustomer =
        ref.watch(createSalesNotifierProvider).selectedCustomer;
    return DefaultTabController(
      length: 3,
      child: Container(
        height: 185.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: context.colorScheme.outline.withValues(alpha: 0.5)),
          color: const Color(0xFFFDFBFF),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            _buildTabBar(context),
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
                        trn: selectedCustomer?.taxRegistrationNo ?? ""),
                    CustomerAddressInfo(
                        address: selectedCustomer?.billingAddress ?? "-"),
                    CustomerAddressInfo(
                        address: selectedCustomer?.billingAddress ?? "-"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      labelColor: context.colorScheme.secondary,
      unselectedLabelColor: context.colorScheme.onSurface,
      indicatorColor: context.colorScheme.secondary,
      dividerColor: Colors.transparent,
      labelStyle: context.textTheme.bodySmall
          ?.copyWith(fontSize: 11, fontWeight: FontWeight.w600),
      tabAlignment: TabAlignment.fill,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.zero,
      tabs: const [
        Tab(text: AppStrings.info),
        Tab(text: AppStrings.billing),
        Tab(text: AppStrings.shipping),
      ],
    );
  }
}

class CustomerData {
  final String name,
      creditLimit,
      creditDays,
      status,
      address,
      phoneNumber,
      outStanding;

  const CustomerData({
    required this.name,
    required this.creditLimit,
    required this.creditDays,
    required this.status,
    required this.address,
    required this.phoneNumber,
    required this.outStanding,
  });
}

final List<CustomerData> dummyCustomers = [
  const CustomerData(
      name: "David Elson",
      creditLimit: "1000.00",
      creditDays: "4D",
      status: "Overdue",
      address: "1406 Mattson Street, Astoria, OR 97103",
      phoneNumber: "+91 9876543210",
      outStanding: "1000.00"),
  const CustomerData(
      name: "Alice Johnson",
      creditLimit: "800.00",
      creditDays: "5D",
      status: "Good",
      address: "221B Baker Street, London",
      phoneNumber: "+44 123456789",
      outStanding: "100.00"),
  const CustomerData(
      name: "John Doe",
      creditLimit: "1500.00",
      creditDays: "7D",
      status: "Pending",
      address: "742 Evergreen Terrace, Springfield",
      phoneNumber: "+1 9876543210",
      outStanding: "3500.00"),
  const CustomerData(
      name: "Emma Watson",
      creditLimit: "500.00",
      creditDays: "3D",
      status: "Clear",
      address: "12 Privet Drive, Little Whinging",
      phoneNumber: "+44 987654321",
      outStanding: "4500.00"),
  const CustomerData(
      name: "Michael Smith",
      creditLimit: "2000.00",
      creditDays: "10D",
      status: "Overdue",
      address: "1600 Pennsylvania Avenue, Washington DC",
      phoneNumber: "+1 2024561111",
      outStanding: "4512.00"),
  const CustomerData(
      name: "David Elson",
      creditLimit: "1000.00",
      creditDays: "4D",
      status: "Overdue",
      address: "1406 Mattson Street, Astoria, OR 97103",
      phoneNumber: "+91 9876543210",
      outStanding: "1000.00"),
  const CustomerData(
      name: "Alice Johnson",
      creditLimit: "800.00",
      creditDays: "5D",
      status: "Good",
      address: "221B Baker Street, London",
      phoneNumber: "+44 123456789",
      outStanding: "100.00"),
  const CustomerData(
      name: "John Doe",
      creditLimit: "1500.00",
      creditDays: "7D",
      status: "Pending",
      address: "742 Evergreen Terrace, Springfield",
      phoneNumber: "+1 9876543210",
      outStanding: "3500.00"),
  const CustomerData(
      name: "Emma Watson",
      creditLimit: "500.00",
      creditDays: "3D",
      status: "Clear",
      address: "12 Privet Drive, Little Whinging",
      phoneNumber: "+44 987654321",
      outStanding: "4500.00"),
  const CustomerData(
      name: "Michael Smith",
      creditLimit: "2000.00",
      creditDays: "10D",
      status: "Overdue",
      address: "1600 Pennsylvania Avenue, Washington DC",
      phoneNumber: "+1 2024561111",
      outStanding: "4512.00"),
];
