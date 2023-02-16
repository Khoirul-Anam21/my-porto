import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/firebase_options.dart';
import 'package:porto_web/global_vars/global_vars.dart';
import 'package:porto_web/providers/navigation_state_provider.dart';
import 'package:porto_web/providers/project_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/my_themes.dart';
import 'package:porto_web/views/view_lib.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
        await darkThemeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => darkThemeProvider),
        ChangeNotifierProvider(create: (_) => NavigationStateProvider()),
        ChangeNotifierProvider(create: (_) => ProjectProvider())
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Styles.themeData(
            context.watch<DarkThemeProvider>().darkTheme, context),
        home: const MainView());
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen =
        MediaQuery.of(context).size.width < ScreenSizeLib.smallWidth;

    return Scaffold(
      body: Stack(
        children: [
          const MainBodyWidget(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amber,
                    ),
                    child: Transform.scale(
                      scale: 0.7,
                      child: DayNightSwitcher(
                          isDarkModeEnabled:
                              context.watch<DarkThemeProvider>().darkTheme,
                          onStateChanged: (newVal) {
                            final darkPrefs =
                                context.read<DarkThemeProvider>().darkTheme;
                            context.read<DarkThemeProvider>().darkTheme =
                                !darkPrefs;
                          }),
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isSmallScreen ? const NavBarPhone() : null,
    );
  }
}

class MainBodyWidget extends StatefulWidget {
  const MainBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainBodyWidget> createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<MainBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return const IntroView();
  }
}
