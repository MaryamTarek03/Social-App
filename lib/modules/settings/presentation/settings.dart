import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/modules/settings/presentation/manager/settings_cubit/app_manager_cubit.dart';
import 'package:connect_social_app/modules/settings/presentation/pages/language_choice_page.dart';
import 'package:connect_social_app/modules/settings/presentation/pages/theme_choice_page.dart';
import 'package:connect_social_app/modules/settings/presentation/widgets/settings_block.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
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
                      appManager.themeMode == ThemeMode.light
                          ? const Icon(Icons.light_mode_rounded)
                          : const Icon(Icons.dark_mode_rounded),
                      VibeText(text: 'Toggle Dark/Light theme'),
                      appManager.toggleDarkMode,
                      false,
                    ],
                    [
                      const Icon(Icons.palette_rounded),
                      VibeText(text: 'Choose a theme'),
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThemeChoicesPage(),
                          )),
                      true,
                    ],
                    [
                      const Icon(Icons.language),
                      VibeText(text: 'Choose a language'),
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
