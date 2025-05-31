import 'dart:io';

import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class AppUtils {
  AppUtils._();

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static double toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    return 0.0;
  }

  static Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isGranted) return true;

    final result = await Permission.storage.request();
    return result.isGranted;
  }

  static Future<bool> requestDownloadPermission() async {
    if (Platform.isAndroid) {
      final androidVersion =
          int.tryParse(Platform.version.split(" ").first) ?? 30;

      if (androidVersion >= 29) {
        return true;
      } else {
        final status = await Permission.storage.request();
        return status.isGranted;
      }
    } else if (Platform.isIOS) {
      return true;
    } else {
      return false;
    }
  }

  static dynamic showToast(BuildContext context, String message) =>
      Fluttertoast.showToast(msg: context.translate(message));
}
