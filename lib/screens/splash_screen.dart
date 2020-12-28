import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_example/constants/colorsConstant.dart';

import 'package:weather_example/cubit/weather_cubit.dart';
import 'package:weather_example/screens/weather_forecast_screen.dart';
import 'package:weather_example/services/weather_repository.dart';
import 'package:weather_example/utilities/forecast_util.dart';

/// Экран загрузки
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getLocationData() async {
    try {
      Timer(
        Duration.zero,
        () {
          String currentLocale =
              EasyLocalization.of(context).locale.toString().split('_')[0];

          WeatherCubit _weatherCubit;
          WeatherRepository _weatherRepository =
              WeatherRepository(currentLocale);
          _weatherCubit = WeatherCubit(_weatherRepository);
          _weatherCubit.fetchWeather();

          Timer(
            Duration(seconds: 3),
            () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => WeatherForecastScreen(_weatherCubit),
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      print('getLocationData error $e');
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 1),
            colors: [
              ColorsConstant.headBackgraund,
              ColorsConstant.bottomBackgraund,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Util.getAppTitle(50),
            SpinKitThreeBounce(
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
