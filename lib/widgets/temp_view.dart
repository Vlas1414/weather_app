import 'package:flutter/material.dart';
import 'package:weather_example/constants/colorsApp.dart';
import 'package:weather_example/constants/textStyleApp.dart';
import 'package:weather_example/models/weather_forecast.dart';

/// Текущая температура и описание погоды
/// snapshot - объект погоды
class TempView extends StatelessWidget {
  final WeatherForecast snapshot;
  const TempView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.daily;
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    var description = forecastList[0].weather[0].description.toUpperCase();

    return Container(
      child: Column(
        children: [
          Text(
            '$temp °C',
            style: TextStyleApp.size54.copyWith(
              color: ColorsApp.white,
            ),
          ),
          Text(
            '$description',
            style: TextStyleApp.size18.copyWith(
              color: ColorsApp.white,
            ),
          ),
        ],
      ),
    );
  }
}
