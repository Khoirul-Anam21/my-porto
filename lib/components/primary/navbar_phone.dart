import 'package:flutter/material.dart';
import 'package:porto_web/components/nav_data.dart';

class NavBarPhone extends StatelessWidget {
  const NavBarPhone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        items: navigationBars
            .map((nav) =>
                BottomNavigationBarItem(icon: Icon(nav['icon']), label: nav['title']))
            .toList());
  }
}
