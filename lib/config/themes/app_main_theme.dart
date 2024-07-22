import 'package:connect_social_app/config/themes/palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeMode themeMode = ThemeMode.light;

  static ThemeData getLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: PaletteLight.primary,
        secondary: PaletteLight.secondary,
        tertiary: PaletteLight.accent,
        background: PaletteLight.background,
        onBackground: PaletteLight.onBackground,
        error: Colors.redAccent,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: PaletteLight.background,
      dividerColor: PaletteLight.text,
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
      ),
    );
  }
}
