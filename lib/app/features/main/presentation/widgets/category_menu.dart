import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/core/theme/custom_text_theme.dart';
import 'package:easy_vat_v2/app/features/main/data/home_data.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/category_menu_builder.dart';
import 'package:flutter/material.dart';

class CategoryMenu extends StatelessWidget {
  final String label;
  final List<HomeDataModel> dataList;
  final bool isDividerRequired;
  const CategoryMenu({
    super.key,
    required this.label,
    required this.dataList,
    this.isDividerRequired = false,
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
          child: CategoryMenuBuilder(dataList: HomeData.quickItemsData),
        ),
        if (isDividerRequired)
          SizedBox(
            height: 20,
          ),
        if (isDividerRequired) Divider()
      ],
    );
  }
}
