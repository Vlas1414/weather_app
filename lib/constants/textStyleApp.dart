import 'package:flutter/material.dart';
import 'package:weather_example/constants/colorsApp.dart';

class TextStyleApp {
  static const TextStyle _base = TextStyle(
    fontFamily: 'Roboto',
  );

  /// size
  static final TextStyle size12 = _base.copyWith(
    fontSize: 12,
  );
  static final TextStyle size14 = _base.copyWith(
    fontSize: 14,
  );
  static final TextStyle size15 = _base.copyWith(
    fontSize: 15,
  );
  static final TextStyle size16 = _base.copyWith(
    fontSize: 16,
  );
  static final TextStyle size18 = _base.copyWith(
    fontSize: 18,
  );
  static final TextStyle size20 = _base.copyWith(
    fontSize: 20,
  );
  static final TextStyle size24 = _base.copyWith(
    fontSize: 24,
  );
  static final TextStyle size25 = _base.copyWith(
    fontSize: 25,
  );
  static final TextStyle size30 = _base.copyWith(
    fontSize: 30,
  );
  static final TextStyle size54 = _base.copyWith(
    fontSize: 54,
  );

  /// weight
  static final TextStyle size20Bold = size20.copyWith(
    fontWeight: FontWeight.bold,
  );
  static final TextStyle size24Bold = size24.copyWith(
    fontWeight: FontWeight.bold,
  );

  static const TextStyle valuesDetails = TextStyle(
    fontSize: 20,
    color: ColorsApp.white,
  );
}
