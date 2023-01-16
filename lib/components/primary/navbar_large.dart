import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/global_vars/global_vars.dart';
import 'package:porto_web/providers/navigation_state_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class NavBarLarge extends StatefulWidget {
  const NavBarLarge({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarLarge> createState() => _NavBarLargeState();
}

class _NavBarLargeState extends State<NavBarLarge> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    bool isSmallScreen =
        MediaQuery.of(context).size.width < ScreenSizeLib.smallWidth;
    return isSmallScreen
        ? const SizedBox.shrink()
        : Container(
            decoration: BoxDecoration(
                border: isDark
                    ? const Border(right: BorderSide(color: Colors.amber))
                    : const Border(right: BorderSide(color: Colors.white))),
            child: NavigationRail(
              backgroundColor: Theme.of(context).navigationRailTheme.backgroundColor,
                onDestinationSelected: (val) {
                  context.read<NavigationStateProvider>().changeIndex = val;
                  context.read<NavigationStateProvider>().changePageTo = val;
                },
                elevation: isDark ? 4.0 : 40.0,
                groupAlignment: 0.0,
                destinations: navigationBars
                    .map((nav) => NavigationRailDestination(
                        icon: Tooltip(
                            message: nav['title'], child: Icon(nav['icon'])),
                        label: Tooltip(
                            message: nav['title'], child: Text(nav['title']))))
                    .toList(),
                selectedIndex:
                    context.watch<NavigationStateProvider>().navIndex),
          );
  }
}
