import 'package:easy_vat_v2/app/features/main/data/home_data.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/category_item_card.dart';
import 'package:flutter/material.dart';

class CategoryMenuBuilder extends StatelessWidget {
  final List<HomeDataModel> dataList;
  const CategoryMenuBuilder({
    super.key,
    required this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
        return CategoryItemCard(homeData: homeData);
      },
    );
  }
}
