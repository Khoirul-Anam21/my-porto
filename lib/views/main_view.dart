import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/providers/navigation_state_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:porto_web/themes/light_colors.dart';
import 'package:porto_web/views/view_lib.dart';
import 'package:provider/provider.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NavBarLarge(),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              },
            ),
            child: PageView(
              controller:
                  context.watch<NavigationStateProvider>().mainPageController,
              onPageChanged: (val) {
                context.read<NavigationStateProvider>().changeIndex = val;
              },
              children: const [
                IdentityView(),
                ProjectsView(),
                SkillsView(),
                EducationsView()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IdentityView extends StatelessWidget {
  const IdentityView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Container(
      padding: const EdgeInsets.only(right: 40, left: 0, top: 40, bottom: 40),
      child: Container(
          decoration: BoxDecoration(
              border: isDark ? Border.all(color: Colors.amber.withOpacity(0.2)) : null,
              boxShadow: isDark
                  ? null
                  : <BoxShadow>[
                      BoxShadow(
                        offset: const Offset(8, 8),
                        color: Colors.black26.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ],
              color: isDark
                  ? AppDarkTheme.kMainColorTwo
                  : AppLightTheme.kMainColorTwo,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: const Center(child: Text("TES"))),
    );
  }
}

// class AboutView extends StatelessWidget {
//   const AboutView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = context.watch<DarkThemeProvider>().darkTheme;
//     print(isDark);
//     return Container(
//       color: Color.fromARGB(0, 125, 130, 190),
//       // child: Row(
//       //   children: const [
//       //     Expanded(child: IntroTitle()),
//       //     Expanded(child: IntroImage()),
//       //   ],
//       // ),
//     );
//   }
// }
