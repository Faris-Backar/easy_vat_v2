import 'package:shared_preferences/shared_preferences.dart';

class PrefResources {
  PrefResources._();

  static const String isAuthenticated = "IS_AUTHENTICATED";
  static const String isDarkMode = "IS_DARKMODE";
  static const String token = "TOKEN";
  static const String companyId = "COMPANY_ID";
  static const String companyIdpk = "COMPANY_IDPK";
  static const String languageCodeSelected = "LANGUAGE_CODE";
  static const String baseUrl = "BASE_URL";
  static const String isTaxEnabled = "IS_TAX_ENABLED";
  static const String comapnyPermissions = "COMPANY_PERMISSIONS";

  static Future<void> setBaseUrl({required String newBaseUrl}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PrefResources.baseUrl, newBaseUrl);
  }
}
