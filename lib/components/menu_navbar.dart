import 'package:flutter/material.dart';

class MenuNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const MenuNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Assignments',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color(0xffFF7426),
      onTap: onItemTapped,
      unselectedItemColor: const Color(0xff333333),
      backgroundColor: const Color(0xffFDF8EE),
    );
  }
}
