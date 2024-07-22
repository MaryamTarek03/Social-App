import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/widgets/post.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Numbers.paddingMedium),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: Numbers.paddingMedium),
          child: Post(),
        ),
        itemCount: 20,
      ),
    );
  }
}
