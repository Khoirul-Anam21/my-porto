import 'package:flutter/cupertino.dart';

class NavigationStateProvider extends ChangeNotifier {
  int _index = 0;
  int _navIndex = 0;
  late final PageController _pageController =
      PageController(initialPage: _index, keepPage: false);

  int get index => _index;
  int get navIndex => _navIndex;
  PageController get mainPageController => _pageController;

  set changeIndex(int value) {
    _navIndex = value;
    // _index = value;
    notifyListeners();
  }

  set changePageTo(int value) {
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 650), curve: Curves.easeInOut);
    _index = value;
    notifyListeners();
  }
}
