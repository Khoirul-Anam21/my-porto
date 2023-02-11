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
    Color miscColor = isDark ? Colors.white : AppDarkTheme.kMainColorOne;

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
                  Column(
                    children: [
                      const ProjectsScrollerWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Column(
                          children: [
                            project == null
                                ? const Text("not yet exist")
                                : Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          project['title'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        RepoWidget(repo: project['repo']),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(project['desc']),
                                    TechWidget(
                                      techs: List<String>.from(project['tech']),
                                    ),
                                  ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ProjectsViewTitle(miscColor: miscColor),
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

class ProjectsViewTitle extends StatelessWidget {
  const ProjectsViewTitle({
    Key? key,
    required this.miscColor,
  }) : super(key: key);

  final Color miscColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Divider(
                  color: miscColor,
                ),
              )),
              Text(
                "My Projects",
                style: Theme.of(context).textTheme.headline3,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Divider(
                  color: miscColor,
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Visit my repositories at  "),
              RepoButton(
                color: miscColor,
                svgImg: 'assets/icons8-github-bw.svg',
                urlDest: PersonalData.githubURL,
              ),
              const SizedBox(
                width: 5,
              ),
              RepoButton(
                  color: miscColor,
                  svgImg: 'assets/icons8-gitlab.svg',
                  urlDest: PersonalData.gitlabURL)
            ],
          ),
        ],
      ),
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
                    height: 140,
                    child: GridView.count(
                      childAspectRatio: 0.5,
                      mainAxisSpacing: 15.0,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      children: List<Widget>.from(PersonalData.projects.map(
                        (project) => ProjectGrid(
                          id: project['id'],
                          img: project['img'],
                          title: project['title'],
                          appCat: project['app'],
                        ),
                      )),
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
