import 'package:flutter/material.dart';
import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/custom_colors.dart';
import 'package:weather_example/widgets/app_bar_view.dart';
import 'package:weather_example/widgets/bottom_list_view.dart';
import 'package:weather_example/widgets/detail_view.dart';
import 'package:weather_example/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final weatherInfo;
  final weatherLocation;
  WeatherForecastScreen({this.weatherInfo, this.weatherLocation});
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  Future<WeatherForecastLocation> forecastObjectLocation;
  String dropdownValue = 'Days';

  @override
  void initState() {
    super.initState();
    if (widget.weatherInfo != null) {
      forecastObject = Future.value(widget.weatherInfo);
    }
    if (widget.weatherLocation != null) {
      forecastObjectLocation = Future.value(widget.weatherLocation);
    }
    // forecastObject.then((weather) {
    //   print(weather.list[0].weather[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarView(forecastObjectLocation, dropdownValue, (value) {
        setState(() {
          dropdownValue = value;
        });
      }),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 1),
            colors: [CustomColors.HEAD_OF_APP, CustomColors.BOTTOM_OF_APP],
            tileMode: TileMode.repeated,
          ),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(children: [
              FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(height: 50),
                        TempView(snapshot: snapshot),
                        SizedBox(height: 50),
                        DetailView(snapshot: snapshot),
                        SizedBox(height: 50),
                        BottomListView(
                            snapshot: snapshot, typeElements: dropdownValue)
                      ],
                    );
                  } else {
                    return Center(
                        child: Text(
                      'City not found',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ));
                  }
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
