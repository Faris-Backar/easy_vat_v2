import 'package:easy_vat_v2/app/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

class CustomColors {
  static Color getTransactionCardGreyColor(BuildContext context) {
    return AppUtils.isDarkMode(context) ? Color(0xFFEFEEEF) : Color(0xFFEFEEEF);
  }

  static Color getTransactionCardDarkGreyColor(BuildContext context) {
    return AppUtils.isDarkMode(context) ? Color(0xFFD8D6DE) : Color(0xFFD8D6DE);
  }

  static Color getTransactionCardRedColor(BuildContext context) {
    return AppUtils.isDarkMode(context) ? Color(0xFFE51717) : Color(0xFFE51717);
  }

  static Color getTransactionCardGreenColor(BuildContext context) {
    return AppUtils.isDarkMode(context) ? Color(0xFF348740) : Color(0xFF348740);
  }

  static Color getTransactionLightGreenColor(BuildContext context) {
    return AppUtils.isDarkMode(context) ? Color(0xFF877D34) : Color(0xFF877D34);
  }

  static Color getTransactionSkyBlueColor(BuildContext context) {
    return AppUtils.isDarkMode(context) ? Color(0xFF4A9FB6) : Color(0xFF4A9FB6);
  }

  static Color getTransactionCardBlueColor(BuildContext context) {
    return AppUtils.isDarkMode(context) ? Color(0xFF3B3487) : Color(0xFF3B3487);
  }
}
