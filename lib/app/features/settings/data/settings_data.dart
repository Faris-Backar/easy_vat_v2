import 'dart:ui';

import 'package:easy_vat_v2/app/core/localization/app_strings.dart';

class SettingsData {
  final settingsData = [
    _SettingsData(name: AppStrings.generalSettings, onTap: () {}),
    _SettingsData(name: AppStrings.lpoSettings, onTap: () {}),
    _SettingsData(name: AppStrings.salesSettings, onTap: () {}),
    _SettingsData(name: AppStrings.eDineSettings, onTap: () {}),
    _SettingsData(name: AppStrings.defaultLedger, onTap: () {}),
    _SettingsData(name: AppStrings.pos, onTap: () {}),
    _SettingsData(name: AppStrings.appFeatures, onTap: () {}),
  ];
}

class _SettingsData {
  final String name;
  final VoidCallback onTap;

  _SettingsData({required this.name, required this.onTap});
}
