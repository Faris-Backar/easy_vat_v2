import 'dart:convert';

import 'package:easy_vat_v2/app/features/auth/data/model/pin_login_model.dart';
import 'package:easy_vat_v2/app/features/auth/domain/entities/pin_login_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCredentialPreferenceHelper {
  // Keys for SharedPreferences
  static const String _kStoreDetails = 'store_details';
  static const String _kCashAccountDetails = 'cash_account_details';
  // static const String _kUserPermissions = 'user_permissions';
  static const String _kAppSettings = 'app_settings';
  static const String _kCompanyInfo = 'company_info';
  static const String _kLedgerBookInfo = 'ledger_book_info';

  // Private constructor to prevent direct instantiation
  AppCredentialPreferenceHelper._();

  // Singleton instance
  static final AppCredentialPreferenceHelper _instance =
      AppCredentialPreferenceHelper._();

  // Factory constructor to access the singleton instance
  factory AppCredentialPreferenceHelper() => _instance;

  // Save methods

  /// Save store details to SharedPreferences
  Future<bool> saveStoreDetails(StoreDetailsModel storeDetails) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonData = jsonEncode(storeDetails.toJson());
    return prefs.setString(_kStoreDetails, jsonData);
  }

  /// Save cash account details to SharedPreferences
  Future<bool> saveCashAccountDetails(
      CashAccountDetailsModel cashAccountDetails) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonData = jsonEncode(cashAccountDetails.toJson());
    return prefs.setString(_kCashAccountDetails, jsonData);
  }

  /// Save user permissions to SharedPreferences
  // Future<bool> saveUserPermissions(List<UserPermissionsModel> userPermissions) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final List<Map<String, dynamic>> jsonList =
  //       userPermissions.map((permission) => permission.toJson()).toList();
  //   final String jsonData = jsonEncode(jsonList);
  //   return prefs.setString(_kUserPermissions, jsonData);
  // }

  /// Save app settings to SharedPreferences
  Future<bool> saveAppSettings(AppSettingsModel appSettings) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonData = jsonEncode(appSettings.toJson());
    return prefs.setString(_kAppSettings, jsonData);
  }

  /// Save company info to SharedPreferences
  Future<bool> saveCompanyInfo(CompanyInfo companyInfo) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonData = jsonEncode(companyInfo);
    return prefs.setString(_kCompanyInfo, jsonData);
  }

  /// Save ledger book info to SharedPreferences
  Future<bool> saveLedgerBookInfo(LedgerBookInfoModel? ledgerBookInfo) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonData = jsonEncode(ledgerBookInfo?.toJson());
    return prefs.setString(_kLedgerBookInfo, jsonData);
  }

  // Get methods

  /// Get store details from SharedPreferences
  Future<StoreDetailsEntity?> getStoreDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString(_kStoreDetails);
    if (jsonData == null) return null;

    try {
      final Map<String, dynamic> json = jsonDecode(jsonData);
      return StoreDetailsModel.fromJson(json);
    } catch (e) {
      debugPrint('Error parsing store details: $e');
      return null;
    }
  }

  /// Get cash account details from SharedPreferences
  Future<CashAccountDetailsEntity?> getCashAccountDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString(_kCashAccountDetails);
    if (jsonData == null) return null;

    try {
      final Map<String, dynamic> json = jsonDecode(jsonData);
      return CashAccountDetailsModel.fromJson(json);
    } catch (e) {
      debugPrint('Error parsing cash account details: $e');
      return null;
    }
  }

  /// Get user permissions from SharedPreferences
  // Future<List<UserPermission>?> getUserPermissions() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? jsonData = prefs.getString(_kUserPermissions);
  //   if (jsonData == null) return null;

  //   try {
  //     final List<dynamic> jsonList = jsonDecode(jsonData);
  //     return jsonList.map((json) => UserPermission.fromJson(json)).toList();
  //   } catch (e) {
  //     print('Error parsing user permissions: $e');
  //     return null;
  //   }
  // }

  /// Get app settings from SharedPreferences
  Future<AppSettingsEntity?> getAppSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString(_kAppSettings);
    if (jsonData == null) return null;

    try {
      final Map<String, dynamic> json = jsonDecode(jsonData);
      return AppSettingsModel.fromJson(json);
    } catch (e) {
      // print('Error parsing app settings: $e');
      return null;
    }
  }

  /// Get company info from SharedPreferences
  Future<CompanyInfoEntity?> getCompanyInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString(_kCompanyInfo);
    if (jsonData == null) return null;

    try {
      final Map<String, dynamic> json = jsonDecode(jsonData);
      return CompanyInfo.fromJson(json);
    } catch (e) {
      debugPrint('Error parsing company info: $e');
      return null;
    }
  }

  /// Get ledger book info from SharedPreferences
  Future<LedgerBookInfoEntity?> getLedgerBookInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString(_kLedgerBookInfo);
    if (jsonData == null) return null;

    try {
      final Map<String, dynamic>? json =
          jsonData != "null" ? jsonDecode(jsonData) : null;
      return LedgerBookInfoModel.fromJson(json!);
    } catch (e) {
      debugPrint('Error parsing ledger book info: $e');
      return null;
    }
  }

  /// Clear all stored data
  Future<bool> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  /// Check if a specific key exists in SharedPreferences
  Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
