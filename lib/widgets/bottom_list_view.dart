import 'package:flutter/material.dart';
import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  final WeatherForecast snapshot;
  final String typeElements;
  BottomListView({this.snapshot, this.typeElements});

  @override
  Widget build(BuildContext context) {
    final title = typeElements == 'Hours'
        ? '24-Hours Weather Forecast'
        : '7-Day Weather Forecast';
    final dataList = typeElements == 'Hours' ? snapshot.hourly : snapshot.daily;

    final List forecastListNotFiltered = dataList
        .map((element) => Padding(
              padding: EdgeInsets.all(10),
              child: typeElements == 'Hours'
                  ? ForecastCard(forecastHourly: element)
                  : ForecastCard(forecastDaily: element),
            ))
        .toList();
    final forecastList = typeElements == 'Hours'
        ? forecastListNotFiltered.sublist(0, 24)
        : forecastListNotFiltered;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          child: Column(children: forecastList),
        ),
      ],
    );
  }
}
