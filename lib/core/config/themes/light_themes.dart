import 'package:connect_social_app/core/config/themes/palette.dart';
import 'package:flutter/material.dart';

class LightThemes {
  static ThemeData original = ThemeData(
    colorScheme: ColorScheme.light(
      primary: LightPalette.primary,
      onPrimary: Colors.white,
      inversePrimary: Colors.white,
      secondary: LightPalette.secondary,
      tertiary: LightPalette.accent,
      background: LightPalette.onBackground,
      onBackground: Colors.black,
      outline: LightPalette.outline,
      outlineVariant: LightPalette.subText,
      error: Colors.redAccent,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: LightPalette.background,
  );
  static ThemeData neonAmethyst = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF7B2CBF),
      inversePrimary: Colors.white,
      secondary: Color(0xFFEC407A),
      tertiary: Color(0xFFF8BBD0),
      background: Color.fromARGB(255, 251, 236, 255),
      onBackground: Colors.black,
      outline: Color(0xFF7B2CBF),
      outlineVariant: Color(0xFF3C096C),
      error: Color(0xFFCF6679),
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
