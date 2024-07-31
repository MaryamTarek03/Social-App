import 'dart:math';

import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/config/themes/palette.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/presentation/screens/main/feed.dart';
import 'package:connect_social_app/presentation/widgets/common_text.dart';
import 'package:connect_social_app/presentation/widgets/fit_container.dart';
import 'package:connect_social_app/presentation/widgets/material_button.dart';
import 'package:connect_social_app/presentation/widgets/test/test_container.dart';
import 'package:connect_social_app/utils/responsive.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Numbers.paddingMedium),
          child: Center(
            child: SizedBox(
              width: min(double.infinity, 1500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: Responsive.isMobile(context) ? 250 : 400,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/placeholder/image.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: -90,
                        child: Hero(
                          tag: 'Profile Picture',
                          child: PhysicalModel(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            elevation: 15,
                            // shadowColor: Colors.black,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/placeholder/image.png'),
                              radius: 80,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (!Responsive.isMobile(context))
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Numbers.paddingMedium),
                      child: ProfileButton(onPressed: () {}, text: 'About'),
                    ),
                  if (Responsive.isMobile(context)) const SizedBox(height: 70),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CommonText(
                            text: 'Profile Name',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          CommonText(
                            text: 'Username',
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.outlineVariant,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!Responsive.isMobile(context))
                        const Expanded(child: TestContainer()),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Numbers.paddingMedium),
                                child: MyFitContainer(
                                  width: double.infinity,
                                  maxWidth: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonText(
                                        text: S.of(context).posts,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const Spacer(),
                                      ProfileButton(
                                        onPressed: () {},
                                        text: 'Recent',
                                      ),
                                      const SizedBox(width: 1),
                                      ProfileButton(
                                          onPressed: () {}, text: 'Popular'),
                                    ],
                                  ),
                                ),
                              ),
                              const Feed(),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const ProfileButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return MyFitContainer(
      color: Theme.of(context).brightness == Brightness.dark
          ? DarkPalette.profileButton
          : null,
      width: 120,
      height: 55,
      padding: 0,
      margin: 0,
      child: MyMaterialButton(
        onPressed: onPressed,
        child: CommonText(
          text: text,
          fontSize: 18,
        ),
      ),
    );
  }
}
