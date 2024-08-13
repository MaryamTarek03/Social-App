import 'package:connect_social_app/config/constants/text_style.dart';
import 'package:connect_social_app/logic/cubit/app_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CommonText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final int maxLines;
  Color? color;
  TextAlign? alignment;

  CommonText({
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
          style: appManager.language == const Locale('en')
              ? englishStyle(
                  fontSize: fontSize,
                  color: color ?? Theme.of(context).dividerColor,
                  fontWeight: fontWeight,
                )
              : arabicStyle(
                  fontSize: fontSize,
                  color: color ?? Theme.of(context).dividerColor,
                  fontWeight: fontWeight,
                ),
        );
      },
    );
  }
}
