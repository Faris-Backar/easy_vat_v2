import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/cart/presentation/widgets/items_bottom_modal_sheet.dart';
import 'package:easy_vat_v2/app/features/items/presentation/providers/item_notifier.dart';
import 'package:easy_vat_v2/app/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFooterWidget extends ConsumerStatefulWidget {
  const CartFooterWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CartFooterWidgetState();
}

class _CartFooterWidgetState extends ConsumerState<CartFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Consumer(
        builder: (context, ref, child) => PrimaryButton(
          onPressed: () {
            ref.read(itemProvider.notifier).fetchItems();
            showItemsBottomSheet(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                color: context.onPrimaryColor,
                size: 18.sp,
              ),
              SizedBox(width: 3.w),
              Text(
                AppStrings.addItem,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.onPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
