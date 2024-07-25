import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/utils/responsive.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar(
      {super.key, required this.onTap, required this.currentIndex});

  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    Color getSelectedColor(int index) {
      return currentIndex == index
          ? Colors.white
          : Theme.of(context).dividerColor;
    }

    Color getSelectedContainerColor(int index) {
      return currentIndex == index
          ? Theme.of(context).colorScheme.tertiary
          : Colors.transparent;
    }

    return Row(
      children: [
        navigationBarItem(
          getSelectedContainerColor,
          0,
          const Icon(Icons.home_outlined),
          getSelectedColor,
        ),
        const SizedBox(width: 10),
        navigationBarItem(
          getSelectedContainerColor,
          1,
          const Icon(Icons.notifications_none_rounded),
          getSelectedColor,
        ),
      ],
    );
  }

  Container navigationBarItem(
    Color Function(int index) getSelectedContainerColor,
    int firstIndex,
    Widget icon,
    Color Function(int index) getSelectedColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: getSelectedContainerColor(firstIndex),
        borderRadius: BorderRadius.circular(Numbers.radiusMedium),
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => onTap(firstIndex),
        color: getSelectedColor(firstIndex),
      ),
    );
  }
}
