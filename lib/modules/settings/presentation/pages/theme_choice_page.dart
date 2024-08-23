import 'package:connect_social_app/core/config/constants/enums.dart';
import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/modules/settings/presentation/manager/settings_cubit/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:connect_social_app/core/widgets/fit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeChoicesPage extends StatelessWidget {
  const ThemeChoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: VibeText(
          text: 'Choose a theme',
          fontSize: Numbers.appBarTitleSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Numbers.paddingLarge),
        child: MyFitContainer(
          minWidth: 650,
          maxWidth: 650,
          margin: 0,
          padding: Numbers.paddingLarge,
          child: BlocBuilder<AppManagerCubit, AppManagerState>(
            builder: (context, state) {
              var appManager = AppManagerCubit.get(context);
              return ListView.builder(
                itemCount: MyTheme.values.length,
                itemBuilder: (context, index) => RadioListTile(
                  title: VibeText(text: themeNames[MyTheme.values[index]]!),
                  groupValue: appManager.themeCode,
                  value: MyTheme.values[index],
                  onChanged: (value) => appManager.setTheme(value!),
                  activeColor: Theme.of(context).colorScheme.primary,
                  fillColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
