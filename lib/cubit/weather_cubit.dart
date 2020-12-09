import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example/cubit/weather_state.dart';
import 'package:weather_example/models/weather_forecast.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/services/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherEmptyState());

  Future<void> fetchWeather() async {
    try {
      emit(WeatherLoadingState());

      final WeatherForecast _loadedWeather =
          await weatherRepository.getWeatherForecast();
      final WeatherForecastLocation _loadedWeatherLocation =
          await weatherRepository.getWeatherCityName();

      emit(WeatherLoadedState(
        loadedWeather: _loadedWeather,
        loadedWeatherLocation: _loadedWeatherLocation,
      ));
    } catch (e) {
      print('$e');
      emit(WeatherErrorState());
    }
  }
}
