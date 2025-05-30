// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/core/resources/url_resources.dart';
import 'package:easy_vat_v2/app/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsData {
  settingsData(BuildContext context) => [
        _SettingsData(
            name: context.translate(AppStrings.generalSettings), onTap: () {}),
        _SettingsData(
            name: context.translate(AppStrings.language), onTap: () {}),
        _SettingsData(
            name: context.translate(AppStrings.lpoSettings), onTap: () {}),
        _SettingsData(
            name: context.translate(AppStrings.salesSettings), onTap: () {}),
        _SettingsData(
            name: context.translate(AppStrings.eDineSettings), onTap: () {}),
        _SettingsData(
            name: context.translate(AppStrings.defaultLedger), onTap: () {}),
        _SettingsData(name: context.translate(AppStrings.pos), onTap: () {}),
        _SettingsData(
            name: context.translate(AppStrings.appFeatures), onTap: () {}),
        _SettingsData(
            name: context.translate(AppStrings.logout),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              baseUrl = UrlResources.serverBaseUrl;
              await prefs.clear().whenComplete(
                () {
                  context.router.popUntilRoot();
                  context.router.pushNamed(AppRouter.login);
                },
              );
            })
      ];
}

class _SettingsData {
  final String name;
  final VoidCallback onTap;

  _SettingsData({required this.name, required this.onTap});
}
