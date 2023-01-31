import 'package:flutter/material.dart';
import 'package:porto_web/views/view_lib.dart';


final List<Map> navigationBars = [
  {"icon": Icons.people, "title": "About Me", "widget": const IdentityView()},
  {"icon": Icons.settings, "title": "My Skills", "widget": const SkillsView()},
  {"icon": Icons.list, "title": "My Projects", "widget": const ProjectsView()},
  {"icon": Icons.cast_for_education, "title": "My Educations", "widget": const EducationsView()}
];

