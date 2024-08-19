import 'dart:math';

import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:flutter/material.dart';

class TestContainer extends StatelessWidget {
  const TestContainer({super.key, this.color});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      constraints: const BoxConstraints(
        minWidth: 316,
        maxWidth: 316,
      ),
      height: Random().nextInt(1000) + 1000,
      margin: const EdgeInsets.only(
        top: Numbers.paddingLarge,
        bottom: Numbers.paddingMedium,
        left: Numbers.paddingMedium,
        right: Numbers.paddingMedium,
      ),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(Numbers.radiusMedium),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      child: const Column(),
    );
  }
}
