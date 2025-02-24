import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/pos/presentation/widgets/pos_app_bar.dart';
import 'package:easy_vat_v2/app/features/pos/presentation/widgets/transaction_card.dart';
import 'package:easy_vat_v2/app/features/pos/presentation/widgets/transaction_slidable_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage()
class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PosAppBar(searchController: _searchTextController),
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: ListView.separated(
            itemBuilder: (context, index) => Slidable(
                  endActionPane: ActionPane(
                    extentRatio: .15,
                    motion: ScrollMotion(),
                    children: [TransactionSlidableActionWidget()],
                  ),
                  child: TransactionCard(
                    salesOrderNumber: dummySalesOrders[index].salesOrderNumber,
                    salesDate: dummySalesOrders[index].salesDate,
                    customerName: dummySalesOrders[index].customerName,
                    soldBy: dummySalesOrders[index].soldBy,
                    netTotal: dummySalesOrders[index].netTotal,
                    status: dummySalesOrders[index].status,
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 16.0,
                ),
            itemCount: dummySalesOrders.length),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: PrimaryButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                AppStrings.addNew,
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.white),
              )
            ],
          ),
        ),
      ),
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
