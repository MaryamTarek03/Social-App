import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle englishStyle({
  double fontSize = 16,
  required Color color,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    GoogleFonts.comfortaa(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );

TextStyle arabicStyle({
  double fontSize = 16,
  required Color color,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    GoogleFonts.cairo(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
