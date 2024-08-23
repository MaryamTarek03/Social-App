import 'package:connect_social_app/modules/settings/presentation/manager/settings_cubit/app_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomonNavBar extends StatelessWidget {
  const SalomonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppManagerCubit, AppManagerState>(
      listener: (context, state) {},
      builder: (context, state) {
        var appManager = AppManagerCubit.get(context);
        return SalomonBottomBar(
          currentIndex: appManager.selectedPageIndex,
          onTap: (index) => appManager.setSelectedPageIndex(index),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        );
      },
    );
  }
}
