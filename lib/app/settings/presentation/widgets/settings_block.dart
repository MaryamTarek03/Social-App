import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/app/settings/presentation/manager/settings_cubit/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:connect_social_app/presentation/widgets/custom/fit_container.dart';
import 'package:connect_social_app/presentation/widgets/custom/material_button.dart';
import 'package:flutter/material.dart';

class SettingsBlock extends StatelessWidget {
  final List<List> widgets;
  final String blockTitle;
  final AppManagerCubit appManager;

  const SettingsBlock({
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
        VibeText(
          text: blockTitle,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        MyFitContainer(
          minWidth: 650,
          maxWidth: 650,
          margin: 0,
          padding: Numbers.paddingSmall,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => MyMaterialButton(
              onPressed: widgets[index][2],
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: widgets[index][0],
                title: widgets[index][1],
                trailing: (widgets[index][3])
                    ? const Icon(Icons.arrow_forward_ios_rounded)
                    : null,
              ),
            ),
            itemCount: widgets.length,
          ),
        ),
      ],
    );
  }
}
