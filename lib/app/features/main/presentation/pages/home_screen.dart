import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/main/data/home_category_data.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/home_category_menu.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/quick_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, MediaQuery.paddingOf(context).top + 5.h),
        child: Container(color: Theme.of(context).scaffoldBackgroundColor),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [const QuickItemWidget()],
        body: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.tertiaryContainer,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.outline,
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Container(
                  height: 6.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HomeCategoryMenu(
                            title: AppStrings.masterData,
                            dataList: HomeCategoryData.masterData),
                        HomeCategoryMenu(
                            title: AppStrings.inventoryVoucher,
                            dataList: HomeCategoryData.inventoryVoucher),
                        HomeCategoryMenu(
                            title: AppStrings.accountVoucher,
                            dataList: HomeCategoryData.accountVoucher),
                        HomeCategoryMenu(
                            title: AppStrings.hrm,
                            dataList: HomeCategoryData.hrmData),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
