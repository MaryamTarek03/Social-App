import 'package:connect_social_app/core/config/constants/enums.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/modules/authentication/authentication_page.dart';
import 'package:connect_social_app/modules/settings/presentation/manager/settings_cubit/app_manager_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(/*DevicePreview(builder: (context) =>*/ const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppManagerCubit(),
      child: BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
          AppManagerCubit appManager = AppManagerCubit.get(context);
          return MaterialApp(
            title: 'Connect',
            debugShowCheckedModeBanner: false,
            theme: lightThemeData[appManager.themeCode], 
            darkTheme: darkThemeData[appManager.themeCode],
            themeMode: appManager.themeMode,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: appManager.language,
            
            home: const AuthenticationPage(),
          );
        },
      ),
    );
  }
}
