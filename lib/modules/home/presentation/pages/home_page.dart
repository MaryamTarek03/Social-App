import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/core/config/routes/main_routes.dart';
import 'package:connect_social_app/modules/chat/presentation/pages/chats_page.dart';
import 'package:connect_social_app/modules/home/manager/pages_manager/home_pages_manager_cubit.dart';
import 'package:connect_social_app/modules/home/presentation/widgets/nav_bar.dart';
import 'package:connect_social_app/presentation/screens/main/feed.dart';
import 'package:connect_social_app/presentation/screens/main/profile.dart';
import 'package:connect_social_app/presentation/widgets/logo_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePagesManagerCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const LogoText(),
          scrolledUnderElevation: 2,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => MainRoutes.settingsPage(context),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        extendBody: true,
        body: BlocBuilder<HomePagesManagerCubit, HomePagesManagerState>(
          builder: (context, state) {
            var pageManager = HomePagesManagerCubit.get(context);
            return IndexedStack(
              index: pageManager.selectedPageIndex,
              children: const [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Numbers.paddingMedium),
                  child: SingleChildScrollView(child: Feed()),
                ),
                ProfilePage(),
                ChatsPage(),
              ],
            );
          },
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 100,
            vertical: Numbers.paddingMedium,
          ),
          child: CustomNavBar(),
        ),
      ),
    );
  }
}
