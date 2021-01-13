import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_example/constants/colorsApp.dart';
import 'package:weather_example/constants/textStyleApp.dart';
import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/utilities/forecast_util.dart';

/// Карточка дополнительной информации
/// forecastDaily - погода на неделю
/// forecastHourly - погода по часам
class ForecastCard extends StatefulWidget {
  final Daily forecastDaily;
  final Hourly forecastHourly;
  ForecastCard({this.forecastDaily, this.forecastHourly});

  @override
  _ForecastCardState createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  bool isShowDetail = false;

  @override
  Widget build(BuildContext context) {
    var forecast = widget.forecastDaily != null
        ? widget.forecastDaily
        : widget.forecastHourly;
    return myBuild(forecast, widget.forecastDaily != null);
  }

  Widget myBuild(forecast, isDaily) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(forecast.dt * 1000);
    var fullDate =
        isDaily ? Util.getFormattedDate(date) : Util.getFormattedTime(date);
    var dayOfWeek =
        isDaily ? fullDate.split(',')[0].tr() : fullDate.split(',')[0];
    var tempMin = isDaily
        ? forecast.temp.min.toStringAsFixed(0)
        : forecast.temp.toStringAsFixed(0);
    var feelsLike =
        isDaily ? forecast.feelsLike.day.toInt() : forecast.feelsLike.toInt();
    var icon = forecast.getIconUrl();

    return FlatButton(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      onPressed: () {
        setState(() {
          isShowDetail = !isShowDetail;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: ColorsApp.transparentWhite20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  dayOfWeek,
                  style: TextStyleApp.size25.copyWith(
                    color: ColorsApp.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '$tempMin °C',
                      style: TextStyleApp.size30.copyWith(
                        color: ColorsApp.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.network(
                        icon,
                        scale: 0.9,
                        errorBuilder: (
                          BuildContext context,
                          Object exception,
                          StackTrace stackTrace,
                        ) {
                          return SpinKitThreeBounce(
                            color: ColorsApp.white,
                            size: 10,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isShowDetail ? 110 : 0,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 95,
                    padding: const EdgeInsets.only(right: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Util.getItemWithTitle(
                              'pressure'.tr(),
                              forecast.pressure,
                              'pressureDim'.tr(),
                            ),
                            Util.getItemWithTitle(
                              'humidity'.tr(),
                              forecast.humidity,
                              '%',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Util.getItemWithTitle(
                              'wind'.tr(),
                              forecast.windSpeed.toInt(),
                              'windDim'.tr(),
                            ),
                            Util.getItemWithTitle(
                              'feels'.tr(),
                              feelsLike,
                              '°C',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
