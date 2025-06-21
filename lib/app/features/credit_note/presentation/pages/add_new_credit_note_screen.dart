import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/widgets/add_credit_footer_widget.dart';
import 'package:easy_vat_v2/app/features/credit_note/presentation/widgets/add_new_credit_note_form.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/amount_splitup_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewCreditNoteScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewCreditNoteScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewCreditNoteScreenState();
}

class _AddNewCreditNoteScreenState
    extends ConsumerState<AddNewCreditNoteScreen> {
  final creditNoteNoController = TextEditingController();
  final refNoController = TextEditingController();
  final soldByController = TextEditingController();
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
      appBar: _buidAppBar(),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddNewCreditNoteForm(
                  creditNoteNoController: creditNoteNoController,
                  refNoController: refNoController,
                  soldByController: soldByController,
                  paymentModeNotifier: paymentModeNotifier,
                  cashAccountNotifier: cashAccountNotifier),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                onChanged: (value) {}, // need to add
                hint: context.translate(AppStrings.writeNote),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddCreditFooterWidget(
          creditNoteNoController: creditNoteNoController,
          refNoController: refNoController,
          paymentModeNotifier: paymentModeNotifier,
          soldByController: soldByController),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
            onPressed: () => context.router.popForced(),
            icon: Icon(Icons.adaptive.arrow_back));
      }),
      title: Text(context.translate(AppStrings.addNewCreditNote)),
    );
  }
}
