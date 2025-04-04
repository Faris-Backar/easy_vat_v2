import 'package:easy_vat_v2/app/core/resources/pref_resources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final allowedHomeFormIdsProvider = FutureProvider<List<String>>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(PrefResources.comapnyPermissions) ?? [];
});
