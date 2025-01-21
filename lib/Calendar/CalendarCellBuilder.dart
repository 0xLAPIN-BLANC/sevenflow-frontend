import 'package:flutter/material.dart';

class MakeCellBuilder extends StatelessWidget {
  final date;
  final event;
  final isToday;
  final isInMonth;
  final hideDaysNotInMonth;
  final surfaceColor;
  final selectedColor;
  final fontColor;
  final fontFamily;

  const MakeCellBuilder({
    super.key,
    required this.date,
    required this.event,
    required this.isToday,
    required this.isInMonth,
    required this.hideDaysNotInMonth,
    required this.surfaceColor,
    required this.selectedColor,
    required this.fontColor,
    required this.fontFamily
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2),
        child: isInMonth
          ?Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: surfaceColor,
                border: isToday
                    ? Border.all( color: selectedColor)
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
                      color: fontColor,
                      fontFamily: fontFamily,
                    ),
                  ),
                )
              ],
            ),
          )
        : null
    );
  }
}
