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
          Widget listWidget(loadedWeather) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 50),
                TempView(snapshot: loadedWeather),
                SizedBox(height: 50),
                DetailView(snapshot: loadedWeather),
                SizedBox(height: 50),
                BottomListView(
                    snapshot: loadedWeather, typeElements: dropdownValue)
              ],
            );
          }

          if (state is WeatherLoadedState) {
            return listWidget(state.loadedWeather);
          }
          if (state is WeatherLoadedFromStorageState) {
            final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content:
                    Text('There is no connection. Previous result loaded!'));

            // Scaffold.of(context).showSnackBar(snackBar);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Scaffold.of(context)
                // ignore: deprecated_member_use
                ..hideCurrentSnackBar()
                // ignore: deprecated_member_use
                ..showSnackBar(snackBar);
            });
            return listWidget(state.loadedWeather);
          }
          return SpinKitThreeBounce(
            color: Colors.white,
            size: 50,
          );
        }));
  }
}
