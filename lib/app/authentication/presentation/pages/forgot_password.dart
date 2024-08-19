import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: VibeText(
          text: 'Change Password',
          fontSize: Numbers.appBarTitleSize,
        ),
      ),
      body: Center(
        child: VibeText(
          text: 'F O R G O T   P A S S W O R D',
          fontSize: 20,
        ),
      ),
    );
  }
}
