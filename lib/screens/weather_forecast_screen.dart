import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_example/constants/colorsApp.dart';
import 'package:weather_example/constants/textStyleApp.dart';
import 'package:weather_example/cubit/weather_cubit.dart';
import 'package:weather_example/widgets/body_view.dart';
import 'package:weather_example/widgets/title_appBar_view.dart';

/// Главный экран
/// weatherCubit - state bloc
class WeatherForecastScreen extends StatefulWidget {
  final WeatherCubit weatherCubit;
  WeatherForecastScreen(this.weatherCubit);
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  String dropdownValue = 'days';
  List<String> itemsFilter = ['days', 'hours'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => widget.weatherCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.headBackgraund,
          elevation: 0,
          title: TitleAppBarView(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.filter_alt, color: ColorsApp.white),
                iconSize: 24,
                elevation: 16,
                underline: Container(height: 0),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                selectedItemBuilder: (BuildContext buildContext) {
                  return itemsFilter.map<Widget>((String item) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text(
                        item.tr(),
                        style: TextStyleApp.size15.copyWith(
                          color: ColorsApp.white,
                        ),
                      ),
                    );
                  }).toList();
                },
                dropdownColor: Colors.white,
                items: itemsFilter.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value.tr(),
                        style: TextStyleApp.size16.copyWith(
                          color: ColorsApp.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: BodyView(dropdownValue: dropdownValue),
      ),
    );
  }
}
