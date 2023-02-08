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
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (isDarkTheme) {
            return AppLightTheme.kMainColorTwo;
          }
          return AppDarkTheme.kMainColorTwo;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) =>
            isDarkTheme
                ? AppDarkTheme.kMainColorTwo
                : AppLightTheme.kMainColorTwo),
      )),
      textTheme: TextTheme(
        headline6: TextStyle(
              color: isDarkTheme
                  ? Colors.white  
                  : AppDarkTheme.kMainColorTwo,),
          bodyText2: TextStyle(
              color: isDarkTheme
                  ? AppLightTheme.kMainColorTwo
                  : AppDarkTheme.kMainColorTwo)),
      scaffoldBackgroundColor:
          isDarkTheme ? AppDarkTheme.kMainColorOne : Colors.white,
      primarySwatch: isDarkTheme
          ? createMaterialColor(AppDarkTheme.kMainColorOne)
          : createMaterialColor(AppLightTheme.kMainColorOne),
      primaryColor: isDarkTheme
          ? AppLightTheme.kMainColorTwo
          : AppDarkTheme.kMainColorTwo,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: isDarkTheme ? Colors.white : Colors.black,
        unselectedIconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white60 : Colors.black54),
        selectedIconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        selectedItemColor: isDarkTheme ? Colors.white : Colors.black,
      ),
      navigationRailTheme: NavigationRailThemeData(
        elevation: 50.0,
        backgroundColor: isDarkTheme ? Colors.blueGrey[900] : Colors.white,
        unselectedLabelTextStyle: unselectedNavRailLabelStyle,
        unselectedIconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white60 : Colors.black54),
        selectedIconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        selectedLabelTextStyle: selectedNavRailLabelStyle,
      ),
      backgroundColor: isDarkTheme ? Colors.blueGrey[800] : Colors.white,
      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
      highlightColor:
          isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme
          ? createMaterialColor(const Color.fromARGB(0, 24, 36, 255))
          : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.black),
    );
  }
}
