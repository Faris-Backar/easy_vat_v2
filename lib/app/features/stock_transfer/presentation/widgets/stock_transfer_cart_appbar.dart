import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/theme/custom_colors.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/stock_transfer/presentation/providers/stock_transfer/stock_transfer_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/secondary_button.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockTransferCartAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const StockTransferCartAppbar({super.key});

  @override
  ConsumerState<StockTransferCartAppbar> createState() =>
      _StockTransferCartAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _StockTransferCartAppbarState
    extends ConsumerState<StockTransferCartAppbar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching
          ? SizedBox(
              height: 36.h,
              child: TextInputFormField(
                controller: _searchController,
                autoFocus: true,
                hint: context.translate(AppStrings.search),
                onChanged: (value) => ref
                    .read(stockTransferProvider.notifier)
                    .filterCartItems(value),
              ),
            )
          : Text(context.translate(AppStrings.cart)),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                }
              });
            },
            icon: Icon(_isSearching ? Icons.close : Icons.search_rounded)),
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "print") {
            } else if (value == "clear") {
              _showDeleteDialog(context);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: "print",
              child: Text(context.translate(AppStrings.print)),
            ),
            PopupMenuItem(
              value: "clear",
              child: Text(context.translate(AppStrings.clearCart)),
            )
          ],
        )
      ],
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.surfaceColor,
        title: Text(context.translate(AppStrings.delete)),
        titleTextStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        content: Text(context.translate(AppStrings.clearCartMessage)),
        contentTextStyle:
            context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        actions: [
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  width: double.infinity,
                  onPressed: () => context.router.popForced(),
                  label: AppStrings.cancel,
                  labelColor: context.defaultTextColor,
                  backgroundColor: AppUtils.isDarkMode(context)
                      ? context.colorScheme.tertiaryContainer
                      : null,
                  border: BorderSide(
                    color: context.colorScheme.primary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Consumer(builder: (context, WidgetRef ref, child) {
                  return PrimaryButton(
                    width: double.infinity,
                    label: context.translate(AppStrings.clearAll),
                    bgColor: CustomColors.getTransactionCardRedColor(context),
                    onPressed: () {
                      ref.read(stockTransferProvider.notifier).clearCart();
                      context.router.popForced();
                    },
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
