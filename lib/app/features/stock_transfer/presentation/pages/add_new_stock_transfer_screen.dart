import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/features/sales/presentation/widgets/rate_splitup_widget.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/add_new_stock_transfer_form.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/add_stock_transfer_widgert.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewStockTransferScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewStockTransferScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewStockTransferScreenState();
}

class _AddNewStockTransferScreenState
    extends ConsumerState<AddNewStockTransferScreen> {
  final stockTransferNoController = TextEditingController();
  final refNoController = TextEditingController();
  final noteController = TextEditingController();
  final ValueNotifier<String?> fromStoreNotifier = ValueNotifier(null);
  final ValueNotifier<String?> toStoreNotifier = ValueNotifier(null);
  @override
  void initState() {
    super.initState();
  }

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
              AddNewStockTransferForm(
                  stockTransferNoController: stockTransferNoController,
                  refNoController: refNoController,
                  fromStoreNotifier: fromStoreNotifier,
                  toStoreNotifier: toStoreNotifier),
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
                label: context.translate(AppStrings.note),
                controller: noteController,
                maxLines: 5,
                onChanged: (value) {},
                hint: context.translate(AppStrings.writeNote),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddStockTransferWidgert(
          stockTransferNoController: stockTransferNoController,
          refNoController: refNoController,
          fromStoreNotifier: fromStoreNotifier,
          toStoreNotifier: toStoreNotifier),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Consumer(
        builder: (context, ref, child) {
          return IconButton(
              onPressed: () => context.router.popForced(),
              icon: Icon(Icons.adaptive.arrow_back));
        },
      ),
      title: Text(context.translate(AppStrings.addNewStockTransfer)),
      actions: [
        Consumer(builder: (context, ref, child) {
          return IconButton(
              onPressed: () => context.router.pushNamed(AppRouter.cart),
              icon: Badge.count(
                backgroundColor: CustomColors.inActiveRedColor(context),
                textColor: Colors.white,
                count: 0,
                child: SvgIcon(
                  icon: Assets.icons.cart,
                  color: context.defaultTextColor,
                ),
              ));
        })
      ],
    );
  }
}
