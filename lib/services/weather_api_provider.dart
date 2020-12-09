import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/constants.dart';
import 'package:weather_example/utilities/location.dart';

class WeatherProvider {
  Future<http.Response> makeQuery(String path) async {
    Location location = Location();
    await location.getCurrentLocation();

    var queryParameters = {
      'APPID': Constants.WHEATHER_APP_ID,
      'units': 'metric',
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'cnt': '1',
      'exclude': 'minutely'
    };
    // var queryParameters = {
    //     'APPID': Constants.WHEATHER_APP_ID,
    //     'units': 'metric',
    //     'q': cityName
    //   };
    var uri = Uri.https(
      Constants.WEATHER_BASE_URL_DOMAIN,
      path,
      queryParameters,
    );
    log('request: ${uri.toString()}');
    var response = await http.get(uri);
    print('response: ${response?.body}');

    return response;
  }

  Future<WeatherForecast> fetchWeatherForecast() async {
    var response = await makeQuery(Constants.WEATHER_FORECAST_PATH);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<WeatherForecastLocation> fetchWeatherLocation() async {
    var response = await makeQuery(Constants.WEATHER_LOCATION_PATH);

    if (response.statusCode == 200) {
      return WeatherForecastLocation.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
