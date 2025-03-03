import 'package:easy_vat_v2/gen/fonts.gen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.blue,
    colors: FlexSchemeColor(
      primary: Color(0xFF4627A5),
      secondary: Color(0xFF522EC3),
      tertiary: Color(0xFF7B7687),
      primaryContainer: Color(0xFF3E3656),
      tertiaryContainer: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFE6E6E8),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
      appBarTitleTextStyle: TextStyle(
        color: Color(0xFF101010),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    fontFamily: FontFamily.inter,
    scaffoldBackground: Color(0xFFFAF8FB),
    appBarStyle: FlexAppBarStyle.scaffoldBackground,
    applyElevationOverlayColor: false,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.blue,
    colors: FlexSchemeColor(
      primary: Color(0xFF4627A5),
      secondary: Color(0xFF522EC3),
      tertiary: Color(0xFF3C4249),
      primaryContainer: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFF242425),
      secondaryContainer: Color(0xFF5C5C5C),
    ),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
      appBarTitleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    fontFamily: FontFamily.inter,
    scaffoldBackground: Color(0xFF161616),
    appBarStyle: FlexAppBarStyle.scaffoldBackground,
    appBarBackground: Color(0xFF242425),
    applyElevationOverlayColor: false,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
