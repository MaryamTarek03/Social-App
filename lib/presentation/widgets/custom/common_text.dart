import 'package:connect_social_app/core/config/constants/text_style.dart';
import 'package:connect_social_app/logic/cubit/app_manager/app_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class VibeText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final int maxLines;
  Color? color;
  TextAlign? alignment;

  VibeText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 10,
    this.color,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppManagerCubit, AppManagerState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppManagerCubit appManager = AppManagerCubit.get(context);
        return Text(
          text,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: alignment,
          style: appManager.language == const Locale('ar')
              ? arabicStyle(
                  fontSize: fontSize,
                  color: color ?? Theme.of(context).dividerColor,
                  fontWeight: fontWeight,
                )
              : englishStyle(
                  fontSize: fontSize,
                  color: color ?? Theme.of(context).dividerColor,
                  fontWeight: fontWeight,
                ),
        );
      },
    );
  }
}
