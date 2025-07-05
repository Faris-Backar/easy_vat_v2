import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/providers/dividend_cart/dividend_cart_provider.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/add_dividend_footer_widget.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/add_new_dividend_form.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/dividend_amount_widget.dart';
import 'package:easy_vat_v2/app/features/dividend/presentation/widgets/dividend_cart_list.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/capital_ledger/capital_ledger_notifier.dart';
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
  final noteController = TextEditingController();
  final issuedByController = TextEditingController();
  final ValueNotifier<String?> paymentModeNotifier = ValueNotifier(null);
  final ValueNotifier<String?> cashAccountNotifier = ValueNotifier(null);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(capitalLedgerNotifierProvider.notifier)
          .fetchCapitalLedgers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dividendCartProvider);
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
                AddNewDividendForm(
                    refNoController: refNoController,
                    issuedByController: issuedByController,
                    notesController: noteController,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: state.ledgerList == null || state.ledgerList!.isEmpty
                      ? _buildEmptyState(context)
                      : DividendCartList(ledgerList: state.ledgerList!),
                ),
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
                  controller: noteController,
                  maxLines: 5,
                  hint: context.translate(AppStrings.writeNote),
                  onChanged: (value) =>
                      ref.watch(dividendCartProvider.notifier).setNotes(value),
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
      ),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      leading: Consumer(builder: (context, ref, child) {
        return IconButton(
            onPressed: () async {
              final ledgerList = ref.read(dividendCartProvider).ledgerList;

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
                              onPressed: () => Navigator.of(context).pop(true),
                              child:
                                  Text(context.translate(AppStrings.discard)),
                            ),
                          ],
                        ));
                if (shouldExit == true) {
                  ref.read(dividendCartProvider.notifier).clearDividendCart();
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
      title: Text(context.translate(AppStrings.addNewDividend)),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final ledgerList = ref.read(dividendCartProvider).ledgerList;

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
        ref.read(dividendCartProvider.notifier).clearDividendCart();
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center();
  }
}
