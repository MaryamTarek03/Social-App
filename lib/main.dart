import 'package:connect_social_app/config/themes/app_main_theme.dart';
import 'package:connect_social_app/logic/cubit/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/screens/mainScreen/main_page.dart';
import 'package:connect_social_app/presentation/widgets/responsive.dart';
import 'package:connect_social_app/presentation/widgets/test/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppManagerCubit(),
      child: BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Connect',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getLightTheme(),
            darkTheme: AppTheme.getDarkTheme(),
            home: const ResponsiveUI(
              mobileScaffold: MainPageMobile(),
              tabletScaffold: MainPageTablet(),
              desktopScaffold: MainPageDesktop(),
            ),
          );
        },
      ),
    );
  }
}
