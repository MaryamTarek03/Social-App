import 'package:connect_social_app/config/constants/enums.dart';
import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/logic/cubit/app_manager/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:connect_social_app/presentation/widgets/custom/fit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageChoicesPage extends StatelessWidget {
  const LanguageChoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: VibeText(
          text: 'Choose a language',
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
                itemCount: Language.values.length,
                itemBuilder: (context, index) => RadioListTile(
                  title: VibeText(text: languageNames[Language.values[index]]!),
                  groupValue: appManager.languageCode,
                  value: Language.values[index],
                  onChanged: (value) => appManager.setLanguage(value!),
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
