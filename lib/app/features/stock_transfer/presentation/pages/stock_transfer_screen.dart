import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/widgets/stock_transfer_appbar.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class StockTransferScreen extends ConsumerStatefulWidget {
  const StockTransferScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StockTransferScreenState();
}

class _StockTransferScreenState extends ConsumerState<StockTransferScreen> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockTransferAppbar(
          searchController: _searchTextController,
          config: StockTransferAppBarConfig()),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: AppUtils.isDarkMode(context)
              ? context.colorScheme.tertiaryContainer
              : context.surfaceColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.translate(AppStrings.total),
                    style: context.textTheme.bodyMedium?.copyWith(
                        color:
                            context.defaultTextColor.withValues(alpha: 0.32)),
                  ),
                  Text(
                    "0.0",
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                onPressed: () => context.router.push(AddNewStockTransferRoute(
                    title: context.translate(AppStrings.addNewStockTransfer))),
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
      ),
    );
  }
}
