import 'package:flutter/widgets.dart';
import 'package:porto_web/global_vars/global_vars.dart';

class ProjectProvider extends ChangeNotifier {
  Map<String, dynamic>? _currentProject;

  Map<String, dynamic>? get currentProject => _currentProject;

  set switchProject(int id) {
    var selectedProject =
        PersonalData.projects
            .where((element) => element['id'] == id)
            .toList();
    _currentProject = selectedProject[0].cast<String, dynamic>();
    notifyListeners();
  }
}
