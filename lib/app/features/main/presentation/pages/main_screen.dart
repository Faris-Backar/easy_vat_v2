import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/app_core.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.gr.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DashBoardRoute(),
        DayBookRoute(),
        HomeRoute(),
        ReportRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          height: 80,
          color: const Color(0xFFEFEFEF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _buildNavItem(
                    label: AppStrings.dashboard,
                    icon: Assets.icons.dashboard,
                    index: 0,
                    tabsRouter: tabsRouter,
                    isSelected: tabsRouter.activeIndex == 0,
                    selectedIcon: Assets.icons.dashboard),
              ),
              Expanded(
                child: _buildNavItem(
                    label: AppStrings.daybook,
                    icon: Assets.icons.book,
                    index: 1,
                    tabsRouter: tabsRouter,
                    isSelected: tabsRouter.activeIndex == 1,
                    selectedIcon: Assets.icons.book),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: _buildNavItem(
                    label: AppStrings.report,
                    icon: Assets.icons.report,
                    index: 3,
                    tabsRouter: tabsRouter,
                    isSelected: tabsRouter.activeIndex == 3,
                    selectedIcon: Assets.icons.report),
              ),
              Expanded(
                child: _buildNavItem(
                    label: AppStrings.settings,
                    icon: Assets.icons.settings,
                    index: 4,
                    tabsRouter: tabsRouter,
                    isSelected: tabsRouter.activeIndex == 4,
                    selectedIcon: Assets.icons.settingsSelected),
              ),
            ],
          ),
        );
      },
      floatingActionButtonBuilder: (context, tabsRouter) => GestureDetector(
        onTap: () {
          tabsRouter.setActiveIndex(2);
        },
        child: SizedBox(
          height: 65,
          width: 65,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AutoTabsRouter.of(context).activeIndex == 2
                    ? LinearGradient(
                        colors: [Color(0xFF522EC3), Color(0xFF27165D)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                color: Color(0xFF9692A6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(icon: Assets.icons.homeSelected),
                const SizedBox(height: 3),
                const Text(
                  AppStrings.home,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(
      {required String label,
      required String icon,
      required int index,
      required TabsRouter tabsRouter,
      required bool isSelected,
      required String selectedIcon}) {
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
                  color: !isSelected ? Color(0xFF9B99A2) : Color(0xFF522EC3))),
        ],
      ),
    );
  }
}
