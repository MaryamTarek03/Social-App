import 'package:connect_social_app/presentation/screens/auth/login.dart';
import 'package:connect_social_app/presentation/screens/auth/register_page.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isLogin = true;
  void togglePage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLogin
          ? LoginScreen(toggle: togglePage)
          : RegisterPage(toggle: togglePage),
    );
  }
}
