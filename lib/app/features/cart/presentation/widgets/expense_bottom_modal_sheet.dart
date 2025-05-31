import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
// import 'package:easy_vat_v2/app/features/ledger/domain/entities/ledger_account_entity.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/expense_ledger/expense_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/refresh_button.dart';
import 'package:easy_vat_v2/app/features/widgets/search_debouncer.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseBottomModalSheet extends ConsumerStatefulWidget {
  const ExpenseBottomModalSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpenseBottomModalSheetState();
}

class _ExpenseBottomModalSheetState
    extends ConsumerState<ExpenseBottomModalSheet> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<int?> expenseDetailsExpansionNotifier =
      ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    //final state =
    ref.watch(expenseLedgerNotifierProvider); // expense ledger provider
    return Container(
      height: 1.sh,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          _buildSearchField(context, ref),
          const SizedBox(
            height: 16.0,
          ),
          // Expanded(
          //     child: state.map(
          //         initial: (_) => const SizedBox.shrink(),
          //         loading: (_) => const Center(
          //               child: CircularProgressIndicator.adaptive(),
          //             ),
          //         loaded: (expenseList) => expenseList.expenseList.isEmpty
          //             ? Center(child: Text(context.translate(AppStrings.noDataIsFound)),)
          //             : _buildExpenseList()
          //         error: error)),
          _buildSubmitButton(context, ref),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, WidgetRef ref) {
    final searchDebouncer = SearchDebouncer();

    return Row(
      children: [
        IconButton(
            onPressed: () => context.router.popForced(),
            icon: Icon(Icons.adaptive.arrow_back)),
        Expanded(
          child: TextInputFormField(
            controller: searchController,
            maxLines: 1,
            textInputAction: TextInputAction.done,
            fillColor:
                AppUtils.isDarkMode(context) ? context.surfaceColor : null,
            onChanged: (value) {
              searchDebouncer.run(() {
                if (value.isEmpty) {
                  // fetch expense
                } else {
                  // search expense
                }
              });
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgIcon(icon: Assets.icons.search),
            ),
            suffixIcon: SizedBox(
              width: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: searchController.text.isNotEmpty
                          ? InkWell(
                              onTap: () => searchController.clear(),
                              child: Icon(Icons.close_rounded),
                            )
                          : const SizedBox.shrink())
                ],
              ),
            ),
            hint: AppStrings.search,
            height: 36.h,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        RefreshButton(onTap: () {
          searchController.text = "";
          // fetch expense
        })
      ],
    );
  }

  // Widget _buildExpenseList(List<LedgerAccountEntity> ledgerList) {
  //   return ListView.builder(
  //       itemCount: ledgerList.length,
  //       itemBuilder: (context, index) {
  //         // final ledger = ledgerList[index];
  //         return Padding(
  //           padding: const EdgeInsets.only(bottom: 8.0),
  //           child: InkWell(
  //             onTap: () {

  //             },
  //           ),
  //         );
  //       });
  // }

  Widget _buildSubmitButton(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: PrimaryButton(
        label: AppStrings.submit,
        onPressed: () {},
      ),
    );
  }
}

Future<void> showExpenseBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppUtils.isDarkMode(context)
          ? context.colorScheme.tertiaryContainer
          : context.colorScheme.surfaceContainerLowest,
      builder: (context) {
        return ExpenseBottomModalSheet();
      });
}
