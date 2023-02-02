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
    return Row(
      children: [
        Expanded(
          flex: 15,
          child: Container(
              color:
                  isDark ? AppDarkTheme.kMainColorTwo : AppLightTheme.kMainColorTwo,
              child: const Center(child: Text("MY PROJECTS"))),
        ),
            Expanded(flex: 1, child: Container(color: isDark ?  AppDarkTheme.kMainColorOne : Colors.white)),
      ],
    );
  }
}
