import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:flutter/material.dart';

class MyFitContainer extends StatelessWidget {
  final Widget child;
  final bool hasShadow;
  final double? width;
  final double? height;
  final double minWidth;
  final double maxWidth;
  final double? margin;
  final double? padding;

  final Color? color;

  const MyFitContainer({
    super.key,
    required this.child,
    this.hasShadow = false,
    this.minWidth = 0,
    this.maxWidth = 250,
    this.margin,
    this.width,
    this.height,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding ?? Numbers.paddingMedium16),
      margin: EdgeInsets.only(top: margin ?? Numbers.paddingLarge),
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
      ),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(Numbers.radiusMedium),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.outline,
        ),
        boxShadow: [
          if (hasShadow)
            const BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
        ],
      ),
      child: child,
    );
  }
}
