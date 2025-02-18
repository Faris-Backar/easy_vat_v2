import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.blue,
    colors: FlexSchemeColor(
        primary: Color(0xFF27165D),
        secondary: Color(0xFF522EC3),
        primaryContainer: Color(0xFF3E3656),
        tertiaryContainer: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFE6E6E8)),
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
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
        primary: Color(0xFF27165D),
        secondary: Color(0xFF522EC3),
        primaryContainer: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFF242425),
        secondaryContainer: Color(0xFF5C5C5C)),
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
    ),
    scaffoldBackground: Color(0xFF161616),
    appBarStyle: FlexAppBarStyle.scaffoldBackground,
    applyElevationOverlayColor: false,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
