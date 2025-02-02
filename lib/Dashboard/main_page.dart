import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:calendar_view/calendar_view.dart';

import 'package:seven_flow/Calendar/calendar_weekday_builder.dart';
import 'package:seven_flow/Calendar/calendar_cell_builder.dart';
import 'package:seven_flow/Calendar/calendar_header_builder.dart';


class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final GlobalKey<WeekViewState> _calendarKey = GlobalKey<WeekViewState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: LayoutGrid(

        areas: 'calendar',

        columnSizes: [1.fr],
        rowSizes: [1.fr],

        children: [

          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,

            child: CalendarControllerProvider(
              controller: EventController(),

              child: WeekView(
                key: _calendarKey,
                backgroundColor: Colors.transparent,

                scrollPhysics: NeverScrollableScrollPhysics(),

                pageTransitionDuration: Duration(microseconds: 1),

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
                    'oui',
                    // '${firstDayOfWeek.weekNumber}',
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
              ),
            ),
          ).inGridArea('calendar')

        ],
      ),
    ) ;
  }
}
