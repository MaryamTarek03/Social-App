import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/core/config/themes/palette.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/presentation/screens/main/feed.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:connect_social_app/core/widgets/fit_container.dart';
import 'package:connect_social_app/presentation/widgets/custom/material_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Numbers.paddingMedium),
          child: Column(
            children: [
              ProfileImages(),
              SizedBox(height: 120),
              ProfileNameData(),
              FilterCard(),
              Feed(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileNameData extends StatelessWidget {
  const ProfileNameData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VibeText(
          text: 'Profile Name',
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        VibeText(
          text: 'Username',
          fontSize: 20,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ],
    );
  }
}

class ProfileImages extends StatelessWidget {
  const ProfileImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/placeholder/image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
         Positioned(
          bottom: -90,
          child: Hero(
            tag: 'Profile Picture',
            child: PhysicalModel(
              color: Colors.black,
              shape: BoxShape.circle,
              elevation: 15,
              shadowColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/placeholder/image.png'),
                radius: 80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterCard extends StatelessWidget {
  const FilterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyFitContainer(
      width: double.infinity,
      maxWidth: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VibeText(
            text: S.of(context).posts,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),
          ProfileButton(onPressed: () {}, text: S.of(context).recent),
          const SizedBox(width: 5),
          ProfileButton(onPressed: () {}, text: S.of(context).popular),
        ],
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
      padding: Numbers.paddingSmall,
      margin: 0,
      child: MyMaterialButton(
        onPressed: onPressed,
        child: VibeText(
          text: text,
          fontSize: 18,
        ),
      ),
    );
  }
}
