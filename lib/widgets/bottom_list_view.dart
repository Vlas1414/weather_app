import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_example/constants/colorsConstant.dart';
import 'package:weather_example/constants/textStyleConstant.dart';

import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/widgets/forecast_card.dart';

/// Список погоды по дням либо часам
/// snapshot - объект погоды
/// typeElements - дни либо часы
class BottomListView extends StatelessWidget {
  final WeatherForecast snapshot;
  final String typeElements;
  BottomListView({this.snapshot, this.typeElements});

  @override
  Widget build(BuildContext context) {
    final title =
        typeElements == 'hours' ? 'listTitleHours'.tr() : 'listTitleDays'.tr();
    final dataList = typeElements == 'hours' ? snapshot.hourly : snapshot.daily;

    final List forecastListNotFiltered = dataList
        .map(
          (element) => Padding(
            padding: const EdgeInsets.all(10),
            child: typeElements == 'hours'
                ? ForecastCard(forecastHourly: element)
                : ForecastCard(forecastDaily: element),
          ),
        )
        .toList();
    final forecastList = typeElements == 'hours'
        ? forecastListNotFiltered.sublist(0, 24)
        : forecastListNotFiltered;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyleConstant.textStateOfWeather,
        ),
        Container(
          child: Column(children: forecastList),
        ),
      ],
    );
  }
}
