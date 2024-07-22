import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:flutter/material.dart';

class MyFitContainer extends StatelessWidget {
  final Widget child;

  const MyFitContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Numbers.paddingMedium16),
      margin: const EdgeInsets.only(top: Numbers.paddingLarge),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(Numbers.radiusMedium),
        border: Border.all(
          width: 1,
          color: const Color(0xFFE8E8E8),
        ),
      ),
      child: child,
    );
  }
}
