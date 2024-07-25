import 'package:flutter/material.dart';

abstract class LightPalette {
  static Color primary = const Color(0xFF3D70B2);
  static Color secondary = const Color(0xFF5596E6);
  static Color text = const Color(0xFF393A4F);
  static Color subText = const Color(0xFF999999);
  static Color background = const Color(0xFFF4F4F4);
  static Color onBackground = const Color(0xFFFFFFFF);
  static Color accent = const Color(0xFF6ba4e9);
  static Color outline = const Color(0xFFE8E8E8);
}

abstract class DarkPalette {
  static Color primary = const Color(0xFF3D70B2);
  static Color secondary = const Color(0xFF5596E6);
  static Color text = const Color(0xFFFAFAFA);
  static Color subText = const Color(0xFFA1A4B8);
  static Color background = const Color(0xFF2F3B50);
  static Color onBackground = const Color(0xFF202836);
  static Color accent = const Color(0xFF6ba4e9);
  static Color outline = const Color(0xFF283143);

  static Color appBar = const Color(0xFF151A23);
}
