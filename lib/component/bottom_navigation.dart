import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? Colors.purple : null,
          ),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.attach_money,
            color: currentIndex == 1 ? Colors.purple : null,
          ),
          label: '相場情報',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.language,
            color: currentIndex == 2 ? Colors.purple : null,
          ),
          label: '海外情報',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.accessibility,
            color: currentIndex == 3 ? Colors.purple : null,
          ),
          label: '現地のコーデ',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.purple.shade50,
      selectedItemColor: Colors.purple,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
