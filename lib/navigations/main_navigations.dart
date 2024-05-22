import 'package:flutter/material.dart';
import 'package:wasong_mobile_app/components/menu_navbar.dart';
import 'package:wasong_mobile_app/screens/assignments_screeen.dart';
import 'package:wasong_mobile_app/screens/home_screen.dart';

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Define titles for each screen
  final List<String> _screenTitles = ['Home', 'Assignments', 'Profile'];

  // Define screens
  final List<Widget> _screens = [
    const HomeScreen(),
    const AssignmentsScreen(),
    ScreenThree(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _screenTitles[_selectedIndex]), // Update app bar title dynamically
        backgroundColor: const Color.fromRGBO(253, 248, 238, 1),
        shadowColor: const Color.fromRGBO(51, 51, 51, 0.5),
        elevation: 2.0,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: MenuNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen'),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
