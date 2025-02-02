import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MakeDayOfWeek extends StatelessWidget {
  final dateTime;
  final backgroundColor;
  final textColor;
  final textFontFamily;
  final idxToDay = ['Lun','Mar','Mer','Jeu','Ven','Sam','Dim'];


  MakeDayOfWeek({
    super.key,
    required this.dateTime,
    required this.backgroundColor,
    required this.textColor,
    required this.textFontFamily
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor
        ),

        child: Center(
          child: Text(
            '${DateFormat.E().format(dateTime)}, ${dateTime.day.toString()}',
            maxLines: 1,
            style: TextStyle(
              color: textColor,
              fontFamily: textFontFamily,
            ),
          ),
        ),
      ),
    );
  }
}

