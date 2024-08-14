import 'package:connect_social_app/config/themes/palette.dart';
import 'package:flutter/material.dart';

class DarkThemes {
  static ThemeData original = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: DarkPalette.primary,
      secondary: DarkPalette.secondary,
      tertiary: DarkPalette.accent,
      background: DarkPalette.background,
      onBackground: DarkPalette.onBackground,
      outline: DarkPalette.outline,
      outlineVariant: DarkPalette.subText,
      error: const Color.fromARGB(255, 250, 118, 118),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: DarkPalette.background,
    dividerColor: DarkPalette.text,
    appBarTheme: AppBarTheme(color: DarkPalette.appBar),
  );
  static ThemeData neonAmethyst = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF7B2CBF),
      secondary: Color(0xFFEC407A),
      tertiary: Color(0xFFF8BBD0),
      background: Color(0xFF10002B),
      onBackground: Color(0xFF240046),
      outline: Color(0xFF7B2CBF),
      outlineVariant: Color(0xFFB0BEC5),
      error: Color(0xFFCF6679),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF10002B),
    dividerColor: const Color(0xFFE0E0E0),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF240046),
      elevation: 2,
      shadowColor: Color(0xFF7B2CBF),
    ),
  );
}
