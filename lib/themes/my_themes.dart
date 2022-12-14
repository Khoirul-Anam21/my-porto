import 'package:flutter/material.dart';
import 'package:porto_web/themes/material_color.dart';
import 'dark_colors.dart';
import 'light_colors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    TextStyle unselectedNavRailLabelStyle = isDarkTheme
        ? const TextStyle(
            color: Colors.white60,
          )
        : const TextStyle(
            color: Colors.black54,
          );
    TextStyle selectedNavRailLabelStyle = isDarkTheme
        ? const TextStyle(
            color: Colors.white,
          )
        : const TextStyle(
            color: Colors.black,
          );
    return ThemeData(
      primarySwatch: isDarkTheme
          ? createMaterialColor(AppDarkTheme.kMainColorOne)
          : createMaterialColor(AppLightTheme.kMainColorOne),
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: isDarkTheme ? Colors.white : Colors.black,
        unselectedIconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white60 : Colors.black54),
        selectedIconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        selectedItemColor: isDarkTheme ? Colors.white : Colors.black,
      ),
      navigationRailTheme: NavigationRailThemeData(
        unselectedLabelTextStyle: unselectedNavRailLabelStyle,
        unselectedIconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white60 : Colors.black54),
        selectedIconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        selectedLabelTextStyle: selectedNavRailLabelStyle,
      ),
      backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.black),
    );
  }
}
