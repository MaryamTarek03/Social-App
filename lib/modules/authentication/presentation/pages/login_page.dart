import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/modules/authentication/presentation/pages/forgot_password.dart';
import 'package:connect_social_app/modules/authentication/presentation/widgets/auth_button.dart';
import 'package:connect_social_app/modules/authentication/presentation/widgets/auth_text_field.dart';
import 'package:connect_social_app/modules/home/presentation/pages/home_page.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.toggle});

  final Function() toggle;

  final _formKey = GlobalKey<FormState>();

  // Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Numbers.paddingLarge),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.onBackground,
                    size: 70,
                  ),
                  const SizedBox(height: 50),
                  VibeText(
                    text: 'Welcome back!',
                    fontSize: 28,
                    alignment: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Email Field
                  AuthTextField(
                    icon: Icons.person_outline_rounded,
                    hintText: 'Enter your email',
                    errorText: 'Please enter your email address',
                    labelText: 'Email',
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 15),
                  // Password Field
                  AuthTextField(
                    icon: Icons.lock_outline_rounded,
                    hintText: 'Enter your password',
                    errorText: 'Please enter your password',
                    labelText: 'Password',
                    isPassword: true,
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  AuthButton(
                    text: VibeText(
                      text: 'Login',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordPage(),
                            ),
                          );
                        },
                        child: VibeText(
                          text: 'Forgot Password?',
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VibeText(
                        text: 'Not a member?',
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: toggle,
                        child: VibeText(text: 'Register Here'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
