import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example/constants/textStyleConstant.dart';

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
          return Container(
            child: Column(
              children: [
                Text(
                  '$city',
                  style: TextStyleConstant.townName,
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
