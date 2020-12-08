import 'dart:convert';
import 'dart:developer';

import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_example/utilities/location.dart';

class WeatherApi {
  Future fetchWeatherForecast({isGetLocation = false}) async {
    Location location = Location();
    await location.getCurrentLocation();

    // var queryParameters = {
    //     'APPID': Constants.WHEATHER_APP_ID,
    //     'units': 'metric',
    //     'q': cityName
    //   };

    var queryParameters = {
      'APPID': Constants.WHEATHER_APP_ID,
      'units': 'metric',
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'cnt': '1'
    };

    var uri = Uri.https(
        Constants.WEATHER_BASE_URL_DOMAIN,
        isGetLocation
            ? Constants.WEATHER_LOCATION_PATH
            : Constants.WEATHER_FORECAST_PATH,
        queryParameters);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response?.body}');

    if (response.statusCode == 200) {
      if (isGetLocation) {
        return WeatherForecastLocation.fromJson(json.decode(response.body));
      } else {
        return WeatherForecast.fromJson(json.decode(response.body));
      }
    } else {
      return Future.error('Error response');
    }
  }
}
