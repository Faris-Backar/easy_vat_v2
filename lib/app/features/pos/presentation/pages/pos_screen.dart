import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/features/pos/presentation/widgets/pos_app_bar.dart';
import 'package:easy_vat_v2/app/features/pos/presentation/widgets/transaction_card.dart';
import 'package:easy_vat_v2/app/features/pos/presentation/widgets/transaction_slidable_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';

@RoutePage()
class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  final _searchTextController = TextEditingController();
  final _saleNoTextController = TextEditingController();
  final _refNoTextController = TextEditingController();

  final ValueNotifier<String?> selectedSalesMode = ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedSoldBy = ValueNotifier<String?>(null);

  final List<String> salesModes = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4"
  ];
  final List<String> soldByOptions = ["Ajmal", "Zara", "Sam", "Mike", "Anna"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PosAppBar(searchController: _searchTextController),
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: ListView.builder(
          itemCount: dummySalesOrders.length,
          itemBuilder: (context, index) {
            final order = dummySalesOrders[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Slidable(
                endActionPane: const ActionPane(
                  extentRatio: .15,
                  motion: ScrollMotion(),
                  children: [TransactionSlidableActionWidget()],
                ),
                child: TransactionCard(
                  salesOrderNumber: order.salesOrderNumber,
                  salesDate: order.salesDate,
                  customerName: order.customerName,
                  soldBy: order.soldBy,
                  netTotal: order.netTotal,
                  status: order.status,
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: PrimaryButton(
          onPressed: () => _showFilterBottomSheet(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_circle_outline_rounded, color: Colors.white),
              SizedBox(width: 5.w),
              Text(
                AppStrings.addNew,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.filters,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  Text(
                    AppStrings.clearAll,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Divider(height: 0),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _saleNoTextController,
                      label: AppStrings.saleNo,
                      hint: AppStrings.enterSalesNumber,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomTextField(
                      controller: _refNoTextController,
                      label: AppStrings.refNo,
                      hint: AppStrings.enterInvoiceNumber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildDatePicker(context)),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildDropdown(context, AppStrings.salesMode,
                        selectedSalesMode, salesModes),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: _buildDropdown(
                    context, AppStrings.soldBy, selectedSoldBy, soldByOptions),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child:
                    PrimaryButton(label: AppStrings.filter, onPressed: () {}),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropdown(BuildContext context, String label,
      ValueNotifier<String?> valueNotifier, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        ValueListenableBuilder<String?>(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            return Container(
              height: 50,
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: context.colorScheme.outline.withValues(alpha: 0.4)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  value: value,
                  isExpanded: true,
                  hint: Text("Select an option",
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: context.colorScheme.outline)),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: context.textTheme.bodyMedium,
                        ));
                  }).toList(),
                  onChanged: (newValue) => valueNotifier.value = newValue,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.salesDate,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        InkWell(
          onTap: () async {
            DateTimeRange? pickedRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2010),
              lastDate: DateTime(2100),
              initialDateRange: DateTimeRange(
                start: DateTime.now().subtract(Duration(days: 7)),
                end: DateTime.now(),
              ),
            );

            if (pickedRange != null) {}
          },
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            height: 50,
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color:
                    context.colorScheme.outline.withAlpha((0.4 * 255).toInt()),
              ),
            ),
            child: Row(
              children: [
                SvgIcon(icon: Assets.icons.calendar),
                SizedBox(width: 3.w),
                Text(AppStrings.selectDate,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: context.colorScheme.outline)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SalesOrder {
  final String salesOrderNumber;
  final DateTime salesDate;
  final String customerName;
  final String soldBy;
  final double netTotal;
  final String status;

  SalesOrder({
    required this.salesOrderNumber,
    required this.salesDate,
    required this.customerName,
    required this.soldBy,
    required this.netTotal,
    required this.status,
  });
}

List<SalesOrder> dummySalesOrders = [
  SalesOrder(
    salesOrderNumber: "253651",
    salesDate: DateTime.now(),
    customerName: "Faris Backer",
    soldBy: "Ajmal",
    netTotal: 6530.00,
    status: AppStrings.unPaid,
  ),
  SalesOrder(
    salesOrderNumber: "253652",
    salesDate: DateTime.now(),
    customerName: "John Doe",
    soldBy: "Zara",
    netTotal: 3200.00,
    status: AppStrings.card,
  ),
  SalesOrder(
    salesOrderNumber: "253653",
    salesDate: DateTime.now(),
    customerName: "Alice Wonderland",
    soldBy: "Sam",
    netTotal: 4200.00,
    status: AppStrings.cash,
  ),
  SalesOrder(
    salesOrderNumber: "253654",
    salesDate: DateTime.now(),
    customerName: "Bob Marley",
    soldBy: "Mike",
    netTotal: 7800.00,
    status: AppStrings.bank,
  ),
  SalesOrder(
    salesOrderNumber: "253655",
    salesDate: DateTime.now(),
    customerName: "Eve Hunter",
    soldBy: "Anna",
    netTotal: 5000.00,
    status: AppStrings.credit,
  ),
  SalesOrder(
    salesOrderNumber: "253656",
    salesDate: DateTime.now(),
    customerName: "Tom Hardy",
    soldBy: "Zara",
    netTotal: 2500.00,
    status: AppStrings.card,
  ),
  SalesOrder(
    salesOrderNumber: "253657",
    salesDate: DateTime.now(),
    customerName: "Sarah Smith",
    soldBy: "John",
    netTotal: 6000.00,
    status: AppStrings.unPaid,
  ),
  SalesOrder(
    salesOrderNumber: "253658",
    salesDate: DateTime.now(),
    customerName: "Chris Hemsworth",
    soldBy: "Mia",
    netTotal: 8000.00,
    status: AppStrings.bank,
  ),
  SalesOrder(
    salesOrderNumber: "253659",
    salesDate: DateTime.now(),
    customerName: "Emma Watson",
    soldBy: "James",
    netTotal: 7200.00,
    status: AppStrings.cash,
  ),
  SalesOrder(
    salesOrderNumber: "253660",
    salesDate: DateTime.now(),
    customerName: "Jake Gyllenhaal",
    soldBy: "Lucas",
    netTotal: 5300.00,
    status: AppStrings.credit,
  ),
];
