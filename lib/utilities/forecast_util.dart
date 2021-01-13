import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_example/constants/colorsApp.dart';
import 'package:weather_example/constants/stringsApp.dart';
import 'package:weather_example/constants/textStyleApp.dart';

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
        Icon(
          iconData,
          color: ColorsApp.white,
          size: 28,
        ),
        const SizedBox(height: 10, width: 10),
        Text(
          '$value',
          style: TextStyleApp.size20.copyWith(
            color: ColorsApp.white,
          ),
        ),
        const SizedBox(height: 10, width: 5),
        Text(
          '$units',
          style: TextStyleApp.size15.copyWith(
            color: ColorsApp.white,
          ),
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
          style: TextStyleApp.size12.copyWith(
            color: ColorsApp.transparentWhite150,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              '$value',
              style: TextStyleApp.size20.copyWith(
                color: ColorsApp.white,
              ),
            ),
            const SizedBox(height: 10, width: 5),
            Text(
              '$units',
              style: TextStyleApp.size15.copyWith(
                color: ColorsApp.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static getAppTitle(double textSize) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: textSize),
        children: [
          TextSpan(
            text: StringsApp.firstPartAppLogo,
            style: TextStyleApp.size54.copyWith(
              color: ColorsApp.bottomBackgraund,
            ),
          ),
          TextSpan(
            text: StringsApp.secondPartAppLogo,
          ),
        ],
      ),
    );
  }
}
