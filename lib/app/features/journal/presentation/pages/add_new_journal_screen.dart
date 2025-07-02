//import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/providers/journal_cart/journal_cart_provider.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/widgets/add_journal_footer_widget.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/widgets/add_new_journal_form.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/widgets/debit_credit_amount_widget.dart';
import 'package:easy_vat_v2/app/features/journal/presentation/widgets/journal_cart_list.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/all_ledgers/all_ledgers_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewJournalScreen extends ConsumerStatefulWidget {
  final String? title;
  const AddNewJournalScreen({super.key, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewJournalScreenState();
}

class _AddNewJournalScreenState extends ConsumerState<AddNewJournalScreen> {
  final journalNoController = TextEditingController();
  final refNoController = TextEditingController();
  final descriptionController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(allLedgerNotifierProvider.notifier).fetchAllLedgers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(journalCartProvider);
    return Scaffold(
      appBar: _buidAppBar(),
      backgroundColor: context.surfaceColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddNewJournalForm(
                journalNoController: journalNoController,
                refNoController: refNoController,
                descriptionController: descriptionController,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: state.ledgerList == null || state.ledgerList!.isEmpty
                    ? _buildEmptyState(context)
                    : JournalCartList(
                        ledgerList: state.ledgerList!,
                      ),
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 0.5.sw,
                  child: DebitCreditAmountWidget(
                    debitTotal: 0.0,
                    creditTotal: 0.0,
                    totalAmount: 0.0,
                  ),
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
                controller: noteController,
                maxLines: 5,
                onChanged: (value) =>
                    ref.read(journalCartProvider.notifier).setNotes(value),
                hint: context.translate(AppStrings.writeNote),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddJournalFooterWidget(
          journalNoController: journalNoController,
          refNoController: refNoController,
          descriptionController: descriptionController),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
          onPressed: () async {
            final ledgerList = ref.read(journalCartProvider).ledgerList;

            if (ledgerList != null && ledgerList.isNotEmpty) {
              final shouldExit = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title:
                            Text(context.translate(AppStrings.discardChanges)),
                        content: Text(context
                            .translate(AppStrings.discardledgerChangesMessage)),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child:
                                  Text(context.translate(AppStrings.cancel))),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child:
                                  Text(context.translate(AppStrings.discard)))
                        ],
                      ));
              if (shouldExit == true) {
                ref.read(journalCartProvider.notifier).clearJournalCart();

                if (mounted) {
                  context.router.popForced();
                }
              }
            } else {
              context.router.popForced();
            }
          },
          icon: Icon(Icons.adaptive.arrow_back),
        );
      }),
      title: Text(context.translate(AppStrings.addNewJournal)),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center();
  }
}
