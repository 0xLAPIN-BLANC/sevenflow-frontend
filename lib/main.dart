import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:intl/intl.dart';
import 'package:week_number/iso.dart';

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
  final GlobalKey<WeekViewState> _calendarKey = GlobalKey<WeekViewState>();
  final List<String> idxToDay = ['Lun','Mar','Mer','Jeu','Ven','Sam','Dim'];

  late bool _playing = false;

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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: LayoutGrid(
              areas:
              '''
            other    other    other    timer
            calendar calendar calendar general
            ''',

              columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
              rowSizes: [0.75.fr, 1.25.fr],

              columnGap: 25,
              gridFit: GridFit.expand,

              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,

                  child: WeekView(
                    key: _calendarKey,
                    backgroundColor: Colors.transparent,

                    pageTransitionCurve: Curves.easeInOutQuart,
                    pageTransitionDuration: Duration(seconds: 1),

                    liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
                      color: Theme.of(context).colorScheme.primary
                    ),

                    showHalfHours: true,
                    hourIndicatorSettings: HourIndicatorSettings(
                      color: Theme.of(context).colorScheme.surfaceBright.withAlpha(200)
                    ),
                    halfHourIndicatorSettings: HourIndicatorSettings(
                        color: Theme.of(context).colorScheme.surfaceBright.withAlpha(70)
                    ),

                    weekDayBuilder: (date) => MakeDayOfWeek(
                      dateTime: date,
                      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                      textColor: Theme.of(context).colorScheme.onSurface,
                      textFontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                    ),

                    weekPageHeaderBuilder: (startDate, endDate) => MakeHeaderBuilder(
                      startDate: startDate,
                      endDate: endDate,
                      calendarKey: _calendarKey,
                      mainColor: Theme.of(context).colorScheme.secondary,
                      onMainColor: Theme.of(context).colorScheme.onSecondary,
                      fontColor: Theme.of(context).colorScheme.secondary,
                      fontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
                      fontSize: 18,
                    ),

                    weekNumberBuilder: (firstDayOfWeek) => Center(
                      child: Text(
                        '${firstDayOfWeek.weekNumber}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface
                        ),
                      ),
                    ),

                    timeLineWidth: 50,
                    timeLineBuilder: (date) => Text(
                      '${date.hour.toString()} : ${date.minute.toString()}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface
                      ),
                    ),

                  )
              ).inGridArea('calendar'),

                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: () => {_playing = !_playing},
                        icon: Icon(
                          _playing
                            ? Icons.pause
                            : Icons.play_arrow,
                          size: 80,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary)
                      ),
                    ),
                  ),
                ).inGridArea('timer')
            ]
                    ),
          )
      )
    );
  }

  Widget _makeMonth(BuildContext context, GlobalKey<MonthViewState> key){
    return MonthView(
      useAvailableVerticalSpace: true,

      key: _calendarKey,
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
        startDate: date,
        endDate: date,
        calendarKey: _calendarKey,
        mainColor: Theme.of(context).colorScheme.secondary,
        onMainColor: Theme.of(context).colorScheme.onSecondary,
        fontColor: Theme.of(context).colorScheme.secondary,
        fontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
        fontSize: 18,
      ),

      weekDayBuilder: (date) => MakeDayOfWeek(
        dateTime: date,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        textColor: Theme.of(context).colorScheme.onSurface,
        textFontFamily: Theme.of(context).textTheme.headlineLarge?.fontFamily,
      ),
    );
  }
}

