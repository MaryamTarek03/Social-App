import 'package:connect_social_app/modules/home/presentation/pages/home_page.dart';
import 'package:connect_social_app/modules/settings/presentation/settings.dart';
import 'package:connect_social_app/modules/shared/models/post_model.dart';
import 'package:connect_social_app/presentation/screens/main/profile.dart';
import 'package:connect_social_app/presentation/screens/post_page.dart';
import 'package:flutter/material.dart';

class MainRoutes {
  static void homePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  static profilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  static settingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ),
    );
  }

  static postPage(BuildContext context, PostModel post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostPage(post: post),
      ),
    );
  }
}
