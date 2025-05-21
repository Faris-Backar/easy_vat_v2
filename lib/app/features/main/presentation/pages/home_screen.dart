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
    final topPadding = MediaQuery.paddingOf(context).top;

    return allowedFormIdsAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => Scaffold(
        body: Center(child: Text('Error: $err')),
      ),
      data: (allowedFormIds) {
        List<HomeDataModel> filter(List<HomeDataModel> original) => original
            .where((item) => allowedFormIds
                .map((id) => id.toLowerCase())
                .contains(item.formId.toLowerCase()))
            .toList();

        // Apply filtering
        final masterData = filter(HomeCategoryData.masterData(context));
        final inventoryVoucher =
            filter(HomeCategoryData.inventoryVoucher(context));
        final accountVoucher = filter(HomeCategoryData.accountVoucher(context));
        final hrmData = filter(HomeCategoryData.hrmData(context));

        // If all are empty, hide the bottom sheet section
        final allMenusEmpty = masterData.isEmpty &&
            inventoryVoucher.isEmpty &&
            accountVoucher.isEmpty &&
            hrmData.isEmpty;

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, topPadding + 5.h),
            child: Container(color: Theme.of(context).scaffoldBackgroundColor),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final availableHeight = constraints.maxHeight;
              final double sectionSpacing =
                  (availableHeight > 600.h) ? 16.h : 12.h;

              return NestedScrollView(
                headerSliverBuilder: (_, __) => [
                  QuickItemWidget(allowedFormIds: allowedFormIds),
                ],
                body: allMenusEmpty
                    ? const SizedBox.shrink()
                    : ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.r)),
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10.h),
                              // Handle
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
                                  physics: const BouncingScrollPhysics(),
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Column(
                                      children: [
                                        // Master Data Section
                                        if (masterData.isNotEmpty) ...[
                                          HomeCategoryMenu(
                                            title: context.translate(
                                                AppStrings.masterData),
                                            dataList: masterData,
                                          ),
                                          if (inventoryVoucher.isNotEmpty ||
                                              accountVoucher.isNotEmpty ||
                                              hrmData.isNotEmpty)
                                            SizedBox(height: sectionSpacing),
                                        ],

                                        // Inventory Voucher Section
                                        if (inventoryVoucher.isNotEmpty) ...[
                                          HomeCategoryMenu(
                                            title: context.translate(
                                                AppStrings.inventoryVoucher),
                                            dataList: inventoryVoucher,
                                          ),
                                          if (accountVoucher.isNotEmpty ||
                                              hrmData.isNotEmpty)
                                            SizedBox(height: sectionSpacing),
                                        ],

                                        // Account Voucher Section
                                        if (accountVoucher.isNotEmpty) ...[
                                          HomeCategoryMenu(
                                            title: context.translate(
                                                AppStrings.accountVoucher),
                                            dataList: accountVoucher,
                                          ),
                                          if (hrmData.isNotEmpty)
                                            SizedBox(height: sectionSpacing),
                                        ],

                                        // HRM Section
                                        if (hrmData.isNotEmpty)
                                          HomeCategoryMenu(
                                            title: context
                                                .translate(AppStrings.hrm),
                                            dataList: hrmData,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            },
          ),
        );
      },
    );
  }
}
