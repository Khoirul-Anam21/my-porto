import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:porto_web/global_vars/global_vars.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:porto_web/themes/light_colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TechWidget extends StatelessWidget {
  const TechWidget({Key? key, required this.techs, this.repoUrl = 'github.com'})
      : super(key: key);

  final List<String> techs;
  final String repoUrl;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TechStackWidget(isDark: isDark, techs: techs),
        ],
      ),
    );
  }
}

class RepoWidget extends StatelessWidget {
  const RepoWidget({Key? key, required this.repo}) : super(key: key);
  final String repo;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    bool isGithub = repo.contains('github');
    String repoImg =
        isGithub ? 'assets/icons8-github-bw.svg' : 'assets/icons8-gitlab.svg';
    return Transform.scale(
      scale: 0.9,
      child: TextButton(
          onPressed: () async {
            final Uri repoUrl = Uri.parse(repo);
            if (!await launchUrl(repoUrl)) {
              throw Exception("INVALID URL");
            }
          },
          style: ButtonStyle(
            side: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered) && isDark) {
                return BorderSide(color: Colors.white.withOpacity(0.5));
              }
              if (states.contains(MaterialState.hovered) && !isDark) {
                return BorderSide(
                    color: AppDarkTheme.kMainColorTwo.withOpacity(0.5));
              }
            }),
            textStyle: MaterialStateProperty.resolveWith(
                (states) => const TextStyle(fontWeight: FontWeight.w300)),
            foregroundColor: MaterialStateProperty.resolveWith(
                (states) => isDark ? Colors.white : AppDarkTheme.kMainColorTwo),
            shape: MaterialStateProperty.resolveWith((states) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            backgroundColor: MaterialStateProperty.resolveWith((states) =>
                isDark
                    ? AppDarkTheme.kRepoBtnColor
                    : AppLightTheme.kRepoBtnColor),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Repository'),
                const SizedBox(
                  width: 8,
                ),
                SvgPicture.asset(
                  repoImg,
                  width: isGithub? null : 24,
                  color: isDark ? Colors.white : AppDarkTheme.kMainColorTwo,
                )
              ],
            ),
          )),
    );
  }
}

class TechStackWidget extends StatelessWidget {
  const TechStackWidget({
    Key? key,
    required this.isDark,
    required this.techs,
  }) : super(key: key);

  final bool isDark;
  final List<String> techs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Tech Stack: '),
        Transform.scale(
          scale: 0.6,
          child: Container(
            decoration: BoxDecoration(
                color: isDark ? Colors.white : null,
                borderRadius: BorderRadius.circular(40)),
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: Wrap(
                children: techs.map((techName) {
              final skillAssetName = PersonalData.skills
                  .where((skill) => skill['slug'] == techName)
                  .elementAt(0);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SvgPicture.asset(skillAssetName['svg']),
              );
            }).toList()),
          ),
        ),
      ],
    );
  }
}
