import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:easy_vat_v2/app/features/main/presentation/widgets/home_fab_button.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: true,
      routes: const [
        DashBoardRoute(),
        DayBookRoute(),
        HomeRoute(),
        ReportRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 0,
            ),
            BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              height: 80,
              shadowColor: Colors.black.withValues(alpha: 0.2),
              color: context.colorScheme.surfaceBright,
              elevation: 5.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: _buildNavItem(context,
                        label: AppStrings.dashboard,
                        icon: Assets.icons.dashboard,
                        index: 0,
                        tabsRouter: tabsRouter,
                        isSelected: tabsRouter.activeIndex == 0,
                        selectedIcon: Assets.icons.dashboard),
                  ),
                  Expanded(
                    child: _buildNavItem(context,
                        label: AppStrings.daybook,
                        icon: Assets.icons.book,
                        index: 1,
                        tabsRouter: tabsRouter,
                        isSelected: tabsRouter.activeIndex == 1,
                        selectedIcon: Assets.icons.book),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: _buildNavItem(context,
                        label: AppStrings.report,
                        icon: Assets.icons.report,
                        index: 3,
                        tabsRouter: tabsRouter,
                        isSelected: tabsRouter.activeIndex == 3,
                        selectedIcon: Assets.icons.report),
                  ),
                  Expanded(
                    child: _buildNavItem(context,
                        label: AppStrings.settings,
                        icon: Assets.icons.settings,
                        index: 4,
                        tabsRouter: tabsRouter,
                        isSelected: tabsRouter.activeIndex == 4,
                        selectedIcon: Assets.icons.settingsSelected),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      floatingActionButtonBuilder: (context, tabsRouter) => GestureDetector(
        onTap: () {
          tabsRouter.setActiveIndex(2);
        },
        child: SizedBox(
          height: 65,
          width: 65,
          child: HomeFabButton(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String label,
    required String icon,
    required int index,
    required TabsRouter tabsRouter,
    required bool isSelected,
    required String selectedIcon,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      borderRadius: BorderRadius.circular(5.0),
      onTap: () => tabsRouter.setActiveIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIcon(icon: isSelected ? selectedIcon : icon),
          Text(label,
              style: TextStyle(
                  fontSize: 12,
                  color: !isSelected
                      ? Color(0xFF9B99A2)
                      : AppUtils.isDarkMode(context)
                          ? context.colorScheme.onPrimary
                          : context.colorScheme.primary)),
        ],
      ),
    );
  }
}
