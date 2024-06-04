import 'package:flutter/material.dart';
import 'package:flutter_project1/screens/profile_screen.dart';
import 'package:flutter_project1/utils/colors.dart';  // Ensure the path to colors.dart is correct
import 'package:flutter_project1/homepage.dart';
import 'package:flutter_project1/screens/ticket_screen.dart';

class SimpleBottomNavigation extends StatefulWidget {
  const SimpleBottomNavigation({Key? key}) : super(key: key);

  @override
  State<SimpleBottomNavigation> createState() => _SimpleBottomNavigationState();

}

class _SimpleBottomNavigationState extends State<SimpleBottomNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Homepages(),
    TicketScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:Theme.of(context).copyWith(
        canvasColor: main1,
      ),
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: upper1,
          unselectedItemColor: lower1,

          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: _navBarItems,
        ),
      ),


    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.sticky_note_2_outlined),
    activeIcon: Icon(Icons.sticky_note_2_sharp),
    label: 'Tickets',
  ),
  // BottomNavigationBarItem(
  //   icon: Icon(Icons.shopping_bag_outlined),
  //   activeIcon: Icon(Icons.shopping_bag),
  //   label: 'Cart',
  // ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];