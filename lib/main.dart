import 'package:flutter/material.dart';
import 'package:porto_web/components/components_lib.dart';
import 'package:porto_web/global_vars/global_vars.dart';
import 'package:porto_web/preferences/dark_theme_prefs.dart';
import 'package:porto_web/providers/navigation_state_provider.dart';
import 'package:porto_web/providers/theme_provider.dart';
import 'package:porto_web/themes/my_themes.dart';
import 'package:porto_web/views/view_lib.dart';
import 'package:provider/provider.dart';

void main() {
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
        ChangeNotifierProvider(create: (_) => NavigationStateProvider())
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

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    bool isSmallScreen =
        MediaQuery.of(context).size.width < ScreenSizeLib.smallWidth;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anam'),
        actions: <Widget>[
          IconButton(
            icon: context.watch<DarkThemeProvider>().darkTheme
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            onPressed: () async {
              final darkPrefs = await DarkThemePreference().getTheme();
              // ignore: use_build_context_synchronously
              context.read<DarkThemeProvider>().darkTheme = !darkPrefs;
            },
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
      body: const IntroView(),
      bottomNavigationBar: isSmallScreen
          ? const NavBarPhone()
          : null,
    );
  }
}

