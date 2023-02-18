import 'package:flutter/material.dart';
import 'package:porto_web/components/primary/education_tile.dart';
import 'package:porto_web/global_vars/global_vars.dart';
import 'package:porto_web/providers/edu_scroll_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/dark_colors.dart';
import 'package:provider/provider.dart';

class EducationsView extends StatelessWidget {
  const EducationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 80, left: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Education',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 20,
            ),
            const EducationList()
          ],
        ));
  }
}

class EducationList extends StatefulWidget {
  const EducationList({
    Key? key,
  }) : super(key: key);

  @override
  State<EducationList> createState() => _EducationListState();
}

class _EducationListState extends State<EducationList> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 2.0,
                  color: isDark ? Colors.white : AppDarkTheme.kMainColorTwo,
                ),
                const EducationDotScroll()
              ],
            ),
          ),
          const SizedBox(
            width: 500,
            child: EducationListScroll(),
          )
        ],
      ),
    );
  }
}

class EducationListScroll extends StatelessWidget {
  const EducationListScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              controller: context
                  .watch<EducationScrollControllerProvider>()
                  .eduController,
              children: PersonalData.educations
                  .map((education) => EducationTile(
                      title: education['title'],
                      origin: education['origin'],
                      date: education['date']))
                  .toList(),
            ),
          ),
        ),
        LayoutBuilder(
          builder: (builder, constraints) {
            final width = constraints.maxWidth;
            return Stack(
              children: [
                const SizedBox(
                  height: 60,
                ),
                SwipeDownEducationWidget(
                  isDark: isDark,
                  width: width,
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 80,
          width: 80,
        )
      ],
    );
  }
}

class SwipeDownEducationWidget extends StatefulWidget {
  const SwipeDownEducationWidget(
      {Key? key, required this.isDark, required this.width})
      : super(key: key);

  final bool isDark;
  final double width;

  @override
  State<SwipeDownEducationWidget> createState() =>
      _SwipeDownEducationWidgetState();
}

class _SwipeDownEducationWidgetState extends State<SwipeDownEducationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.width);
    return RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.chevron_right,
        size: 40,
        color: widget.isDark
            ? Colors.white54
            : AppDarkTheme.kMainColorTwo.withOpacity(0.6),
      ),
    );
  }
}

class EducationDotScroll extends StatelessWidget {
  const EducationDotScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkThemeProvider>().darkTheme;
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: 40,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                  controller: context
                      .watch<EducationScrollControllerProvider>()
                      .dotController,
                  children: List.generate(
                      PersonalData.educations.length,
                      (index) => Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              const SizedBox(
                                //bg padding
                                height: 100,
                                width: 40,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: isDark
                                        ? Colors.white
                                        : AppDarkTheme.kMainColorTwo,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ))),
            ),
          ),
        ),
        const SizedBox(
          height: 140,
          width: 40,
        )
      ],
    );
  }
}
