import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/app/features/widgets/text_input_form_field.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceJobAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController searchController;
  final ServiceJobAppBarConfig config;
  const ServiceJobAppbar(
      {super.key, required this.searchController, required this.config});

  @override
  ConsumerState<ServiceJobAppbar> createState() => _ServiceJobAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(60.h + kToolbarHeight);
}

class ServiceJobAppBarConfig {
  final String title;
  final Future<bool> Function()? onWillPop;
  final List<PopupMenuEntry<String>>? additionalPopupMenuItems;
  final bool showSearchBar;
  final bool enableBarcodeScanning;
  final VoidCallback? onBarcodeScan;
  const ServiceJobAppBarConfig(
      {this.title = "",
      this.additionalPopupMenuItems,
      this.showSearchBar = true,
      this.enableBarcodeScanning = true,
      this.onBarcodeScan,
      this.onWillPop});
}

class _ServiceJobAppbarState extends ConsumerState<ServiceJobAppbar> {
  late final ValueNotifier<bool> isSearchNotEmpty;

  @override
  void initState() {
    super.initState();
    isSearchNotEmpty = ValueNotifier(false);
    widget.searchController.addListener(() {
      isSearchNotEmpty.value = widget.searchController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    isSearchNotEmpty.dispose();
    super.dispose();
  }

  Widget _popupItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(text),
    );
  }

  Widget _buildSearchAndFilter(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 16.0, bottom: 16.0, right: 8.0),
          child: ValueListenableBuilder<bool>(
              valueListenable: isSearchNotEmpty,
              builder: (_, hasText, __) => TextInputFormField(
                  height: 36.h,
                  controller: widget.searchController,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  fillColor: AppUtils.isDarkMode(context)
                      ? context.colorScheme.surfaceBright
                      : null,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgIcon(
                      icon: Assets.icons.search,
                      color: AppUtils.isDarkMode(context)
                          ? context.colorScheme.onPrimary
                          : null,
                    ),
                  ),
                  hint: context.translate(AppStrings.search),
                  hintDecoration: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.defaultTextColor.withValues(alpha: 0.32),
                  ),
                  onChanged: (value) {}, // search  Service Job
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (hasText)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {
                              widget.searchController.clear();
                              isSearchNotEmpty.value = false;
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      Container(
                        height: 20,
                        width: 1,
                        color:
                            context.colorScheme.outline.withValues(alpha: 0.5),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      ),
                      if (widget.config.enableBarcodeScanning)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: () {},
                            child: SvgIcon(
                              icon: Assets.icons.barcode,
                              color: AppUtils.isDarkMode(context)
                                  ? context.colorScheme.onPrimary
                                  : null,
                            ),
                          ),
                        )
                    ],
                  ))),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.config.onWillPop == null,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop && widget.config.onWillPop != null) {
          final shouldPop = await widget.config.onWillPop!();
          if (shouldPop && context.mounted) {
            context.back();
          }
        }
      },
      child: AppBar(
        surfaceTintColor: context.colorScheme.onPrimary,
        title: Text(widget.config.title.isNotEmpty
            ? widget.config.title
            : context.translate(AppStrings.serviceJob)),
        actions: [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16.r)),
            color: context.colorScheme.surfaceContainerLowest,
            offset: Offset(-10.w, 30.h),
            onSelected: (value) {},
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            itemBuilder: (context) => [
              ...widget.config.additionalPopupMenuItems ??
                  [
                    PopupMenuItem(
                      value: AppStrings.print,
                      child: _popupItem(context.translate(AppStrings.print)),
                    ),
                    PopupMenuItem(
                        value: AppStrings.downloadExcel,
                        child: _popupItem(
                            context.translate(AppStrings.downloadExcel))),
                    PopupMenuItem(
                        value: AppStrings.showReport,
                        child: _popupItem(
                            context.translate(AppStrings.showReport)))
                  ]
            ],
          )
        ],
        bottom: PreferredSize(
            preferredSize: widget.preferredSize,
            child: Column(
              children: [
                if (widget.config.showSearchBar) _buildSearchAndFilter(context),
                const Divider(
                  height: 0,
                ),
              ],
            )),
      ),
    );
  }
}
