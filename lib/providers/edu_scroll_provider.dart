import 'package:flutter/widgets.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class EducationScrollControllerProvider extends ChangeNotifier{

  final LinkedScrollControllerGroup _scrollGroup = LinkedScrollControllerGroup();
  late final ScrollController _dotController;
  late final ScrollController _eduController;

  ScrollController get dotController => _dotController;
  ScrollController get eduController => _eduController;

  EducationScrollControllerProvider(){
    _dotController = _scrollGroup.addAndGet();
    _eduController = _scrollGroup.addAndGet();
  }

}