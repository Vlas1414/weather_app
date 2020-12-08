import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/screens/weather_forecast_screen.dart';

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

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherForecastScreen(
              weatherInfo: weatherInfo,
              weatherLocation: weatherLocation,
            ),
          ));
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
            colors: [
              const Color.fromARGB(255, 32, 123, 228),
              const Color.fromARGB(255, 252, 177, 109)
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
