import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/data/app_data/list_button_data.dart';
import 'package:connect_social_app/logic/cubit/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/screens/settings.dart';
import 'package:connect_social_app/presentation/widgets/fit_container.dart';
import 'package:connect_social_app/presentation/widgets/list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Function()> listButtonFunctions = [
      () {},
      () {},
      () {},
      () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          ),
      () {},
    ];
    return BlocBuilder<AppManagerCubit, AppManagerState>(
      builder: (context, state) {
        AppManagerCubit appManager = AppManagerCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(
            bottom: Numbers.paddingLarge,
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