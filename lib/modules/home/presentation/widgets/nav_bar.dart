import 'dart:ui';

import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/modules/home/manager/pages_manager/home_pages_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(index) {
      int currentIndex =
          context.read<HomePagesManagerCubit>().selectedPageIndex;
      if (currentIndex == index) {
        return Colors.white;
      } else {
        return Colors.white.withOpacity(0.4);
      }
    }

    return BlocBuilder<HomePagesManagerCubit, HomePagesManagerState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(Numbers.radiusLarge),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withAlpha(100),
                borderRadius: BorderRadius.circular(Numbers.radiusLarge),
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.outline),
                // gradient: const LinearGradient(
                //   colors: [
                //     Colors.purpleAccent,
                //     Colors.pinkAccent,
                //     Colors.amber,
                //   ],
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    child: IconButton(
                      onPressed: () {
                        context
                            .read<HomePagesManagerCubit>()
                            .setSelectedPageIndex(0);
                      },
                      icon: Icon(
                        Icons.home,
                        color: getColor(0),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<HomePagesManagerCubit>()
                          .setSelectedPageIndex(1);
                    },
                    icon: const Icon(CupertinoIcons.profile_circled),
                    color: getColor(1),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<HomePagesManagerCubit>()
                          .setSelectedPageIndex(2);
                    },
                    icon: Icon(
                      CupertinoIcons.chat_bubble_2_fill,
                      color: getColor(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
