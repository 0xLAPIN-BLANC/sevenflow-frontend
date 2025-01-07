import 'package:flutter/material.dart';
import 'package:seven_flow/Theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  ThemeMode _themeMode = ThemeMode.system;
  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
}

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(const TextTheme());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seven Flow',

      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: _themeMode,

      home: MyHomePage(
        themeMode: _themeMode,
        onThemeModeToggle: _toggleThemeMode
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeModeToggle;

  const MyHomePage({
    super.key,
    required this.themeMode,
    required this.onThemeModeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,

          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
                'Seven Flow',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)
                )
            ),

            actions: <Widget>[
              IconButton(
                  onPressed: onThemeModeToggle,
                  icon: Icon(
                      themeMode == ThemeMode.dark
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: Theme.of(context).colorScheme.onPrimary
                  ))
            ]
          ),

          body: Center(
              child: Text(
                'Hello world',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              )
          ),
      ),
    );
  }
}

