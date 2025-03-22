import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en'));

  void setLocale(String languageCode) {
    state = Locale(languageCode);
  }
}

// Locale Provider
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
