import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Numbers.radiusMedium),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      child: VibeText(
        text: text,
        color: Colors.white,
      ),
    );
  }
}
