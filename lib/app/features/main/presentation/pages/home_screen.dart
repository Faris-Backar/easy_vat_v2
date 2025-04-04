import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/main/data/home_category_data.dart';
import 'package:easy_vat_v2/app/features/main/presentation/providers/home_provider.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/home_category_menu.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/quick_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allowedFormIdsAsync = ref.watch(allowedHomeFormIdsProvider);

    return allowedFormIdsAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Error: $err'))),
      data: (allowedFormIds) {
        List<HomeDataModel> filter(List<HomeDataModel> original) => original
            .where((item) => allowedFormIds.contains(item.formId))
            .toList();

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
                      offset: const Offset(0, 2),
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
                              title: context.translate(AppStrings.masterData),
                              dataList:
                                  filter(HomeCategoryData.masterData(context)),
                            ),
                            HomeCategoryMenu(
                              title: context
                                  .translate(AppStrings.inventoryVoucher),
                              dataList: filter(
                                  HomeCategoryData.inventoryVoucher(context)),
                            ),
                            HomeCategoryMenu(
                              title:
                                  context.translate(AppStrings.accountVoucher),
                              dataList: filter(
                                  HomeCategoryData.accountVoucher(context)),
                            ),
                            HomeCategoryMenu(
                              title: context.translate(AppStrings.hrm),
                              dataList:
                                  filter(HomeCategoryData.hrmData(context)),
                            ),
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
      },
    );
  }
}
