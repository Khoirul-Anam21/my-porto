import 'package:flutter/cupertino.dart';

class NavigationStateProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set changeIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
