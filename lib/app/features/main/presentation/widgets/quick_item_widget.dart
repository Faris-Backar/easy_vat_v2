import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/theme/custom_text_theme.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/category_item_card.dart';
import 'package:flutter/material.dart';

import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/features/main/data/home_category_data.dart';

class QuickItemWidget extends StatelessWidget {
  const QuickItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverHeaderDelegate(
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height / 1.5,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: _CategoryMenu(
              dataList: HomeCategoryData.quickItemsData,
              label: AppStrings.quickItems,
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _SliverHeaderDelegate oldDelegate) {
    return oldDelegate.maxHeight != maxHeight ||
        oldDelegate.minHeight != minHeight ||
        oldDelegate.child != child;
  }
}

class _CategoryMenu extends StatelessWidget {
  final String label;
  final List<HomeDataModel> dataList;
  const _CategoryMenu({
    required this.label,
    required this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(AppStrings.quickItems,
              style: CustomTextTheme.header(context)),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: .7,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              final homeData = dataList[index];
              return InkWell(
                  onTap: () => context.router.pushNamed(homeData.pagePath),
                  child: CategoryItemCard(homeData: homeData));
            },
          ),
        ),
      ],
    );
  }
}
