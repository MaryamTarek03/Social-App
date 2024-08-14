import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/logic/cubit/app_manager/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:connect_social_app/presentation/widgets/settings/language_choice_page.dart';
import 'package:connect_social_app/presentation/widgets/settings/settings_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: BlocConsumer<AppManagerCubit, AppManagerState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppManagerCubit appManager = AppManagerCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(Numbers.paddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                SettingsBlock(
                  blockTitle: S.of(context).settingsGeneral,
                  appManager: appManager,
                  widgets: [
                    [
                      const Icon(Icons.palette),
                      VibeText(text: S.of(context).settingsToggleTheme),
                      appManager.toggleTheme,
                      true,
                    ],
                    [
                      const Icon(Icons.language),
                      VibeText(text: S.of(context).settingsToggleLang),
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LanguageChoicesPage(),
                          )),
                      true,
                    ],
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      title: VibeText(
        text: S.of(context).settings,
        fontSize: Numbers.appBarTitleSize,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    );
  }
}
