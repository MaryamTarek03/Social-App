import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/screens/main/main_page.dart';
import 'package:connect_social_app/presentation/widgets/auth/auth_button.dart';
import 'package:connect_social_app/presentation/widgets/auth/auth_text_field.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.toggle});

  final Function() toggle;

  final _formKey = GlobalKey<FormState>();

  // Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

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
                  VibeText(
                    text: 'Excited to meet you!',
                    fontSize: 28,
                    alignment: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Email Field
                  AuthTextField(
                    icon: const Icon(Icons.person_outline_rounded),
                    hintText: 'Enter your email',
                    errorText: 'Please enter your email address',
                    labelText: 'Email',
                    isPassword: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 10),
                  // Password Field
                  AuthTextField(
                    icon: const Icon(Icons.lock_outline_rounded),
                    hintText: 'Enter your password',
                    errorText: 'Please enter your password',
                    labelText: 'Password',
                    isPassword: true,
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 10),
                  // Confirm Password Field
                  AuthTextField(
                    icon: const Icon(Icons.lock_outline_rounded),
                    hintText: 'Confirm your password',
                    errorText: 'Please confirm your password',
                    labelText: 'Confirm Password',
                    isPassword: true,
                    keyboardType: TextInputType.text,
                    controller: _confirmPasswordController,
                  ),
                  const SizedBox(height: 25),
                  AuthTextField(
                    icon: const Icon(Icons.person_outline_rounded),
                    hintText: 'Enter your name',
                    errorText: 'Please enter your name',
                    labelText: 'Name',
                    isPassword: false,
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    icon: const Icon(Icons.phone_outlined),
                    hintText: 'Enter your phone number',
                    errorText: 'Please enter your phone number',
                    labelText: 'Phone Number',
                    isPassword: false,
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                  ),
                  const SizedBox(height: 20),
                  AuthButton(
                    text: 'Register',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VibeText(
                        text: 'Already have an account?',
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: toggle,
                        child: VibeText(text: 'Login Now'),
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
