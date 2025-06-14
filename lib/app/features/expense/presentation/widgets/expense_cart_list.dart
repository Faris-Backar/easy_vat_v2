import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/expense/domain/entities/expense_cart_entity.dart';
import 'package:easy_vat_v2/app/features/expense/presentation/providers/expense_cart/expense_cart_provider.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_add_dialog.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/widgets/ledger_card_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseCartList extends StatelessWidget {
  final List<ExpenseCartEntity> ledgerList;
  const ExpenseCartList({super.key, required this.ledgerList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ledgerList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              //slidable ledger
              child: _buildSlidableLedger(context, index),
            ));
  }

  Widget _buildSlidableLedger(BuildContext context, int index) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          InkWell(
            onTap: () => _showDeleteDialog(context, index), // delete Dialog
            child: Container(
              height: 88.h,
              width: 43.w,
              color: AppUtils.isDarkMode(context)
                  ? CustomColors.getTransactionCardRedColor(context)
                  : CustomColors.getTransactionCardRedColor(context)
                      .withValues(alpha: 0.15),
              padding: const EdgeInsets.all(12.0),
              child: SvgIcon(
                icon: Assets.icons.delete,
                color: AppUtils.isDarkMode(context)
                    ? context.onPrimaryColor
                    : null,
              ),
            ),
          )
        ],
      ),
      endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.30,
          children: [
            InkWell(
              onTap: () => _showEditDialog(context, index), // Edit Dialog
              child: Container(
                height: 88.h,
                width: 43.h,
                color: AppUtils.isDarkMode(context)
                    ? CustomColors.getTransactionCardBlueColor(context)
                    : CustomColors.getTransactionCardBlueColor(context)
                        .withValues(alpha: 0.15),
                padding: const EdgeInsets.all(12.0),
                child: SvgIcon(
                  icon: Assets.icons.edit,
                  color: AppUtils.isDarkMode(context)
                      ? context.onPrimaryColor
                      : null,
                ),
              ),
            ),
            InkWell(
              onTap: () {}, // need to confirm
              child: Container(
                height: 88.h,
                width: 43.w,
                color: AppUtils.isDarkMode(context)
                    ? CustomColors.getTransactionCardGreenColor(context)
                    : CustomColors.getTransactionCardGreenColor(context)
                        .withValues(alpha: 0.15),
              ),
            )
          ]),
      child: InkWell(
        onTap: () => showDialog(
          context: context,
          builder: (context) => LedgerAddDialog(
            ledger: ledgerList[index].ledger,
            ledgerEntry: ledgerList[index],
          ),
        ),
        child: LedgerCardWidget(ledger: ledgerList[index], index: index),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: context.surfaceColor,
              title: Text(context.translate(AppStrings.delete)),
              titleTextStyle: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
              content:
                  Text(context.translate(AppStrings.deleteConfirmationInCart)),
              contentTextStyle: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        onPressed: () {},
                        label: AppStrings.cancel,
                        labelColor: context.defaultTextColor,
                        backgroundColor: AppUtils.isDarkMode(context)
                            ? context.colorScheme.tertiaryContainer
                            : null,
                        border: BorderSide(
                          color: context.colorScheme.primary
                              .withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(child:
                        Consumer(builder: (context, WidgetRef ref, child) {
                      return PrimaryButton(
                        width: double.infinity,
                        label: context.translate(AppStrings.delete),
                        bgColor:
                            CustomColors.getTransactionCardRedColor(context),
                        onPressed: () {
                          ref
                              .read(expenseCartProvider.notifier)
                              .removeLedgerFromExpenseCart(index: index);
                          context.router.popForced();
                        },
                      );
                    }))
                  ],
                )
              ],
            ));
  }

  void _showEditDialog(BuildContext context, int index) {
    TextEditingController descriptionController = TextEditingController();
    descriptionController.text = ledgerList[index].description;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: context.surfaceColor,
              title: Text(context.translate(AppStrings.description)),
              titleTextStyle: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
              content: SizedBox(
                width: 1.w,
                child: TextInputFormField(
                  controller: descriptionController,
                  maxLines: 6,
                  hint: AppStrings.description,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              actions: [
                Row(
                  children: [
                    Expanded(
                        child: SecondaryButton(
                      onPressed: () => context.router.popForced(),
                      label: AppStrings.cancel,
                      labelColor: context.defaultTextColor,
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? context.colorScheme.tertiaryContainer
                          : null,
                      border: BorderSide(
                          color: context.colorScheme.primary
                              .withValues(alpha: 0.2)),
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(child:
                        Consumer(builder: (context, WidgetRef ref, child) {
                      return PrimaryButton(
                        width: double.infinity,
                        label: context.translate(AppStrings.submit),
                        bgColor:
                            CustomColors.getTransactionCardBlueColor(context),
                        onPressed: () {
                          final updatedLedger = ledgerList[index].copyWith(
                              description: descriptionController.text);
                          ref
                              .read(expenseCartProvider.notifier)
                              .updateExpenseCartLedger(
                                  cartLedger: updatedLedger);
                          context.router.popForced();
                        },
                      );
                    }))
                  ],
                )
              ],
            ));
  }
}
