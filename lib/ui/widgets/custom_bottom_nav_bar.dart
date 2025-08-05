import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final void Function(int)? onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.teal.shade800,
      backgroundColor: Colors.white,
      unselectedFontSize: 13,
      selectedFontSize: 18,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.message_rounded),label: 'Messajes'),
        BottomNavigationBarItem(icon: Icon(Icons.call_sharp), label: 'Calls'),
        BottomNavigationBarItem(icon: Icon(Icons.account_box),label: 'Contacts'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onTap: onTap,
      currentIndex: currentIndex,
    );
  }
}
