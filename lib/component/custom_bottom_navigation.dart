import 'package:flutter/material.dart';

/// カスタムしたボトムナビゲーションバーのウィジェット
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          icon: Icon(
            Icons.home,
            color: currentIndex == 0
                ? Theme.of(context).colorScheme.onSecondaryContainer
                : null,
          ),
          label: '海外情報',
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          icon: Icon(
            Icons.attach_money,
            color: currentIndex == 1
                ? Theme.of(context).colorScheme.onSecondaryContainer
                : null,
          ),
          label: '相場情報',
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          icon: Icon(
            Icons.accessibility,
            color: currentIndex == 2
                ? Theme.of(context).colorScheme.onSecondaryContainer
                : null,
          ),
          label: '現地人のコーデ',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedItemColor: Theme.of(context).colorScheme.onSurface,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
