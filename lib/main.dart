import 'package:flutter/material.dart';
import 'package:seven_flow/Theme/theme.dart';
import 'package:seven_flow/Theme/util.dart';
import 'package:calendar_view/calendar_view.dart';

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
    final TextTheme textTheme = createTextTheme(context, "Rubik", "Merriweather");
    final materialTheme = MaterialTheme(textTheme);

    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Seven Flow',

        theme: materialTheme.light(),
        darkTheme: materialTheme.dark(),
        themeMode: _themeMode,

        home: MyHomePage(
          themeMode: _themeMode,
          onThemeModeToggle: _toggleThemeMode
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeModeToggle;
  final GlobalKey<MonthViewState> _calendarKey = GlobalKey<MonthViewState>();

  MyHomePage({
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
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Seven Flow',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
                  fontSize: 25
                ),

              ),
            ),

            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                    onPressed: onThemeModeToggle,
                    icon: Icon(
                        themeMode == ThemeMode.dark
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color: Theme.of(context).colorScheme.onSurface
                    )),
              )
            ]
          ),

          body: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 40),
            child: MonthView(
              width: 700,
              key: _calendarKey,
              cellAspectRatio: 1.1,
              showBorder: false,
              cellBuilder: (date, event, isToday, isInMonth, hideDaysNotInMonth) => Padding(
                padding: EdgeInsets.all(2),
                child: isInMonth
                  ?Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      border: isToday
                        ? Border.all( color: Theme.of(context).colorScheme.onSurface)
                        : null
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
                            ),
                          ),
                        )
                      ],
                    ),
                )
                : null
              ),

              headerBuilder: (date) => Row(
                spacing: 12,
                children: [
                  Spacer(),

                  IconButton(
                    onPressed: () => _calendarKey.currentState!.previousPage(),
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary)
                    ),
                  ),

                  TextButton(
                      onPressed: () => _calendarKey.currentState?.animateToMonth(DateTime.now()),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary)
                      ),
                      child: Text(
                          'Today',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
                              fontSize: 24
                          )
                      )
                  ),

                  IconButton(
                    onPressed: () => _calendarKey.currentState!.nextPage(),
                    icon: Icon(
                        Icons.chevron_right_rounded,
                        color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary)
                    ),
                  ),
                ],
              ),

              weekDayBuilder: (date) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.outline
                    ),
                    child: Center(
                      child: Text(date.toString(), maxLines: 1,),
                    ),
                  ),
              ),
            ),
          )
      )
    );
  }
}

