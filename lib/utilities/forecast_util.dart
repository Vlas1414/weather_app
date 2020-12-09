import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_example/utilities/custom_colors.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y', 'en-US').format(dateTime);
  }

  static String getFormattedTime(DateTime dateTime) {
    return DateFormat('Hm', 'en-US').format(dateTime);
  }

  static getItemWithIcon(
      IconData iconData, int value, String units, Axis diraction) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: diraction,
      children: [
        Icon(iconData, color: Colors.white, size: 28),
        SizedBox(height: 10, width: 10),
        Text(
          '$value',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(height: 10, width: 5),
        Text(
          '$units',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ],
    );
  }

  static getItemWithTitle(String title, int value, String units) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 12, color: Color.fromARGB(150, 255, 255, 255)),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              '$value',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 10, width: 5),
            Text(
              '$units',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        )
      ],
    );
  }

  static getAppTitle(double textSize) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: textSize),
        children: [
          TextSpan(
              text: 'W', style: TextStyle(color: CustomColors.BOTTOM_OF_APP)),
          TextSpan(text: 'eather'),
        ],
      ),
    );
  }
}
