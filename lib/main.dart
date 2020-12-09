import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_example/screens/splash_screen.dart';
import 'package:weather_example/utilities/custom_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.HEAD_OF_APP,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
