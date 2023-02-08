import 'package:flutter/material.dart';
import 'package:porto_web/global_vars/global_vars.dart';
import 'package:porto_web/providers/project_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid(
      {super.key,
      required this.img,
      required this.title,
      required this.id,
      required this.appCat});
  final int id;
  final String img;
  final String title;
  final String appCat;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    var selectedImg = PersonalData.appTitles
        .where((element) => appCat == element['slug'])
        .toList()[0];
    return GestureDetector(
      onTap: () {
        context.read<ProjectProvider>().switchProject = id;
      },
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(selectedImg['img']),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber,
                    boxShadow: isDark
                        ? null
                        : const [
                            BoxShadow(
                              offset: Offset(1, 4),
                              color: AppDarkTheme.kMainColorOne,
                              blurRadius: 4,
                              spreadRadius: -1,
                            )
                          ]),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? AppDarkTheme.kMainColorOne.withOpacity(0.5)
                      : Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(title)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
