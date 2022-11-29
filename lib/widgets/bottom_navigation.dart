import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.deepPurple[200],
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.graduationCap,
              size: 20,
            ),
            label: "Topics"),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bolt,
              size: 20,
            ),
            label: "About"),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.circleUser,
              size: 20,
            ),
            label: "Profile")
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            break;
          case 1:
            Navigator.pushNamed(context, "/about");
            break;
          case 2:
            Navigator.pushNamed(context, "/profile");
            break;
        }
      },
    );
  }
}
