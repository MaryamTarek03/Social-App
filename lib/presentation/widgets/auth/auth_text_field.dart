import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/config/constants/text_style.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    this.isPassword = false,
    required this.hintText,
    required this.errorText,
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    required this.icon,
  });

  final bool? isPassword;
  final TextInputType keyboardType;
  final String hintText;
  final String errorText;
  final String labelText;
  final Widget icon;
  final TextEditingController controller;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _isObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword! ? _isObscured : false,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: Localizations.localeOf(context) == const Locale('ar')
            ? arabicStyle(color: Theme.of(context).dividerColor)
            : englishStyle(color: Theme.of(context).dividerColor),
        labelStyle: Localizations.localeOf(context) == const Locale('ar')
            ? arabicStyle(color: Theme.of(context).dividerColor)
            : englishStyle(color: Theme.of(context).dividerColor),
        errorStyle: Localizations.localeOf(context) == const Locale('ar')
            ? arabicStyle(color: Theme.of(context).colorScheme.error)
            : englishStyle(color: Theme.of(context).colorScheme.error),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onBackground,

        // BORDERS
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Numbers.radiusMedium),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Numbers.radiusMedium),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Numbers.radiusMedium),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Numbers.radiusMedium),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        suffixIcon: widget.isPassword!
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
        if (value.length < 8 && widget.isPassword!) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
    );
  }
}
