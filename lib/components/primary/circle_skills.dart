import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:porto_web/themes/light_colors.dart';
import 'package:provider/provider.dart';

class SkillsCircle extends StatelessWidget {
  const SkillsCircle({super.key});

  @override
  Widget build(BuildContext context) {
    const double cSize = 480.0;
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Container(
        padding: const EdgeInsets.all(10),
        width: cSize,
        height: cSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cSize / 2)),
        child: CircularRotation(
          circularRotationProperty: CircularRotationModel(
              visibleThirdCircle: true,
              visibleSecondCircle: true,
              visibleFirstCircle: false,
              startAnimation: false,
              repeatAnimation: false,
              firstCircleAnimationDuration: 14000,
              firstCircleRadius:40,
              firstCircleWidgets: List<Widget>.from(skills
                  .map((skill) => Transform.scale(
                    scale: 1.7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: isDark? AppLightTheme.kMainColorTwo : null,
                        border: isDark? null: Border.all(color: AppDarkTheme.kMainColorTwo, width: 4.0)
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                          skill['svg'],
                          alignment: Alignment.centerLeft,
                          matchTextDirection: true,
                        ),
                    ),
                  ))
                  .toList())),
        ));
  }
}
