import 'package:flutter/foundation.dart';
import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';

abstract class WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherForecast loadedWeather;
  WeatherForecastLocation loadedWeatherLocation;

  WeatherLoadedState({
    @required this.loadedWeather,
    @required this.loadedWeatherLocation,
  }) : assert(loadedWeather != null && loadedWeatherLocation != null);
}

class WeatherErrorState extends WeatherState {}
