import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/providers/navigation_state_provider.dart';
import 'package:porto_web/views/view_lib.dart';
import 'package:provider/provider.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  // PageController _renderPageController() {
  //   return PageController(
  //       initialPage: context.read<NavigationStateProvider>().index);
  // }

  @override
  void initState() {
    // _renderPageController();
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
                // context.read<NavigationStateProvider>().changePageTo = val;
              },
              children: const [
                AboutView(),
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

class AboutView extends StatelessWidget {
  const AboutView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyanAccent,
      child: const Center(child: Text("ABOUT ME")),
    );
    // return Expanded(
    //   flex: 8,
    //   child: Row(
    //     children: const [
    //       Expanded(child: IntroTitle()),
    //       Expanded(child: IntroImage()),
    //     ],
    //   ),
    // );
  }
}
