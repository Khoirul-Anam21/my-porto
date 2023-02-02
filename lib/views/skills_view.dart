import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/global_vars/global_vars.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:porto_web/themes/light_colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              MainContent(),
              SkillsCircle(),
            ],
          ),
        ),
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
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "My Skills",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text("My tech skills that I use"),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleDecoration(),
            ),
          ],
        ),
        const CVAccessWidget()
      ],
    ));
  }
}

class CVAccessWidget extends StatefulWidget {
  const CVAccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CVAccessWidget> createState() => _CVAccessWidgetState();
}

class _CVAccessWidgetState extends State<CVAccessWidget> {
  final Uri _cvUrl = Uri.parse(PersonalData.cvURL);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Access My CV:'),
        ElevatedButton(
            onPressed: () async {
              if (!await launchUrl(_cvUrl)) {
                throw Exception("INVALID URL");
              }
            },
            child: const Text('CV'))
      ],
    );
  }
}
