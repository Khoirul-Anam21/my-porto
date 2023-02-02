import 'dart:async';

import 'package:circular_rotation/circular_rotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/global_vars/global_vars.dart';
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
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(cSize / 2)),
        child: CircularRotation(
          circularRotationProperty: CircularRotationModel(
              centerWidget: const AnimatedTechName(),
              visibleThirdCircle: false,
              visibleSecondCircle: false,
              visibleFirstCircle: true,
              firstCircleStrokeColor: Colors.transparent,
              startAnimation: true,
              repeatAnimation: true,
              firstCircleAnimationDuration: 14000,
              firstCircleRadius: 40,
              firstCircleWidgets: List<Widget>.from(PersonalData.skills
                  .map((skill) => Transform.scale(
                        scale: 1.7,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color:
                                  isDark ? AppLightTheme.kMainColorTwo : null,
                              border: isDark
                                  ? null
                                  : Border.all(
                                      color: AppDarkTheme.kMainColorTwo,
                                      width: 4.0)),
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            skill['svg'],
                            matchTextDirection: true,
                          ),
                        ),
                      ))
                  .toList())),
        ));
  }
}

class AnimatedTechName extends StatefulWidget {
  const AnimatedTechName({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedTechName> createState() => _AnimatedTechNameState();
}

class _AnimatedTechNameState extends State<AnimatedTechName> {
  late final Timer _timer;
  late int _counter;
  late final List<String> _techNames;
  late final List<Text> _techWidgets = _techNames
      .map((name) => Text(
            name,
            key: ValueKey(name),
          ))
      .toList();
  late Text _currentText;

  @override
  void initState() {
    super.initState();
    _techNames =
        List<String>.from(PersonalData.skills.map((skill) => skill['name']).toList());
    _counter = 0;
    _currentText = _techWidgets[0];
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentText = _techWidgets[_counter];
      });
      _counter++;
      if (_counter > 5) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Container(
        width: 140,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          boxShadow: isDark? null : [
             BoxShadow(
              offset: const Offset(5, 4),
              color: AppDarkTheme.kMainColorTwo.withOpacity(0.6),
              blurRadius: 6.0,
              spreadRadius: -3.0
            )
          ],
            borderRadius: BorderRadius.circular(20),
            color: isDark ? null : AppLightTheme.kMainColorTwo ,
            border:
                isDark ? Border.all(color: AppLightTheme.kMainColorTwo, width: 3) : null),
        child: AnimatedSwitcher(
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: ((child, animation) {
            final offsetAnimation = Tween<Offset>(
                    begin: const Offset(0.0, -0.5), end: const Offset(0.0, 0.0))
                .animate(animation);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          }),
          duration: const Duration(milliseconds: 400),
          child: _currentText,
        ));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
