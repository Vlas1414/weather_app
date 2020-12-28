import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_example/constants/colorsConstant.dart';
import 'package:weather_example/constants/stringsConstant.dart';

import 'package:weather_example/cubit/weather_cubit.dart';
import 'package:weather_example/cubit/weather_state.dart';
import 'package:weather_example/widgets/bottom_list_view.dart';
import 'package:weather_example/widgets/detail_view.dart';
import 'package:weather_example/widgets/temp_view.dart';

/// Виджет отображения текущей погоды
/// dropdownValue - отображать дни либо часы
class BodyView extends StatelessWidget {
  final dropdownValue;
  BodyView({this.dropdownValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: const Alignment(0, 1),
          colors: [
            ColorsConstant.headBackgraund,
            ColorsConstant.bottomBackgraund,
          ],
          tileMode: TileMode.repeated,
        ),
      ),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          Widget listWidget(loadedWeather) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 50),
                TempView(snapshot: loadedWeather),
                const SizedBox(height: 50),
                DetailView(snapshot: loadedWeather),
                const SizedBox(height: 50),
                BottomListView(
                  snapshot: loadedWeather,
                  typeElements: dropdownValue,
                ),
              ],
            );
          }

          if (state is WeatherLoadedState) {
            return listWidget(state.loadedWeather);
          }
          if (state is WeatherLoadedFromStorageState) {
            final snackBar = const SnackBar(
              backgroundColor: ColorsConstant.red,
              content: const Text(StringsConstant.allertError),
            );

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
            color: ColorsConstant.white,
            size: 50,
          );
        },
      ),
    );
  }
}
