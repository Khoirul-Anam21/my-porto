import 'package:flutter/material.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:porto_web/themes/light_colors.dart';
import 'package:provider/provider.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          const Expanded(flex: 15, child: Center(child: Text("MY PROJECTS"))),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: isDark
                        ? AppDarkTheme.kMainColorTwo
                        : AppLightTheme.kMainColorTwo,
                    boxShadow: isDark
                        ? null
                        : const [
                            BoxShadow(
                                offset: Offset(-4, 0),
                                color: Colors.black26,
                                blurRadius: 8,
                                spreadRadius: 2)
                          ]),
              ))
        ],
      ),
    );
  }
}
