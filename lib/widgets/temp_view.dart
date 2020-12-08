import 'package:flutter/material.dart';
import 'package:weather_example/models/weather_forecast.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.daily;
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    var description = forecastList[0].weather[0].description.toUpperCase();
    return Container(
      child: Column(
        children: [
          Text(
            '$temp °C',
            style: TextStyle(
              fontSize: 54,
              color: Colors.white,
            ),
          ),
          Text(
            '$description',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
