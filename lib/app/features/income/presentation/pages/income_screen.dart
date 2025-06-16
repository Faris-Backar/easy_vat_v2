import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/income/presentation/widgets/income_appbar.dart';
import 'package:easy_vat_v2/app/features/ledger/presentation/provider/cash_ledger/cash_ledger_notifier.dart';
import 'package:easy_vat_v2/app/features/payment_mode/presentation/providers/payment_mode_notifiers.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class IncomeScreen extends ConsumerStatefulWidget {
  const IncomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends ConsumerState<IncomeScreen> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(cashLedgerNotifierProvider.notifier).fetchCashLedgers();
      ref.read(cashLedgerNotifierProvider.notifier).fetchBankLedgers();
      ref.read(paymentModeNotifierProvider.notifier).fetchPaymentModes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IncomeAppbar(
        searchController: _searchTextController,
        config: IncomeAppBarConfig(),
      ),
      bottomNavigationBar: Container(
        color: AppUtils.isDarkMode(context)
            ? context.colorScheme.tertiaryContainer
            : context.surfaceColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.translate(AppStrings.total),
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: context.defaultTextColor.withValues(alpha: 0.32)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              onPressed: () => context.router.push(AddNewIncomeRoute()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    context.translate(AppStrings.addNew),
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
