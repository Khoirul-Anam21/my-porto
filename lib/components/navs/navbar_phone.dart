

import 'package:flutter/material.dart';
import 'package:porto_web/components/nav_data.dart';
import 'package:porto_web/providers/navigation_state_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class NavBarPhone extends StatefulWidget {
  const NavBarPhone({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarPhone> createState() => _NavBarPhoneState();
}

class _NavBarPhoneState extends State<NavBarPhone> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Container(
      decoration: BoxDecoration(
        border: isDark? const Border(top: BorderSide(color: Colors.amber)): const Border(right: BorderSide(color: Colors.white))
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        onTap: (val){
          context.read<NavigationStateProvider>().changeIndex = val;
          context.read<NavigationStateProvider>().changePageTo = val;
        },
        backgroundColor: isDark? Colors.black54 : Colors.amber,
          currentIndex: context.watch<NavigationStateProvider>().navIndex,
          items: navigationBars
              .map((nav) =>
                  BottomNavigationBarItem(icon: Icon(nav['icon']), label: nav['title']))
              .toList()),
    );
  }
}
