import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/screens/weather_forecast_screen.dart';
import 'package:weather_example/utilities/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getLocationData() async {
    try {
      var weatherInfo = await WeatherApi().fetchWeatherForecast();
      var weatherLocation =
          await WeatherApi().fetchWeatherForecast(isGetLocation: true);

      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherForecastScreen(
                weatherInfo: weatherInfo,
                weatherLocation: weatherLocation,
              ),
            ));
      });
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0, 1),
              colors: [CustomColors.HEAD_OF_APP, CustomColors.BOTTOM_OF_APP],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 50),
                  children: [
                    TextSpan(
                        text: 'W',
                        style: TextStyle(color: CustomColors.BOTTOM_OF_APP)),
                    TextSpan(text: 'eather'),
                  ],
                ),
              ),
              SpinKitThreeBounce(
                color: Colors.white,
                size: 50,
              ),
            ],
          )),
    );
  }
}
