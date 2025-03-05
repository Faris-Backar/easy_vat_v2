import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/providers/create_sales_inovice/create_sales_invoice_notifier.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/add_new_sales_form.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/add_sales_footer_widget.dart';
import 'package:easy_vat_v2/app/features/sales_invoice/presentation/widgets/rate_splitup_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewSalesScreen extends StatefulWidget {
  const AddNewSalesScreen({super.key});

  @override
  State<AddNewSalesScreen> createState() => _AddNewSalesScreenState();
}

class _AddNewSalesScreenState extends State<AddNewSalesScreen> {
  final saleNoController = TextEditingController();
  final refNoController = TextEditingController();
  final _noteController = TextEditingController();
  final ValueNotifier<String?> salesModeNotifier = ValueNotifier(null);
  final ValueNotifier<String?> soldByNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddNewSalesForm(
                  saleNoController: saleNoController,
                  refNoController: refNoController,
                  salesModeNotifier: salesModeNotifier,
                  soldByNotifier: soldByNotifier),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 0.5.sw,
                  child: RateSplitupWidget(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                label: AppStrings.note,
                controller: _noteController,
                maxLines: 5,
                hint: AppStrings.writeNote,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddSalesFooterWidget(
          saleNoController: saleNoController,
          refNoController: refNoController,
          salesModeNotifier: salesModeNotifier,
          soldByNotifier: soldByNotifier),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
          onPressed: () {
            ref.read(createSalesNotifierProvider.notifier).clearData();
            context.router.popForced();
          },
          icon: Icon(Icons.adaptive.arrow_back),
        );
      }),
      title: Text(AppStrings.addNewSales),
      actions: [
        Consumer(builder: (context, ref, child) {
          return IconButton(
            onPressed: () => context.router.pushNamed(AppRouter.cart),
            icon: Badge.count(
              backgroundColor: CustomColors.inActiveRedColor(context),
              textColor: context.defaultTextColor,
              count: ref.watch(cartProvider).itemList?.length ?? 0,
              child: SvgIcon(
                icon: Assets.icons.cart,
                color: context.defaultTextColor,
              ),
            ),
          );
        }),
      ],
    );
  }
}
