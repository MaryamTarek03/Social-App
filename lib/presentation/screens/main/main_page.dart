import 'package:connect_social_app/logic/cubit/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/screens/main/feed.dart';
import 'package:connect_social_app/presentation/widgets/drawer.dart';
import 'package:connect_social_app/presentation/widgets/logo_text.dart';
import 'package:connect_social_app/presentation/widgets/navigation_bar.dart';
import 'package:connect_social_app/presentation/widgets/test/test_container.dart';
import 'package:connect_social_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppManagerCubit, AppManagerState>(
      listener: (context, state) {},
      builder: (context, state) {
        var appManager = AppManagerCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const LogoText(),
                const SizedBox(width: 35),
                MyNavigationBar(
                  onTap: appManager.setSelectedPageIndex,
                  currentIndex: appManager.selectedPageIndex,
                ),
              ],
            ),
            elevation: 0,
            scrolledUnderElevation: 2,
            shadowColor: Colors.black,
            surfaceTintColor: Theme.of(context).colorScheme.onBackground,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!Responsive.isMobile(context))
                const Flexible(child: MyDrawer()),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 3, child: Feed()),
                      if (Responsive.isDesktop(context))
                        const Expanded(
                          child: TestContainer(),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          drawer: Responsive.isMobile(context) ? const MyDrawer() : null,
        );
      },
    );
  }
}
