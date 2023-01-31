import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:porto_web/themes/light_colors.dart';
import 'package:provider/provider.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Container(
      decoration: BoxDecoration(
        color:
            isDark ? AppDarkTheme.kMainColorTwo : AppLightTheme.kMainColorTwo,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: Text("MY SKILLS", style: Theme.of(context).textTheme.headline3,)),
          const SkillsCircle()
        ],
      ),
    );
  }
}
