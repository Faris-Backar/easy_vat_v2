import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/add_new_income_form.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/amount_splitup_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewIncomeScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewIncomeScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewIncomeScreenState();
}

class _AddNewIncomeScreenState extends ConsumerState<AddNewIncomeScreen> {
  final incomeNoController = TextEditingController();
  final refNoController = TextEditingController();
  final soldByContoller = TextEditingController();
  final _noteController = TextEditingController();
  final ValueNotifier<String?> paymentModeNotifier = ValueNotifier(null);
  final ValueNotifier<String?> cashAccountNotifier = ValueNotifier(null);
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
              AddNewIncomeForm(
                  incomeNoController: incomeNoController,
                  refNoController: refNoController,
                  paymentModeNotifier: paymentModeNotifier,
                  soldByController: soldByContoller,
                  cashAccountNotifier: cashAccountNotifier),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)
                  // IncomeCartList
                  ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 0.5.sw,
                  child: AmountSplitupWidget(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              CustomTextField(
                label: context.translate(AppStrings.note),
                controller: _noteController,
                maxLines: 5,
                //Onchanged
                hint: context.translate(AppStrings.writeNote),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
            onPressed: () => context.router.popForced(),
            icon: Icon(Icons.adaptive.arrow_back));
      }),
      title: Text(context.translate(AppStrings.addNewIncome)),
    );
  }
}
