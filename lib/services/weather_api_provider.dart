import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_example/constants/apiConstant.dart';

import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/location.dart';

class WeatherProvider {
  SharedPreferences _prefs;
  Location location = Location();

  static const String kWeatherForecastPrefKey = 'weather_pref';
  static const String kWeatherForecastLocationPrefKey = 'weather_location_pref';

  String currentLocale;

  WeatherProvider(this.currentLocale);

  Future<Null> setWeatherPref(String value) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(
      kWeatherForecastPrefKey,
      value,
    );
  }

  Future<Null> setWeatherLocationPref(String value) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(
      kWeatherForecastLocationPrefKey,
      value,
    );
  }

  Future<http.Response> makeQuery(String path) async {
    var queryParameters = {
      'APPID': ApiConstant.wheatherAppId,
      'units': 'metric',
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'cnt': '1',
      'exclude': 'minutely',
      'lang': currentLocale
    };
    // var queryParameters = {
    //     'APPID': Constants.wheatherAppId,
    //     'units': 'metric',
    //     'q': cityName
    //   };
    var uri = Uri.https(
      ApiConstant.wheatherBaseUrlDomain,
      path,
      queryParameters,
    );
    log('request: ${uri.toString()}');
    var response = await http.get(uri);
    print('response: ${response?.body}');

    return response;
  }

  Future<WeatherForecast> fetchWeatherForecast() async {
    await location.getCurrentLocation();

    var response = await makeQuery(ApiConstant.wheatherForecastPath);

    if (response.statusCode == 200) {
      await setWeatherPref(response.body);
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<WeatherForecastLocation> fetchWeatherLocation() async {
    var response = await makeQuery(ApiConstant.wheatherLocationPath);

    if (response.statusCode == 200) {
      await setWeatherLocationPref(response.body);
      return WeatherForecastLocation.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<WeatherForecast> fetchWeatherForecastFromStorage() async {
    _prefs = await SharedPreferences.getInstance();
    String body = _prefs.getString(kWeatherForecastPrefKey) ?? null;
    if (body != null) {
      return WeatherForecast.fromJson(json.decode(body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<WeatherForecastLocation> fetchWeatherLocationFromStorage() async {
    _prefs = await SharedPreferences.getInstance();
    String body = _prefs.getString(kWeatherForecastLocationPrefKey) ?? null;
    if (body != null) {
      return WeatherForecastLocation.fromJson(json.decode(body));
    } else {
      return Future.error('Error response');
    }
  }
}
