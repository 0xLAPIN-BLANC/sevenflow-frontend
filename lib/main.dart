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
      title: 'Seven Flow',
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
          title: const Text('Seven Flow'),
          centerTitle: true,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)
            )
          ),

          actions: <Widget>[
            IconButton(
                onPressed: (){
                  setState(() {
                    themeMode == ThemeMode.dark
                        ? themeMode = ThemeMode.light
                        : themeMode = ThemeMode.dark;
                  });
                },
                icon: Icon(
                  themeMode == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode
                ))
          ],
          backgroundColor: Colors.purple,
        ),

        body: const Center(child: Text('Hello world'))
      ),
    );
  }
}
