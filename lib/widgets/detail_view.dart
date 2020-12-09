import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/utilities/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final WeatherForecast snapshot;
  const DetailView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.daily;
    var pressure = forecastList[0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].windSpeed;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Util.getItemWithIcon(FontAwesomeIcons.thermometerThreeQuarters,
              pressure.round(), 'pressureDim'.tr(), Axis.vertical),
          Util.getItemWithIcon(
              FontAwesomeIcons.cloudRain, humidity, '%', Axis.vertical),
          Util.getItemWithIcon(FontAwesomeIcons.wind, wind.toInt(),
              'windDim'.tr(), Axis.vertical)
        ],
      ),
    );
  }
}
