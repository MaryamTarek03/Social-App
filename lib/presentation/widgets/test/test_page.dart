import 'package:connect_social_app/presentation/widgets/post.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Post(),
        ],
      ),
    );
  }
}
