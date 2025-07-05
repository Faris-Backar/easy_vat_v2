import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
//import 'package:easy_vat_v2/app/core/routes/app_router.dart';
//import 'package:easy_vat_v2/app/features/cart/presentation/providers/cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense_cart/expense_cart_provider.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/add_expense_footer_widget.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/add_new_expense_form.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/amount_splitup_widget.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/widgets/expense_cart_list.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/expense_ledger/expense_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/custom_text_field.dart';
//import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
//import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddNewExpenseScreen extends ConsumerStatefulWidget {
  final String? tittle;
  const AddNewExpenseScreen({super.key, this.tittle});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewExpenseScreenState();
}

class _AddNewExpenseScreenState extends ConsumerState<AddNewExpenseScreen> {
  final expenseNoController = TextEditingController();
  final refNoController = TextEditingController();
  final _noteController = TextEditingController();
  final supplierInvNoController = TextEditingController();
  final purchasedByController = TextEditingController();
  final ValueNotifier<String?> paymentModeNotifier = ValueNotifier(null);
  final ValueNotifier<String?> cashAccountNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(expenseLedgerNotifierProvider.notifier)
          .fetchExpenseLedgers();
    });
  }

  void _handleSwipeToNext() {
    // context.router.pushNamed(AppRouter.cart);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(expenseCartProvider);
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
        appBar: _buildAppBar(),
        backgroundColor: context.surfaceColor,
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! < -100) {
              _handleSwipeToNext();
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AddNewExpenseForm(
                    expenseNoController: expenseNoController,
                    refNoController: refNoController,
                    purchasedByController: purchasedByController,
                    paymentModeNotifier: paymentModeNotifier,
                    cashAccountNotifier: cashAccountNotifier,
                    notesController: _noteController,
                    supplierInvNoController: supplierInvNoController,
                  ), //AddNewExpenseForm
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
                        : ExpenseCartList(ledgerList: state.ledgerList!),
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
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    label: context.translate(AppStrings.note),
                    controller: _noteController,
                    maxLines: 5,
                    onChanged: (value) =>
                        ref.read(expenseCartProvider.notifier).setNotes(value),
                    hint: context.translate(AppStrings.writeNote),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AddExpenseFooterWidget(
          expenseNoController: expenseNoController,
          refNoController: refNoController,
          paymentModeNotifier: paymentModeNotifier,
          purchasedByController: purchasedByController,
          supInvNoController: supplierInvNoController,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Consumer(
        builder: (context, ref, child) {
          return IconButton(
              onPressed: () async {
                final ledgerList = ref.read(expenseCartProvider).ledgerList;
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
                                  child: Text(
                                      context.translate(AppStrings.cancel))),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text(
                                      context.translate(AppStrings.discard)))
                            ],
                          ));
                  if (shouldExit == true) {
                    ref.read(expenseCartProvider.notifier).clearExpenseCart();
                    if (mounted) {
                      context.router.popForced();
                    }
                  }
                } else {
                  context.router.popForced();
                }
              },
              icon: Icon(Icons.adaptive.arrow_back));
        },
      ),
      title: Text(context.translate(AppStrings.addNewExpense)),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center();
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final ledgerList = ref.read(expenseCartProvider).ledgerList;

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
        ref.read(expenseCartProvider.notifier).clearExpenseCart();
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
}
