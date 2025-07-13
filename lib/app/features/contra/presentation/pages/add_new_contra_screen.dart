import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/providers/contra_cart/contra_cart_provider.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/add_contra_footer_widget.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/add_new_contra_form.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/contra_amount_splitup_widget.dart';
import 'package:easy_vat_v2/app/features/contra/presentation/widgets/contra_cart_list.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_bank_ledgers/cash_bank_ledger_notfier.dart';
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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(cashBankLedgerNotifierProvider.notifier)
          .fetchCashBankLedgers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contraCartProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (!didPop) {
          bool shouldExit = await _onWillPop(context);
          if (shouldExit) {
            context.router.popForced();
          }
        }
      },
      child: Scaffold(
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
                  notesController: noteController,
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
                      : ContraCartList(ledgerList: state.ledgerList!),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 0.5.sw,
                    child: ContraAmountSplitupWidget(
                      debitTotal: 0.0,
                      creditTotal: 0.0,
                      totalAmount: 0.0,
                    ),
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
                  onChanged: (value) =>
                      ref.read(contraCartProvider.notifier).setNotes(value),
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
      ),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
            onPressed: () async {
              final ledgerList = ref.read(contraCartProvider).ledgerList;

              if (ledgerList != null && ledgerList.isNotEmpty) {
                final shouldExit = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                              context.translate(AppStrings.discardChanges)),
                          content: Text(context.translate(
                              AppStrings.discardledgerChangesMessage)),
                          actions: [
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child:
                                    Text(context.translate(AppStrings.cancel))),
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child:
                                    Text(context.translate(AppStrings.discard)))
                          ],
                        ));
                if (shouldExit == true) {
                  ref.read(contraCartProvider.notifier).clearContraCart();

                  if (mounted) {
                    context.router.popForced();
                  }
                }
              } else {
                context.router.popForced();
              }
            },
            icon: Icon(Icons.adaptive.arrow_back));
      }),
      title: Text(context.translate(AppStrings.addNewContra)),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center();
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final ledgerList = ref.read(contraCartProvider).ledgerList;

    if (ledgerList != null && ledgerList.isNotEmpty) {
      final shouldExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  context.translate(AppStrings.discardChanges),
                ),
                content: Text(
                    context.translate(AppStrings.discardledgerChangesMessage)),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(context.translate(AppStrings.cancel)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(context.translate(AppStrings.discard)),
                  )
                ],
              ));
      if (shouldExit == true) {
        ref.read(contraCartProvider.notifier).clearContraCart();
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
}
