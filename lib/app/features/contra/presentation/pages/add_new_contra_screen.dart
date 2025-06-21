import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/add_contra_footer_widget.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/add_new_contra_form.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/widgets/debit_credit_amount_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewContraScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewContraScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewContraScreenState();
}

class _AddNewContraScreenState extends ConsumerState<AddNewContraScreen> {
  final contraNoController = TextEditingController();
  final refNoController = TextEditingController();
  final descriptionController = TextEditingController();
  final noteController = TextEditingController();
  final ValueNotifier<String?> entryModeNotifier = ValueNotifier(null);
  @override
  void initState() {
    super.initState();
    entryModeNotifier.value = "Single Entry";
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
              AddNewContraForm(
                  contraNoController: contraNoController,
                  refNoController: refNoController,
                  descriptionController: descriptionController,
                  entryModeNotifier: entryModeNotifier),
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
                height: 16.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 0.5.sw,
                  child: DebitCreditAmountWidget(
                      entryModeNotifier: entryModeNotifier),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              CustomTextField(
                label: context.translate(AppStrings.note),
                controller: noteController,
                maxLines: 5,
                onChanged: (value) {},
                hint: context.translate(AppStrings.writeNote),
              ),
              SizedBox(
                height: 16.0,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddContraFooterWidget(
          contraNoController: contraNoController,
          refNoController: refNoController,
          descriptionController: descriptionController),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
            onPressed: () => context.router.popForced(),
            icon: Icon(Icons.adaptive.arrow_back));
      }),
      title: Text(context.translate(AppStrings.addNewContra)),
    );
  }
}
