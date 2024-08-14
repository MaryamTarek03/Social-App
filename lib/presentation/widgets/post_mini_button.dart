import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';

class PostMiniButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Function() onPressed;
  const PostMiniButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: VibeText(text: text),
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
          elevation: const MaterialStatePropertyAll(0),
          iconColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.outlineVariant),
          surfaceTintColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)),
    );
  }
}
