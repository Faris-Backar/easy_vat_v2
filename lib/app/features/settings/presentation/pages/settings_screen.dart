import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/features/settings/data/settings_data.dart';
import 'package:flutter/material.dart';

import 'package:easy_vat_v2/app/core/app_strings.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.settings,
        ),
        titleTextStyle: TextStyle(
            color: Color(0xFF3E3656).withValues(alpha: .5),
            fontSize: 20.0,
            fontWeight: FontWeight.w700),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListView.separated(
            itemCount: SettingsData().settingsData.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) => SettingsListWidget(
              name: SettingsData().settingsData[index].name,
              onTap: SettingsData().settingsData[index].onTap,
            ),
          )),
    );
  }
}

class SettingsListWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const SettingsListWidget({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.0, color: Colors.grey.withValues(alpha: .2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(name), SvgIcon(icon: Assets.icons.arrowForward)],
        ),
      ),
    );
  }
}
