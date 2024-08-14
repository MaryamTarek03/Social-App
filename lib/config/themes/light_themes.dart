import 'package:connect_social_app/config/themes/palette.dart';
import 'package:flutter/material.dart';

class LightThemes {
  static ThemeData original = ThemeData(
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
  static ThemeData neonAmethyst = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF7B2CBF), 
      secondary: Color(0xFFEC407A), 
      tertiary: Color(0xFFF8BBD0), 
      background: Color.fromARGB(255, 251, 236, 255),
      onBackground: Color.fromARGB(255, 252, 248, 255),
      outline: Color(0xFF7B2CBF), 
      outlineVariant: Color(0xFF3C096C),
      error: Color(0xFFCF6679), 
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor:
        const Color.fromARGB(255, 251, 236, 255), 
    dividerColor: const Color(0xFF10002B),
  );
}
