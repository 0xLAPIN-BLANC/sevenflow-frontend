import 'package:flutter/material.dart';

class MakeDayOfWeek extends StatelessWidget {
  final dayIdx;
  final backgroundColor;
  final textColor;
  final textFontFamily;
  final idxToDay = ['Lun','Mar','Mer','Jeu','Ven','Sam','Dim'];


  MakeDayOfWeek({
    super.key,
    required this.dayIdx,
    required this.backgroundColor,
    required this.textColor,
    required this.textFontFamily
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor
        ),

        child: Center(
          child: Text(
            idxToDay[dayIdx],
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

