import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/data/app_data.dart';
import 'package:connect_social_app/modules/settings/presentation/manager/settings_cubit/app_manager_cubit.dart';
import 'package:connect_social_app/modules/settings/presentation/settings.dart';
import 'package:connect_social_app/presentation/screens/main/profile.dart';
import 'package:connect_social_app/core/widgets/fit_container.dart';
import 'package:connect_social_app/presentation/widgets/custom/drawer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Function()> listButtonFunctions = [
      () => Navigator.pop(context),
      () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          ),
        );
      },
      () {},
      () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingsPage(),
          ),
        );
      },
      () {
        Navigator.pop(context);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => LoginScreen(),
        //   ),
        // );
      },
    ];
    return BlocBuilder<AppManagerCubit, AppManagerState>(
      builder: (context, state) {
        AppManagerCubit appManager = AppManagerCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(
            bottom: Numbers.paddingSmall,
            left: appManager.language == const Locale('en')
                ? Numbers.paddingMedium
                : 0,
            right: appManager.language == const Locale('ar')
                ? Numbers.paddingMedium
                : 0,
          ),
          child: SingleChildScrollView(
            child: MyFitContainer(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Numbers.paddingLarge),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      radius: 75,
                    ),
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      if (index == listButton.length - 2) {
                        return Column(
                          children: [
                            const SizedBox(height: 100),
                            Divider(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            ListButton(
                              listButton: listButton[index],
                              onPressed: listButtonFunctions[index],
                            )
                          ],
                        );
                      }
                      return ListButton(
                        listButton: listButton[index],
                        onPressed: listButtonFunctions[index],
                      );
                    },
                    itemCount: listButton.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
