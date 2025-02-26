import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/add_sales_footer_widget.dart';

import 'package:flutter/material.dart';

@RoutePage()
class AddNewSalesScreen extends StatelessWidget {
  const AddNewSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Text(
          AppStrings.addNewSales,
          style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600, color: context.colorScheme.outline),
        ),
      ),
      bottomNavigationBar: AddSalesFooterWidget(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.addNewSales),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded),
        ),
      ],
    );
  }
}
