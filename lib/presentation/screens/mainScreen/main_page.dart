import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/screens/mainScreen/feed.dart';
import 'package:connect_social_app/presentation/widgets/logo_text.dart';
import 'package:connect_social_app/presentation/widgets/test/test_container.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoText(),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 2,
        shadowColor: Theme.of(context).dividerColor,
        surfaceTintColor: Theme.of(context).colorScheme.onBackground,
      ),
      body: SingleChildScrollView(child: child),
    );
  }
}

class MainPageMobile extends StatelessWidget {
  const MainPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage(child: Feed());
  }
}

class MainPageTablet extends StatelessWidget {
  const MainPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: TestContainer()),
          Expanded(
            flex: 2,
            child: Feed(),
          ),
        ],
      ),
    );
  }
}

class MainPageDesktop extends StatelessWidget {
  const MainPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: TestContainer()),
          Expanded(flex: 2, child: Feed()),
          Flexible(child: TestContainer()),
        ],
      ),
    );
  }
}
