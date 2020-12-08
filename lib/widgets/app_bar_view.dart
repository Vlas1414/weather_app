import 'package:flutter/material.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/widgets/city_view.dart';

AppBar appBarView(forecastObjectLocation, dropdownValue, updateDropdown) {
  List<String> itemsFilter = ['Days', 'Hours'];

  return AppBar(
    backgroundColor: Color.fromARGB(255, 32, 123, 228),
    elevation: 0,
    title: FutureBuilder<WeatherForecastLocation>(
      future: forecastObjectLocation,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CityView(snapshot: snapshot);
        } else {
          return Center(
              child: Text(
            'City not found',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ));
        }
      },
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.filter_alt, color: Colors.white),
          iconSize: 24,
          elevation: 16,
          underline: Container(height: 0),
          onChanged: (String newValue) {
            updateDropdown(newValue);
          },
          selectedItemBuilder: (BuildContext buildContext) {
            return itemsFilter.map<Widget>((String item) {
              return Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text(
                  item,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList();
          },
          dropdownColor: Colors.white,
          items: itemsFilter.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      )
    ],
    centerTitle: true,
    automaticallyImplyLeading: false,
  );
}
