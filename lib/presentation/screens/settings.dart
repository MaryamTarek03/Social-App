import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/logic/cubit/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/widgets/common_text.dart';
import 'package:connect_social_app/presentation/widgets/fit_container.dart';
import 'package:connect_social_app/presentation/widgets/material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AppManagerCubit, AppManagerState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppManagerCubit appManager = AppManagerCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              Padding(
                padding: const EdgeInsets.all(Numbers.paddingLarge),
                child: SettingsItem(
                  blockTitle: S.of(context).settingsGeneral,
                  appManager: appManager,
                  widgets: [
                    [
                      const Icon(Icons.palette),
                      CommonText(text: S.of(context).settingsToggleTheme),
                      appManager.toggleTheme,
                    ],
                    [
                      const Icon(Icons.language),
                      CommonText(text: S.of(context).settingsToggleLang),
                      appManager.toggleLanguage,
                    ],
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final List<List> widgets;
  final String blockTitle;
  final AppManagerCubit appManager;

  const SettingsItem({
    super.key,
    required this.blockTitle,
    required this.widgets,
    required this.appManager,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(text: blockTitle),
        MyFitContainer(
          minWidth: 650,
          maxWidth: 650,
          margin: 0,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => MyMaterialButton(
              onPressed: widgets[index][2],
              child: ListTile(
                leading: widgets[index][0],
                title: widgets[index][1],
              ),
            ),
            itemCount: widgets.length,
          ),
        ),
      ],
    );
  }
}
