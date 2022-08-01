import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const String kThemeStatus = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(kThemeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kThemeStatus) ?? false;
  }
}