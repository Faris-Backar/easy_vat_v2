import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode =
        prefs.getString(PrefResources.languageCodeSelected) ?? 'en';
    state = Locale(languageCode);
  }

  void setLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PrefResources.languageCodeSelected, languageCode);
    state = Locale(languageCode);
  }
}

// Locale Provider
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
