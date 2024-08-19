import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:flutter/material.dart';

class MyMaterialButton extends StatelessWidget {
  final Function() onPressed;

  final Widget child;

  const MyMaterialButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Numbers.radiusMedium),
      ),
      child: child,
    );
  }
}
