import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example/cubit/weather_cubit.dart';
import 'package:weather_example/cubit/weather_state.dart';
import 'package:weather_example/utilities/forecast_util.dart';

class TitleAppBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          var city = state.loadedWeatherLocation.city.name;
          var country = state.loadedWeatherLocation.city.country;
          var formattedDate = DateTime.fromMillisecondsSinceEpoch(
            state.loadedWeather.current.dt * 1000,
          );
          return Container(
            child: Column(
              children: [
                Text(
                  '$city, $country',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${Util.getFormattedDate(formattedDate)}',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }
        return Util.getAppTitle(30);
      },
    );
  }
}
