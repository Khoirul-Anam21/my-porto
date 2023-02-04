import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/global_vars/global_vars.dart';
import 'package:porto_web/providers/project_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:porto_web/themes/light_colors.dart';
import 'package:provider/provider.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    Map<String, dynamic>? project =
        context.watch<ProjectProvider>().currentProject;

    return Row(
      children: [
        Expanded(
          flex: 15,
          child: Container(
              color: isDark
                  ? AppDarkTheme.kMainColorTwo
                  : AppLightTheme.kMainColorTwo,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ProjectsScrollerWidget(),
                  Center(
                      child: project == null
                          ? const Text("not yet exist")
                          : Text(project['desc'])),
                  const Center(child: Text("MY PROJECTS")),
                ],
              )),
        ),
        Expanded(
            flex: 1,
            child: Container(
                color: isDark ? AppDarkTheme.kMainColorOne : Colors.white)),
      ],
    );
  }
}

class ProjectsScrollerWidget extends StatelessWidget {
  const ProjectsScrollerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Stack(
      children: [
        Row(
          children: [
            const Expanded(flex: 1, child: SizedBox.shrink()),
            Expanded(
              flex: 5,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    color: AppDarkTheme.kMainColorOne,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(40))),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox.shrink())
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.chevron_left_rounded,
                color: isDark
                    ? AppLightTheme.kMainColorTwo
                    : AppDarkTheme.kMainColorTwo,
                size: 80,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                    },
                  ),
                  child: SizedBox(
                    height: 250,
                    child: GridView.count(
                      mainAxisSpacing: 45.0,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      children: List<Widget>.from(PersonalData.projects.map(
                          (project) => ProjectGrid(
                              id: project['id'],
                              img: project['img'],
                              title: project['title']))),
                    ),
                  ),
                ),
              ),
              Icon(Icons.chevron_right_rounded,
                  color: isDark
                      ? AppLightTheme.kMainColorTwo
                      : AppDarkTheme.kMainColorTwo,
                  size: 80),
            ],
          ),
        )
      ],
    );
  }
}
