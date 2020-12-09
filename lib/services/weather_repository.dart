import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/services/weather_api_provider.dart';

class WeatherRepository {
  String currentLocale;
  WeatherProvider _weatherProvider;

  WeatherRepository(currentLocale) {
    this.currentLocale = currentLocale;
    _weatherProvider = WeatherProvider(currentLocale);
  }

  Future<WeatherForecast> getWeatherForecast() =>
      _weatherProvider.fetchWeatherForecast();
  Future<WeatherForecastLocation> getWeatherCityName() =>
      _weatherProvider.fetchWeatherLocation();

  Future<WeatherForecast> getWeatherForecastFromStorage() =>
      _weatherProvider.fetchWeatherForecastFromStorage();
  Future<WeatherForecastLocation> getWeatherCityNameFromStorage() =>
      _weatherProvider.fetchWeatherLocationFromStorage();
}
