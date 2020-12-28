import 'package:flutter/material.dart';
import 'package:weather_example/constants/colorsConstant.dart';

class TextStyleConstant {
  static const TextStyle townName = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: ColorsConstant.white,
  );

  static const TextStyle dropDownTextSelected = TextStyle(
    color: ColorsConstant.white,
  );
  static const TextStyle dropDownTextOpen = TextStyle(
    color: ColorsConstant.black,
  );

  static const TextStyle textStateOfWeatherMain = TextStyle(
    fontSize: 54,
    color: ColorsConstant.white,
  );
  static const TextStyle textStateOfWeather = TextStyle(
    fontSize: 20,
    color: ColorsConstant.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle firstLetterSplash = TextStyle(
    color: ColorsConstant.bottomBackgraund,
  );

  static const TextStyle titleCardDetails = TextStyle(
    fontSize: 25,
    color: ColorsConstant.white,
  );
  static const TextStyle titlesDetails = TextStyle(
    fontSize: 12,
    color: ColorsConstant.transparentWhite150,
  );
  static const TextStyle valuesDetails = TextStyle(
    fontSize: 20,
    color: ColorsConstant.white,
  );
}
