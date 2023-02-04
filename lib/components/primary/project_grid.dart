import 'package:flutter/material.dart';
import 'package:porto_web/providers/project_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({super.key, required this.img, required this.title, required this.id});
  final int id;
   final String img;
   final String title;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              context.read<ProjectProvider>().switchProject = id;
            },
            child: SizedBox.expand(
              child: Card(
                elevation: isDark ? 0 : 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
                color: Colors.amber,
                clipBehavior: Clip.antiAlias,
                child: const FlutterLogo(size: 100,),
              ),
            ),
          ),
        ),
        Text(title)
      ],
    );
  }
}