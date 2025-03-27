import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/theme/custom_text_theme.dart';
import 'package:easy_vat_v2/app/features/main/data/home_category_data.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/category_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryMenu extends StatelessWidget {
  final String title;
  final List<HomeDataModel> dataList;
  final bool isDividerRequired;
  const HomeCategoryMenu(
      {super.key,
      required this.title,
      required this.dataList,
      this.isDividerRequired = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(title, style: CustomTextTheme.header(context)),
        SizedBox(height: 20.h),
        GridView.builder(
          itemCount: dataList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: .7,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (_, index) => InkWell(
              onTap: () => context.router.pushNamed(dataList[index].pagePath),
              child: CategoryItemCard(homeData: dataList[index])),
        ),
        if (isDividerRequired) SizedBox(height: 20.h),
        if (isDividerRequired) const Divider(),
      ],
    );
  }
}
