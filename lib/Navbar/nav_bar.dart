import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/home/home_screen.dart';
import 'package:newsapp/main_search_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> screens = [HomeScreen(), MainSearchScreen()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xffFFA500),
        color: Color(0xff001F3F),
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(Icons.search, size: 30, color: Colors.white,),
        ],
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
