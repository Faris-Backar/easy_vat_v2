import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(PrefResources.isDarkMode)) {
      final isDarkMode = prefs.getBool(PrefResources.isDarkMode) ?? false;
      state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    } else {
      state = ThemeMode.system;
    }
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = state == ThemeMode.dark;
    final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;

    state = newMode;
    await prefs.setBool(PrefResources.isDarkMode, newMode == ThemeMode.dark);
  }
}
