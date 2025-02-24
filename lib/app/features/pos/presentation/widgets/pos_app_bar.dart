import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/features/pos/presentation/widgets/filter_widget.dart';
import 'package:easy_vat_v2/app/features/pos/presentation/widgets/pagination_widget.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';

class PosAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  const PosAppBar({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: context.colorScheme.onPrimary,
      title: Text(AppStrings.pointOfSales),
      actions: [
        PopupMenuButton<String>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          color: context.colorScheme.surfaceContainerLowest,
          offset: Offset(-10.w, 30.h),
          onSelected: (value) {},
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: AppStrings.print,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(AppStrings.print),
              ),
            ),
            PopupMenuItem(
              value: AppStrings.downloadExcel,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(AppStrings.downloadExcel),
              ),
            ),
            PopupMenuItem(
              value: AppStrings.showReport,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(AppStrings.showReport),
              ),
            ),
          ],
        ),
      ],
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Column(
          children: [
            _buildSearchAndFilter(context),
            const Divider(height: 0),
            PaginationWidget(),
            const Divider(thickness: 4, height: 0),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110.h + kToolbarHeight);

  Widget _buildSearchAndFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextInputFormField(
              controller: searchController,
              prefixIcon: const Icon(Icons.search_rounded),
              hint: AppStrings.search,
            ),
          ),
          SizedBox(width: 10.w),
          FilterWidget(),
        ],
      ),
    );
  }
}
