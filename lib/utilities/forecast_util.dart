import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_example/constants/colorsConstant.dart';
import 'package:weather_example/constants/stringsConstant.dart';
import 'package:weather_example/constants/textStyleConstant.dart';

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
          color: ColorsConstant.white,
          size: 28,
        ),
        const SizedBox(height: 10, width: 10),
        Text(
          '$value',
          style: TextStyleConstant.valuesDetails,
        ),
        const SizedBox(height: 10, width: 5),
        Text(
          '$units',
          style: TextStyleConstant.valuesDetails.copyWith(
            fontSize: 15,
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
          style: TextStyleConstant.titlesDetails,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              '$value',
              style: TextStyleConstant.valuesDetails,
            ),
            const SizedBox(height: 10, width: 5),
            Text(
              '$units',
              style: TextStyleConstant.valuesDetails.copyWith(
                fontSize: 15,
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
            text: StringsConstant.firstPartAppLogo,
            style: TextStyleConstant.firstLetterSplash,
          ),
          TextSpan(
            text: StringsConstant.secondPartAppLogo,
          ),
        ],
      ),
    );
  }
}
