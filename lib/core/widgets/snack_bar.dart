import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';

SnackBar mySnackBar(String text, Color color) {
  return SnackBar(
    content: Center(child: VibeText(text: text)),
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(Numbers.paddingMedium),
      ),
    ),
  );
}
