import 'package:connect_social_app/config/themes/dark_themes.dart';
import 'package:connect_social_app/config/themes/light_themes.dart';
import 'package:flutter/material.dart';

enum Language { en, ar, de }

Map<Language, String> languageNames = {
  Language.ar: 'Arabic',
  Language.en: 'English',
  Language.de: 'German',
};
Map<Language, String> languageCodes = {
  Language.ar: 'ar',
  Language.en: 'en',
  Language.de: 'de',
};

enum MyTheme { original, neonAmethyst }

Map<MyTheme, String> themeNames = {
  MyTheme.original: 'Original',
  MyTheme.neonAmethyst: 'Neon Amethyst',
};
Map<MyTheme, ThemeData> darkThemeData = {
  MyTheme.original: DarkThemes.original,
  MyTheme.neonAmethyst: DarkThemes.neonAmethyst,
};
Map<MyTheme, ThemeData> lightThemeData = {
  MyTheme.original: LightThemes.original,
  MyTheme.neonAmethyst: LightThemes.neonAmethyst,
};
