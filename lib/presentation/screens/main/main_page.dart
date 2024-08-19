import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/screens/main/feed.dart';
import 'package:connect_social_app/presentation/screens/notification_page.dart';
import 'package:connect_social_app/presentation/widgets/ui/drawer.dart';
import 'package:connect_social_app/presentation/widgets/logo_text.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoText(),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Numbers.paddingSmall),
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              ),
              icon: Icon(
                Icons.notifications,
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          // Container(
          //   width: 60,
          //   height: 60,
          //   margin: const EdgeInsets.all(Numbers.paddingMedium),
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //       color: Theme.of(context).colorScheme.primary,
          //       borderRadius: BorderRadius.circular(Numbers.radiusMedium)),
          //   child: MyMaterialButton(
          //     onPressed: () => Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const NotificationPage(),
          //       ),
          //     ),
          //     child: const Icon(
          //       Icons.notifications,
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ],
        scrolledUnderElevation: 2,
        centerTitle: true,
        surfaceTintColor: Theme.of(context).colorScheme.onBackground,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: Numbers.paddingMedium),
        child: SingleChildScrollView(child: Feed()),
      ),
      drawer: const MyDrawer(),
    );
  }
}

// class ResponsiveMainBody extends StatelessWidget {
//   const ResponsiveMainBody({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (!Responsive.isMobile(context)) const Flexible(child: MyDrawer()),
//         Expanded(
//           flex: 3,
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Expanded(
//                     flex: 3,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: Numbers.paddingMedium),
//                       child: Feed(),
//                     )),
//                 if (Responsive.isDesktop(context))
//                   const Expanded(
//                     child: TestContainer(),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
