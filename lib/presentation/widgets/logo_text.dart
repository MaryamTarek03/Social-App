import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/modules/settings/presentation/manager/settings_cubit/app_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LogoText extends StatelessWidget {
  const LogoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppManagerCubit, AppManagerState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppManagerCubit appManager = AppManagerCubit.get(context);
        Color color = Theme.of(context).dividerColor;

        var englishFont = GoogleFonts.comicNeue(
          fontSize: 32,
          color: color,
          fontWeight: FontWeight.bold,
        );
        var arabicFont = GoogleFonts.cairoPlay(
          fontSize: 32,
          color: color,
          fontWeight: FontWeight.bold,
        );
        return Text(
          S.of(context).platformName,
          style: appManager.language == const Locale('en')
              ? englishFont
              : arabicFont,
        );
      },
    );
  }
}
