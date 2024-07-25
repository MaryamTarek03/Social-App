import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:flutter/material.dart';

class MyFitContainer extends StatelessWidget {
  final Widget child;
  final bool hasShadow;

  final double minWidth;

  final double maxWidth;

  final double? margin;

  const MyFitContainer({
    super.key,
    required this.child,
    this.hasShadow = false,
    this.minWidth = 0,
    this.maxWidth = 250,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Numbers.paddingMedium16),
      margin: EdgeInsets.only(top: margin ?? Numbers.paddingLarge),
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
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
