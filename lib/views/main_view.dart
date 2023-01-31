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
              children: List<Widget>.from(navigationBars.map((nav){
                return nav["widget"]; // perhatikan ini
              }).toList()),
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
              border: isDark
                  ? Border.all(color: Colors.amber.withOpacity(0.2))
                  : null,
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
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                PhotoIntroWidget(),
                VerticalDivider(),
                TextIntroWidget()
              ],
            ),
          )),
    );
  }
}

class PhotoIntroWidget extends StatelessWidget {
  const PhotoIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FlutterLogo(
              size: 300,
            ),
            Text(
              "Hi, I'm Anam",
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}

class TextIntroWidget extends StatelessWidget {
  const TextIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        padding: const EdgeInsets.only(left: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleDecoration(),
            const SizedBox(height: 40,),
            Text(
              "I'm Mohammad Khoirul Anam",
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Backend & Mobile App Developer",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith((states) =>
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))))),
                onPressed: () {
                  context.read<NavigationStateProvider>().changePageTo = 1;
                },
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text("Let's Go"),
                ))
          ],
        ),
      ),
    );
  }
}
