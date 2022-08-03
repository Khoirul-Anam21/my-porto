import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/global_vars/global_vars.dart';

class NavBarLarge extends StatelessWidget {
  const NavBarLarge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen =
        MediaQuery.of(context).size.width < ScreenSizeLib.smallWidth;
    return isSmallScreen ? const SizedBox.shrink() : NavigationRail(
        destinations: navigationBars
            .map((nav) => NavigationRailDestination(
                icon: Icon(nav['icon']), label: Text(nav['title'])))
            .toList(),
        selectedIndex: 0);
  }
}
