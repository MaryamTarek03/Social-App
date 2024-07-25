import 'package:flutter/material.dart';

abstract class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 750;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 750 &&
      MediaQuery.of(context).size.width <= 1150;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1150;
}
