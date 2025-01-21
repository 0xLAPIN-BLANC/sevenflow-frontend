import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

import 'package:seven_flow/Theme/theme.dart';
import 'package:seven_flow/Theme/util.dart';

import 'package:seven_flow/Calendar/CalendarWeekDayBuilder.dart';
import 'package:seven_flow/Calendar/CalendarCellBuilder.dart';
import 'package:seven_flow/Calendar/CalendarHeaderBuilder.dart';

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
  final List<String> idxToDay = ['Lun','Mar','Mer','Jeu','Ven','Sam','Dim'];

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
              width: 750,
              key: _calendarKey,
              cellAspectRatio: 1.1,
              showBorder: false,

              cellBuilder: (date, event, isToday, isInMonth, hideDaysNotInMonth) => MakeCellBuilder(
                date: date,
                event: event,
                isToday: isToday,
                isInMonth: isInMonth,
                hideDaysNotInMonth: hideDaysNotInMonth,
                surfaceColor: Theme.of(context).colorScheme.surfaceContainer,
                selectedColor: Theme.of(context).colorScheme.onSurface,
                fontColor: Theme.of(context).colorScheme.onSurface,
                fontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
              ),

              headerBuilder: (date) => MakeHeaderBuilder(
                date: date,
                calendarKey: _calendarKey,
                mainColor: Theme.of(context).colorScheme.secondary,
                onMainColor: Theme.of(context).colorScheme.onSecondary,
                fontColor: Theme.of(context).colorScheme.secondary,
                fontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
                fontSize: 18,
              ),

              weekDayBuilder: (date) => MakeDayOfWeek(
                dayIdx: date,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                textColor: Theme.of(context).colorScheme.onSurface,
                textFontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
              )
            ),
          )
      )
    );
  }
}

