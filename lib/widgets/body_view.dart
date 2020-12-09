import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weather_example/cubit/weather_cubit.dart';
import 'package:weather_example/cubit/weather_state.dart';
import 'package:weather_example/utilities/custom_colors.dart';
import 'package:weather_example/widgets/bottom_list_view.dart';
import 'package:weather_example/widgets/detail_view.dart';
import 'package:weather_example/widgets/temp_view.dart';

class BodyView extends StatelessWidget {
  final dropdownValue;
  BodyView({this.dropdownValue});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 1),
            colors: [CustomColors.HEAD_OF_APP, CustomColors.BOTTOM_OF_APP],
            tileMode: TileMode.repeated,
          ),
        ),
        child:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoadedState) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(children: [
                  SizedBox(height: 50),
                  TempView(snapshot: state.loadedWeather),
                  SizedBox(height: 50),
                  DetailView(snapshot: state.loadedWeather),
                  SizedBox(height: 50),
                  BottomListView(
                      snapshot: state.loadedWeather,
                      typeElements: dropdownValue)
                ]),
              ],
            );
          }
          return SpinKitThreeBounce(
            color: Colors.white,
            size: 50,
          );
        }));
  }
}
