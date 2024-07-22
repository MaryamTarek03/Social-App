import 'package:flutter/material.dart';

class ResponsiveUI extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;
  const ResponsiveUI({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 660) {
          return mobileScaffold;
        } else if (constraints.maxWidth < 1150) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
