import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/services/weather_api_provider.dart';

class WeatherRepository {
  WeatherProvider _weatherProvider = WeatherProvider();
  Future<WeatherForecast> getWeatherForecast() =>
      _weatherProvider.fetchWeatherForecast();
  Future<WeatherForecastLocation> getWeatherCityName() =>
      _weatherProvider.fetchWeatherLocation();
}
