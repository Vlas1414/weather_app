import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_example/constants/colorsApp.dart';
import 'package:weather_example/constants/stringsApp.dart';

import 'package:weather_example/cubit/weather_cubit.dart';
import 'package:weather_example/cubit/weather_state.dart';
import 'package:weather_example/ui/widgets/bottom_list_view.dart';
import 'package:weather_example/ui/widgets/detail_view.dart';
import 'package:weather_example/ui/widgets/temp_view.dart';

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
            ColorsApp.headBackgraund,
            ColorsApp.bottomBackgraund,
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
              backgroundColor: ColorsApp.red,
              content: const Text(StringsApp.allertError),
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
            color: ColorsApp.white,
            size: 50,
          );
        },
      ),
    );
  }
}
