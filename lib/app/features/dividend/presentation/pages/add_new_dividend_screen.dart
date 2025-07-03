import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/add_dividend_footer_widget.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/add_new_dividend_form.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/dividend_amount_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewDividendScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewDividendScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewDividendScreenState();
}

class _AddNewDividendScreenState extends ConsumerState<AddNewDividendScreen> {
  final dividendNoController = TextEditingController();
  final refNoController = TextEditingController();
  final _noteController = TextEditingController();
  final issuedByController = TextEditingController();
  final ValueNotifier<String?> paymentModeNotifier = ValueNotifier(null);
  final ValueNotifier<String?> cashAccountNotifier = ValueNotifier(null);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buidAppBar(),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddNewDividendForm(
                  refNoController: refNoController,
                  issuedByController: issuedByController,
                  notesController: _noteController,
                  paymentModeNotifier: paymentModeNotifier,
                  cashAccountNotifier: cashAccountNotifier,
                  dividendNoController: dividendNoController),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 0.5.sw,
                  child: DividendAmountWidget(),
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
                controller: _noteController,
                maxLines: 5,
                hint: context.translate(AppStrings.writeNote),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddDividendFooterWidget(
          dividendNoController: dividendNoController,
          refNoController: refNoController,
          issuedByController: issuedByController,
          paymentModeNotifier: paymentModeNotifier),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
            onPressed: () => context.router.popForced(),
            icon: Icon(Icons.adaptive.arrow_back));
      }),
      title: Text(context.translate(AppStrings.addNewDividend)),
    );
  }
}
