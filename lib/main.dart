import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage2(),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {

  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      themeMode: themeMode,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Bar')
        ),

        body: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        themeMode = ThemeMode.light;
                      });
                    }
                    , child: const Text('Light')
                ),

                TextButton(
                    onPressed: () {
                      setState(() {
                        themeMode = ThemeMode.dark;
                      });
                    }
                    , child: const Text('Dark')
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
