import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MakeHeaderBuilder extends StatelessWidget {
  final startDate;
  final endDate;
  final calendarKey;
  final mainColor;
  final onMainColor;
  final fontColor;
  final fontFamily;
  final fontSize;


  const MakeHeaderBuilder({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.calendarKey,
    required this.mainColor,
    required this.onMainColor,
    required this.fontFamily,
    required this.fontColor,
    required this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: mainColor)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
              child: Text(
                  '${DateFormat.MMMM().format(startDate)}, ${startDate.year}',
                  style: TextStyle(
                      color: fontColor,
                      fontFamily: fontFamily,
                      fontSize: fontSize
                  )
              ),
            ),
          ),
        ),

        Spacer(),

        IconButton(
          onPressed: () => calendarKey.currentState!.previousPage(),
          icon: Icon(
            Icons.chevron_left_rounded,
            color: onMainColor,
          ),
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(mainColor)
          ),
        ),

        TextButton(
            onPressed: () => calendarKey.currentState?.animateToWeek(DateTime.now()),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(mainColor)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: Text(
                  'Today',
                  style: TextStyle(
                      color: onMainColor,
                      fontFamily: fontFamily,
                      fontSize: fontSize
                  )
              ),
            )
        ),

        IconButton(
          onPressed: () => calendarKey.currentState!.nextPage(),
          icon: Icon(
            Icons.chevron_right_rounded,
            color: onMainColor,
          ),
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(mainColor)
          ),
        ),
      ],
    );
  }
}
