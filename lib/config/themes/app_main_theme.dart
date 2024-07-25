import 'package:connect_social_app/config/themes/palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeMode themeMode = ThemeMode.light;

  static ThemeData getLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: LightPalette.primary,
        secondary: LightPalette.secondary,
        tertiary: LightPalette.accent,
        background: LightPalette.background,
        onBackground: LightPalette.onBackground,
        outline: LightPalette.outline,
        outlineVariant: LightPalette.subText,
        error: Colors.redAccent,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: LightPalette.background,
      dividerColor: LightPalette.text,
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        primary: DarkPalette.primary,
        secondary: DarkPalette.secondary,
        tertiary: DarkPalette.accent,
        background: DarkPalette.background,
        onBackground: DarkPalette.onBackground,
        outline: DarkPalette.outline,
        outlineVariant: DarkPalette.subText,
        error: Colors.redAccent,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: DarkPalette.background,
      dividerColor: DarkPalette.text,
      appBarTheme: AppBarTheme(color: DarkPalette.appBar),
    );
  }
}
